import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';

import 'constants.dart';

File? networkFile;

class NetworkLogInterceptor extends Interceptor {
  NetworkLogInterceptor() {
    initNetworkFile();
  }

  static Future<void> initNetworkFile() async {
    if (networkFile != null) return;
    Directory? directory;
    try {
      directory = await getTemporaryDirectory();
    }catch (e,s){
    }
    if(directory == null){
      directory = await getApplicationDocumentsDirectory();
      if(directory == null){
        directory = await getExternalStorageDirectory();
      }
    }
    if (directory != null) {
      startQueue();
      DateTime dateTime = DateTime.now();
      String filePath = directory.path +
          "/networkLog/" +
          dateTime.year.toString() +
          dateTime.month.toString() +
          dateTime.day.toString() +
          ".txt";
      String dirPath = directory.path + "/networkLog";
      Constants.networkLogDirPath = dirPath;
      Directory fileDirectory = Directory(dirPath);
      if (!fileDirectory.existsSync()) {
        fileDirectory.createSync();
      }
      if (!File(filePath).existsSync()) {
        File(filePath).createSync();
      }
      networkFile = File(filePath);
    }
    Constants.writeNetworkLog =
        SpUtil.getBool(Constants.writeNetworkLogEnable, defValue: false) ?? false;
  }

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (networkFile != null && Constants.writeNetworkLog) {
      String writeString;
      writeString = "\n${getTime()} 发起请求: ${options.method} ${options.uri}\n";
      writeString += mapAsString(options.headers, header: "请求头");
      writeString += mapAsString(options.extra, header: "Extras");
      if (options.method != 'GET') {
        final dynamic data = options.data;
        if (data != null) {
          if (data is Map) {
            writeString += mapAsString(options.data as Map?, header: '请求体');
          }
          if (data is FormData) {
            final formDataMap = <String, dynamic>{}
              ..addEntries(data.fields)
              ..addEntries(data.files);
            writeString += mapAsString(formDataMap,
                header: 'Form data | ${data.boundary}');
          } else {
            // writeString += "\n${data.toString()}\n";
          }
        }
      }
      queue.add(writeString);

      // await networkFile!.writeAsString(writeString,
      //     mode: FileMode.writeOnlyAppend, flush: true, encoding: utf8);
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (networkFile != null && Constants.writeNetworkLog) {
      String writeString;
      writeString =
          "\n${getTime()} 请求返回: ${response.requestOptions.method} ${response.requestOptions.uri} ${response.statusCode} ${response.statusMessage}\n";
      final responseHeaders = <String, String>{};
      response.headers
          .forEach((k, list) => responseHeaders[k] = list.toString());
      writeString += mapAsString(responseHeaders, header: "返回头");
      if (response.data != null) {
        writeString += "\n返回体\n╔ \n";
        writeString += response.data.toString() + "\n╚\n";
      }
      queue.add(writeString);

      // await networkFile!.writeAsString(writeString,
      //     mode: FileMode.writeOnlyAppend, flush: true, encoding: utf8);
    }
    super.onResponse(response, handler);
  }

  String mapAsString(Map? map, {String? header}) {
    if (map == null || map.isEmpty) return "";

    String string = "\n╔ $header \n";
    map.forEach((dynamic key, dynamic value) {
      string += "\n${key.toString()}  ${value.toString()}\n";
    });
    string += "\n╚\n";

    return string;
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (networkFile != null && Constants.writeNetworkLog) {
      String writeString = "";
      if (err.type == DioErrorType.badResponse) {
        writeString =
            "${getTime()} 请求错误 ${err.response?.requestOptions.uri} Status: ${err.response?.statusCode} ${err.response?.statusMessage}";
        if (err.response != null && err.response?.data != null) {
          writeString += "\n返回体\n╔ \n";
          writeString += err.response?.data.toString() ?? "" + "\n╚\n";
        }
      } else {
        writeString = "${getTime()} 请求错误\n ${err.message}";
      }
      queue.add(writeString);
      // await networkFile!.writeAsString(writeString,
      //     mode: FileMode.writeOnlyAppend, flush: true, encoding: utf8);
    }
    super.onError(err, handler);
  }

  static Queue<String> queue = Queue();
  static bool loop = false;
  static String logBuffer = "";
  static DateTime dateTime = DateTime.now();

  static void startQueue() async {
    if (loop) {
      return;
    }
    loop = true;
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      if (queue.isNotEmpty &&
          networkFile != null &&
          Constants.writeNetworkLog) {
        logBuffer += queue.first;
        //长度大于1024才写  减少写入次数
        if (logBuffer.length > 1024 * 100) {
          // print(
          //     "开始写入${logBuffer.length}  ${DateTime.now().millisecondsSinceEpoch}");
          await compute(_writeFile, [networkFile!.path, logBuffer]);
          // print(
          //     "结束写入${logBuffer.length}  ${DateTime.now().millisecondsSinceEpoch}");

          dateTime = DateTime.now();
          logBuffer = "";
        }
        queue.removeFirst();
      } else if (Constants.writeNetworkLog &&
          queue.isEmpty &&
          logBuffer != "" &&
          (DateTime.now().millisecondsSinceEpoch -
                  dateTime.millisecondsSinceEpoch >
              1000 * 10)) {
        // print("10秒没写过了 写入一次");
        //如果队列为空 buffer里面有内容  并且已经30秒没写入过文件了
        await compute(_writeFile, [networkFile!.path, logBuffer]);
        dateTime = DateTime.now();
        logBuffer = "";
      }
    }
  }

  String getTime() {
    DateTime dateTime = DateTime.now();

    return "${dateTime.hour}:${dateTime.minute}:${dateTime.second}:${dateTime.millisecond.toString().padRight(3, " ")}";
  }
}

void _writeFile(List<String> list) async {
  File file = File(list[0]);
  await file.writeAsString(list[1],
      mode: FileMode.append, flush: true, encoding: utf8);
}

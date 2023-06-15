import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';

import 'crash_error_type.dart';

File? crashFile;

final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();

class CrashLogManager {
  CrashLogManager() {
    initCrashFile();
  }

  static Future<void> initCrashFile() async {
    if (crashFile != null) return;
    Directory? directory = await getTemporaryDirectory();
    if (directory != null) {
      startQueue();
      DateTime dateTime = DateTime.now();
      String filePath = directory.path +
          "/crashLog/" +
          dateTime.year.toString() +
          dateTime.month.toString() +
          dateTime.day.toString() +
          ".txt";
      String dirPath = directory.path + "/crashLog";
      Constants.crashLogDirPath = dirPath;
      Directory fileDirectory = Directory(dirPath);
      if (!fileDirectory.existsSync()) {
        fileDirectory.createSync();
      }
      if (!File(filePath).existsSync()) {
        File(filePath).createSync();
      }
      crashFile = File(filePath);
    }
    Constants.writeCrashLog = SpUtil.getBool(Constants.writeCrashLogEnable, defValue: true) ?? true;
  }

  static Future<Null> reportError(dynamic error, dynamic stackTrace) async {
    try {
      CrashLogManager.initCrashFile();
    } catch (e) {
      print('初始化失败');
    }
    Map<String, dynamic> _errMap = {
      '\n 发生时间': DateTime.now().toString(),
      '\n 错误类型': error.runtimeType.toString(),
      '\n error': ErrorParsing.errorStatus(error),
      '\n 设备信息': (await initPlatformState()).toString(),
      // '\n 用户信息': '${App.currentUser.toString()} \n ',
      '\n 错误详情': '${error.toString()} \n',
      '\n 堆栈跟踪': '${stackTrace.toString()}  \n',
    };
    if (kDebugMode) print('!!!!!!!! Exception: $_errMap');
    if (crashFile != null && Constants.writeCrashLog) {
      String writeString = _errMap.toString();
      queue.addFirst(writeString);
    }
  }

  static Map<String, dynamic> deviceData = {};

  static Future<Map<String, dynamic>> initPlatformState() async {
    if (deviceData.isNotEmpty) {
      return deviceData;
    }

    try {
      if (GetPlatform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (GetPlatform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{'Error:': 'Failed to get platform version.'};
    }
    return deviceData;
  }

  static Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      ' \n 最新补丁日期': '${build.version.securityPatch}',
      ' \n 操作系统名': '${build.version.baseOS ?? '安卓'}',
      ' \n sdkInt': '${build.version.sdkInt}',
      '\n Android版本': '${build.version.release} ',
      '\n 手机品牌 ': '${build.brand} ',
      '\n 手机详细版本': '${build.model} ',
      '\n 外观设计名 ': '${build.device} ',
      '\n 版本号': '${build.display} ',
      '\n 当前手机唯一标识': '${build.fingerprint} ',
      '\n 内核(单词简写)': '${build.hardware} ',
      '\n 主机名 ': '${build.host} ',
      '\n id': '${build.id} ',
      '\n supported32BitAbis': '${build.supported32BitAbis} ',
      '\n supported64BitAbis': '${build.supported64BitAbis} ',
      '\n supportedAbis': '${build.supportedAbis} ',
      '\n 是否真机': '${build.isPhysicalDevice} \n',
    };
  }

  static Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      '\n 设备名': '${data.name} ',
      '\n 操作系统名': '${data.systemName} ',
      '\n 系统版本': '${data.systemVersion} ',
      '\n 设备型号': '${data.model} ',
      '\n 设备名(本地)': '${data.localizedModel}',
      '\n 当前设备唯一值': '${data.identifierForVendor} ',
      '\n 是否真机': '${data.isPhysicalDevice} ',
      '\n 版本号': '${data.utsname.version} ',
      '\n 硬件类型': '${data.utsname.machine} \n',
    };
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
      if (queue.isNotEmpty && crashFile != null && Constants.writeCrashLog) {
        logBuffer = queue.first + logBuffer;
        //长度大于1024才写  减少写入次数
        if (logBuffer.length > 1024 * 100) {
          // print(
          //     "开始写入${logBuffer.length}  ${DateTime.now().millisecondsSinceEpoch}");
          await compute(writeFile, [crashFile!.path, logBuffer]);
          // print(
          //     "结束写入${logBuffer.length}  ${DateTime.now().millisecondsSinceEpoch}");

          dateTime = DateTime.now();
          logBuffer = "";
        }
        queue.removeFirst();
      } else if (Constants.writeCrashLog &&
          queue.isEmpty &&
          logBuffer != "" &&
          (DateTime.now().millisecondsSinceEpoch - dateTime.millisecondsSinceEpoch > 1000 * 10)) {
        // print("10秒没写过了 写入一次");
        //如果队列为空 buffer里面有内容  并且已经30秒没写入过文件了
        await compute(writeFile, [crashFile!.path, logBuffer]);
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

void writeFile(List<String> list) async {
  File file = File(list[0]);
  await file.writeAsString(list[1], mode: FileMode.append, flush: true, encoding: utf8);
}

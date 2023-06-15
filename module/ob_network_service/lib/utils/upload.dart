import 'dart:convert';
import 'dart:html' if (dart.library.io) 'html_stub.dart' as html;
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:http_parser/http_parser.dart';
import 'package:repository/backport/domain_factory.dart';
import 'package:repository/utils/net.dart';

class UploaderUtils {
  /// url: uri
  /// name: 名称
  /// filePath: 文件路径
  /// success: 上传成功回调
  /// fail: 上产失败回调
  /// progressCallback: 上传进度回调
  void start({
    required String url,
    required String name,
    required String filePath,
    required Function(UploadImageMod) success,
    required Function fail,
    bool use = false,
    ProgressCallback? progressCallback,
    bool avatar = false,
  }) async {
    try {
      //web端不支持MultipartFile
      //Unsupported operation: MultipartFile is only supported where dart:io is available.
      FormData? payload;
      if (kIsWeb) {
        List<int>? bytes = await file2uini8list(filePath);
        payload = FormData.fromMap({
          'file': MultipartFile.fromBytes(bytes,
              filename: '${DateTime.now().millisecondsSinceEpoch}.png',
              contentType: MediaType('image', 'png'))
        });
      } else {
        payload =
            FormData.fromMap({'file': await MultipartFile.fromFile(filePath)});
      }
      var response = await Net().dio.post<dynamic>(
        use ? DomainFactory.postUriDopedWithServer(url) : url,
        data: payload,
        onSendProgress: (int sent, int total) {
          if (progressCallback != null) {
            progressCallback(sent, total);
          }
        },
      );
      Map<String, dynamic> res = jsonDecode(response.toString());
      if (res['code'] == 200) {
        debugPrint('请求成功 ${response.toString()}');
        if (avatar) {
          success(UploadImageMod.fromMap(res['data']));
        } else {
          success(UploadImageMod(
              id: '0', imgUrl: res['data'] ?? "", topImageUrl: ""));
        }
      } else {
        fail(res['code'], res['msg']);
      }
    } catch (err) {
      fail(-10000,
          'your_server_is_lost_please_wait_a_few_minutes_and_try_again'.tr);
      debugPrint(err.toString());
    }
  }
}

Future<Uint8List> file2uini8list(filePath) async {
  var request = html.HttpRequest();
  request.responseType = 'blob';
  request.open('get', filePath);
  request.send();
  await request.onLoad.first;
  var heciBlob = request.response;
  var fileReader = html.FileReader();
  fileReader.readAsArrayBuffer(heciBlob);
  await fileReader.onLoad.first;
  dynamic data = fileReader.result;
  return data;
}

class UploadImageMod {
  UploadImageMod(
      {required this.imgUrl, required this.topImageUrl, required this.id});

  final String imgUrl;
  final String topImageUrl;
  final String id;

  UploadImageMod copyWith({
    String? imgUrl,
    String? topImageUrl,
    String? id,
  }) =>
      UploadImageMod(
          imgUrl: imgUrl ?? this.imgUrl,
          topImageUrl: imgUrl ?? this.topImageUrl,
          id: id ?? this.id);

  factory UploadImageMod.fromMap(Map<String, dynamic> json) => UploadImageMod(
      id: json['id'] is String ? json['id'] : "$json['id']",
      imgUrl: json['imgUrl'],
      topImageUrl: json['topImageUrl']);

  Map<String, dynamic> toMap() =>
      {'imgUrl': imgUrl, 'topImageUrl': topImageUrl, 'id': id};
}

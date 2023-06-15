import 'package:dio/io.dart';
import 'package:dio/dio.dart';

late final Dio simpleDio = Dio()
  ..applyMyOptions()
  ..ignoreX509Certificate();

extension MyDioExt on Dio {
  ///忽略证书验证
  void ignoreX509Certificate() {
    var adapter = (httpClientAdapter as DefaultHttpClientAdapter);
    adapter.onHttpClientCreate = (client) {
      client.badCertificateCallback = (certificate, host, port) {
        return true;
      };
      return client;
    };
  }

  ///网络参数设置
  void applyMyOptions() {
    options = BaseOptions(
      connectTimeout: Duration(milliseconds: 5 * 1000),
      receiveTimeout: Duration(milliseconds: 8 * 1000),
      sendTimeout: Duration(milliseconds: 8 * 1000),
    );
  }
}

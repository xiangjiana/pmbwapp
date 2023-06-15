import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';

abstract class ConfigGetDownloadUrl {
  static const String url = '/config/getDownloadUrl';

  static void post({
    Map<String, dynamic>? info,
    Options? options,
    Function(String data)? success,
    Function(int code, String msg)? fail,
  }) async {
    Net().post(
      url,
      options: options,
      info: info,
      success: (Response r) {
        success?.call(r.data['data']);
      },
      fail: (int code, String msg) {
        if (fail != null) {
          fail(code, msg);
        }
      },
    );
  }
}

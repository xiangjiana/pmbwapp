import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';

abstract class MainTryPlay {
  static const String url = '/main/tryPlay';

  static void post({
    parameters,
    Function? success,
    Function? fail,
  }) {
    Net().post(
      url,
      params: parameters,
      success: (Response r) {
        success?.call(ApiMainTryPlay.fromMap(r.data['data']));
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

class ApiMainTryPlay {
  ApiMainTryPlay({
    required this.url,
  });

  String url = '';

  factory ApiMainTryPlay.fromMap(Map<String, dynamic> map) {
    return ApiMainTryPlay(
      url: map['url'] as String,
    );
  }
}

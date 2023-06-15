import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';

abstract class ConfigGetCodeDownloadUrl {
  static const String url = '/config/getCodeDownloadUrl';

  static void post({
    Map<String, dynamic>? info,
    Options? options,
    Function(ApiConfigGetCodeDownloadUrl data)? success,
    Function(int code, String msg)? fail,
  }) async {
    Net().post(
      url,
      options: options,
      info: info,
      success: (Response r) {
        success?.call(ApiConfigGetCodeDownloadUrl.fromMap(r.data['data']));
      },
      fail: (int code, String msg) {
        if (fail != null) {
          fail(code, msg);
        }
      },
    );
  }
}

class ApiConfigGetCodeDownloadUrl {
  final String downUrl;
  final String h5Url;
  final String merchantCode;
  final int merchantId;
  final String pcUrl;

  const ApiConfigGetCodeDownloadUrl({
    required this.downUrl,
    required this.h5Url,
    required this.merchantCode,
    required this.merchantId,
    required this.pcUrl,
  });

  factory ApiConfigGetCodeDownloadUrl.fromMap(Map<String, dynamic> map) {
    return ApiConfigGetCodeDownloadUrl(
      downUrl: map['downUrl'] as String,
      h5Url: map['h5Url'] as String,
      merchantCode: map['merchantCode'] as String,
      merchantId: map['merchantId'] as int,
      pcUrl: map['pcUrl'] as String,
    );
  }
}

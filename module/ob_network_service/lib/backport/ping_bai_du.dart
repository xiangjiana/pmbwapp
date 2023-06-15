import 'package:dio/dio.dart';
import 'package:repository/backport/http_ext.dart';

///ping百度官网，用于确定网络是否畅通
class PingBaiDu {
  static const url = 'https://www.baidu.com/y1979';

  static Future<bool> get() async {
    try {
      await simpleDio.get(url);
    } catch (e) {
      if (e is DioError && e.response != null) {
        return true;
      }
    }
    return false;
  }
}

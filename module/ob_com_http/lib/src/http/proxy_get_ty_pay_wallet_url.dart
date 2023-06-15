import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';

///钱包模式
abstract class ProxyGetTyPayWalletUrl {
  static const String url = '/proxy/getTyPayWalletUrl';

  ///[bizType] OB旗舰代理必填,充值类型(6=佣金充值,7=额度充值,8=代客充值)
  static void post(
    String deviceNo,
    int bizType, {
    Function(String)? success,
    Function(int, String)? fail,
  }) {
    Net().post(
      url,
      params: {
        'deviceNo': deviceNo,
        'bizType': bizType,
      },
      success: (Response r) {
        success?.call(r.data['data']['url']);
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

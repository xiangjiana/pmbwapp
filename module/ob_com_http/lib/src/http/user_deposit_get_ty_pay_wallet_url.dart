import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';

///钱包模式
abstract class UserDepositGetTyWalletUrl {
  static const String url = '/userDeposit/getTyPayWalletUrl';

  static void post(
    String deviceNo, {
    Function(String)? success,
    Function(int, String)? fail,
  }) {
    Net().post(
      url,
      params: {'deviceNo': deviceNo},
      success: (Response r) {
        success?.call(r.data['data']['url']);
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

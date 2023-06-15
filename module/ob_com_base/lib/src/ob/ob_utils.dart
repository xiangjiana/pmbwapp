import 'package:ob_com_base/ob_com_base.dart';

abstract class ObUtils {
  ///OBQJ,MB,DJ
  static String getAppPayMerchant() {
    if (Store.clientId == Store.clientIdDJ) {
      return 'DJ';
    }
    if (Store.clientId == Store.clientIdMB) {
      return 'MB';
    }
    return 'OBQJ';
  }

  // 产品要求 必须是 OBQJ,MB,DJ 才匹配  ,分割 全部为大写才校验通过， 其他情况一律不认
  static bool checkPayMerchant(String payMerchant) {
    if (payMerchant.isEmpty) return false;

    // 去掉匹配，切换参数暂不再使用
    // String prodStr = getAppPayMerchant();
    // List<String> list = payMerchant.split(',');
    // for (String element in list) {
    //   if (element == prodStr) return true;
    // }
    return false;
  }
}

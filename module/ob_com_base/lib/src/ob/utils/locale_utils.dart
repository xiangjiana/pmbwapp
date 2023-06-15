import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';

class LocaleUtils {

  static bool get isLocale => Get.locale?.languageCode != "zh";

  static String get currencyDefault {
    return Currency.CN.symbol;
  }

  ///动态货币符号
  static String get currency {
    var langCCode = SpUtil.getString("saveLocaleCountryCode")!;
    switch (langCCode) {
      case "CN":
        return Currency.CN.symbol;
      case "US" :
        return Currency.US.symbol;
      case "VN" :
        return Currency.VN.symbol;
      case "TH" :
        return Currency.TH.symbol;
      default:
        return Currency.CN.symbol;
    }
  }

  ///根据货币类型获取手机区号
  static String get areaCode {
    switch (Store.merchantCurrency) {
      case "CNY":
        return "+86";
      case "THB":
        return "+66";
      case "VND":
        return "+84";
      default:
        return "+86";
    }
  }
}

enum Currency { CN, US, VN, TH }

extension CurrencyExtension on Currency {

  String get symbol => ['¥', '\$', '₫', '฿'][index];
}

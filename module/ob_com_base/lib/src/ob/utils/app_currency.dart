import 'package:flavor/flavor.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';

class AppCurrencyUtils {
  static String getAppCurrencyMerchantId() {
    String currency = SpUtil.getString(Constants.appCurrency,
        defValue: Store.merchantCurrency)!;

    var m = Flavor.I.getObject(MERCHANT_ID);
    var ID;
    if (m != null && (m is Map)) {
      ID = m[currency];
      if (ID == null) {
        currency = Tools.getConfigFromFlavor(MERCHANT_CURRENCY)!;
        ID = m[currency] ?? '';
        SpUtil.putString(Constants.appCurrency, currency);
        Store.merchantCurrency = currency;
      }
    }
    return ID ?? '';
  }

  static String getAppCurrencySymbol() {
    String symbol = "";
    String currency = SpUtil.getString(Constants.appCurrency,
        defValue: Store.merchantCurrency)!;
    if (currency == 'CNY') {
      symbol = "￥";
    } else if (currency == 'VND') {
      symbol = "₫";
    } else if (currency == 'THB') {
      symbol = "฿";
    }
    return symbol;
  }

  static String getAppCurrencySymbol2() {
    String currency = SpUtil.getString(Constants.appCurrency, defValue: Store.merchantCurrency)!;
    return currency;
  }

  static bool getAppCurrencySymbolIsVND() {
    return getAppCurrencySymbol() == "₫";
  }

  static bool getAppCurrencySymbolIsTHB() {
    return getAppCurrencySymbol() == "฿";
  }

  static String formatNum(dynamic nums, int postion) {
    var num;
    if (nums is double) {
      num = nums;
    } else {
      num = double.parse(nums.toString());
    }
    if ((num.toString().length - num.toString().lastIndexOf(".") - 1) <
        postion) {
      return num.toStringAsFixed(postion)
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString();
    } else {
      return num.toString()
          .substring(0, num.toString().lastIndexOf(".") + postion + 1)
          .toString();
    }
  }

  static String dealBalance(String curtotalBalance) {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      if (curtotalBalance != "--") {
        curtotalBalance = "${double.parse(curtotalBalance) / 1000.0}";
      }
    }
    return numberFormat(curtotalBalance) +
        "${AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "K" : ""}";
  }

  static String fixAmount(String? value, {String suffix = ''}) {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      return (NullUtils.toDouble(value) / 1000.0).toStringAsFixed(2) + suffix;
    } else if (AppCurrencyUtils.getAppCurrencySymbolIsTHB()) {
      return "฿" + numberFormat(NullUtils.toDouble(value));
    } else {
      return numberFormat(NullUtils.toDouble(
          value)); //NullUtils.toDouble(value).toInt().toString();
    }
  }

  static String fixAmount2(int? value, {String suffix = ''}) {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      return (NullUtils.toDouble(value?.toString()) / 1000.0)
              .toStringAsFixed(2) +
          suffix;
    } else {
      return NullUtils.toDouble(value?.toString()).toInt().toString();
    }
  }

  static String fixAmount3(String? value, {String suffix = ''}) {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      return (NullUtils.toDouble(value) / 1000.0).toStringAsFixed(2) + suffix;
    } else if (AppCurrencyUtils.getAppCurrencySymbolIsTHB()) {
      return numberFormat(NullUtils.toDouble(value),comma: false);
    } else {
      return numberFormat(NullUtils.toDouble(
          value),comma: false); //NullUtils.toDouble(value).toInt().toString();
    }
  }
}

import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';
import 'package:repository/utils/device_type.dart';

enum DiscountEnum {
  banner,
  discount,
  invite,
}

class ToolKit {
  ToolKit._privateConstructor();

  static final ToolKit _instance = ToolKit._privateConstructor();

  static ToolKit get instance => _instance;

  String addSignatureForActivityUrl(
      {required String link, required DiscountEnum type, String? id}) {
    if (link.isEmpty) return "";
    String lang= SpUtil.getString("LanguageCode",defValue:'zh_CN')??"zh_CN";
    String totalLink = link;
    if (totalLink == '') {
      return totalLink;
    }
    String userToken = SpUtil.getString("token", defValue: '') ?? '';
    String tokenPara = 'token=$userToken';
    if (totalLink.contains('?')) {
      if (totalLink.endsWith('?')) {
        totalLink += tokenPara;
      } else {
        totalLink += '&';
        totalLink += tokenPara;
      }
    } else {
      totalLink += '?';
      totalLink += tokenPara;
    }
    final AuthService authService = Get.find<AuthService>();
    int time = DateTime.now().millisecondsSinceEpoch;
    final vipLevel = authService.vipLevel;
    final deviceType = InstallDeviceType.deviceType;
    final deviceId = InstallDeviceType.platFormInfo.deviceId;
    final currency = SpUtil.getString(Constants.appCurrency, defValue: Store.merchantCurrency);
    String merchantId = AppCurrencyUtils.getAppCurrencyMerchantId();
    if (id != null && id.length > 0) {
      totalLink += "&id=$id";
    }
    totalLink += "&viplevel=$vipLevel&client=$deviceType&deviceNo=$deviceId&time=$time";

    if (type == DiscountEnum.invite) {
      int agent = authService.isAgent.value ? 0 : 1;
      totalLink += "&agent=$agent";
    }

    totalLink += "&lang=$lang&currency=$currency&merchantId=$merchantId&template=b";

    // DiscountEnum.banner 传进来的link 必须带id
    // 完整为 "https://www.activity.io?token=abc&id=123&client=2&deviceNo=123&time=$123&lang=$zh_CN&currency=$CNY&merchantId=$123"

    // DiscountEnum.discount
    // 完整为 "https://www.activity.io?token=abc&id=123&client=2&deviceNo=123&time=$123&lang=$zh_CN&currency=$CNY&merchantId=$123"

    // DiscountEnum.invite
    // 完整为 "https://www.activity.io?token=abc&id=123&client=2&deviceNo=123&time=$123&lang=$zh_CN&currency=$CNY&merchantId=$123"

    return totalLink;
  }
}

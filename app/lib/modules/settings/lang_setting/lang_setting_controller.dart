import 'dart:async';
import 'dart:ui';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_package/initializer/js_initializer.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:ob_package/utils/ob_channel/ob_channel_manager.dart';
import 'package:sp_util/sp_util.dart';
import 'package:repository/utils/net.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_repository.dart';
import '../../../login_game/login_game.dart';
import '../../home/components/mine_widget_new/mine_new_controller.dart';
import '../../home_modules/home_main/main_controller.dart';
import '../../records/discount/discount_activity_controller.dart';
import '../../records/discount/discount_controller.dart';
import 'dart:html'
    if (dart.library.io) 'package:ob_com_base/src/ob/utils/html_stub.dart'
    as html;
import 'dart:io'
    if (dart.library.html) 'package:ob_com_base/src/ob/utils/js_stub.dart'
    as dartIO;

class LangSettingController extends GetxController {
  RxString langCode = "zh_CN".obs;
  List<Language> data = [];
  var langList = <Lang>[].obs;

  final mineNewController = Get.put(MineNewController(Get.find()));
  bool isOpenLanguage = false;
  RxInt checkNum = 1.obs;

  // [
  //   Lang("跟随系统", "xitong", "zh", "CN", true),
  //   Lang("简体中文", "zh", "zh", "CN", false),
  //   Lang("简体中文", "zh", "zh", "CN", false),
  //   Lang("English", "En", "en", "us", false),
  //   Lang("Tiếng Việt", "TV", "th", "", false),
  //   Lang("ไทย", "L", "lh", "", false),
  // ];

  @override
  onInit() {
    super.onInit();
    langList.clear();
    String localeName;
    if (kIsWeb) {
      localeName = html.window.navigator.language
          .replaceAll("-", "_"); //web平台的是zh-CN，是中划线不是下划线，需要替换
      //web端返回的语言有时候是en_CN的形式（手机改变当前语言时候会出现）导致一些语言
      if (localeName.split("_")[0] == 'zh') {
        localeName = 'zh_CN';
      } else if (localeName.split("_")[0] == 'en') {
        localeName = 'en_US';
      } else if (localeName.split("_")[0] == 'vi') {
        localeName = 'vi_VN';
      } else if (localeName.split("_")[0] == 'th') {
        localeName = 'th_TH';
      }
    } else {
      localeName = dartIO.Platform.localeName;
    }
    var langCCode = localeName.split("_")[0];
    var countryCode = '';
    if (localeName.split("_").length >= 2) {
      countryCode = localeName.split("_")[1];
    }
    if (langCCode == '') {
      langCCode = 'zh';
      countryCode = 'CN';
    }
    if (countryCode == '') {
      if (langCCode == 'zh') {
        countryCode = 'CN';
      } else if (langCCode == 'en') {
        countryCode = 'US';
      } else if (langCCode == 'vi') {
        countryCode = 'VN';
      } else if (langCCode == 'th') {
        countryCode = 'TH';
      } else {
        langCCode = 'zh';
        countryCode = 'CN';
      }
    }
    SpUtil.putString('countryCode_dev', countryCode);
    SpUtil.putString('langCode_dev', countryCode);

    langCode.value = SpUtil.getString("saveLocaleLanguageCode")!;
    checkNum.value = SpUtil.getInt("checkNum", defValue: -1) ?? -1;

    var data =
        Flavor.I.getObject(MERCHANT_SUPPORT_LANG)! as List<Map<String, String>>;
    var langListI = <Lang>[];
    //判断设备语言app是否支持，如果不支持那么用币种语言
    if (data.where((element) => element["langCode"] == localeName).length ==
        0) {
      if (Store.merchantCurrency == 'CNY') {
        langCCode = 'zh';
        countryCode = 'CN';
      } else if (Store.merchantCurrency == 'THB') {
        langCCode = 'th';
        countryCode = 'TH';
      } else if (Store.merchantCurrency == 'VND') {
        langCCode = 'vi';
        countryCode = 'VN';
      }
    }
    langListI.add(
      Lang("system_language".tr, langCCode + '_' + countryCode, langCCode,
          countryCode, langCode.value == countryCode),
    );
    for (int i = 0; i < data.length; i++) {
      var itemData = data[i];
      langListI.add(
        Lang(
          itemData["langName"],
          itemData["langCode"],
          itemData["langCode"]?.split("_")[0],
          itemData["langCode"]?.split("_")[1],
          false,
        ),
      );
    }
    for (int i = 0; i < langListI.length; i++) {
      if (langCode.value == langListI[i].langCode?.split("_")[0]) {
        checkNum.value = i;
      }
    }
    langListI.insert(0, langListI.removeAt(checkNum.value));
    checkNum.value = 0;
    langList.value = langListI;
  }

  void choseLang(String code, int pos) {
    String languageCode = "";
    String countryCode = "";
    for (int i = 0; i < langList.length; i++) {
      langList[i].check = false;
      if (code == langList[i].langCode && pos == i) {
        languageCode = langList[i].locale1 ?? '';
        countryCode = langList[i].locale2 ?? '';
        Get.updateLocale(Locale(languageCode, countryCode));
        langList[i].check = true;
        checkNum.value = i;
        langCode.value = langList[i].langCode ?? '';
        if (i == 0) {
          SpUtil.putInt("isSys", 1);
        } else {
          SpUtil.putInt("isSys", 0);
        }
      }
    }
    SpUtil.putString("saveLocaleLanguageCode", "");
    SpUtil.putString("saveLocaleLanguageCode", languageCode);
    SpUtil.putString("saveLocaleCountryCode", "");
    SpUtil.putString("saveLocaleCountryCode", countryCode);
    SpUtil.putString("LanguageCode", code);
    SpUtil.putInt("checkNum", pos);
    OBChannelManager.instance.sendEventToNative(
        NativeEvent.syncNativeLanguages, {"languages": languageCode});
    Net().setHeader = {
      'lang': code,
    };
    Store.curLanguageCode.value = languageCode;
    checkNum.value = pos;
    langCode.value = languageCode;
    //如果是web那么设置web的相关语言显示
    setJsLanguageData();
    final promotionController = Get.findOrNull<PromotionController>();
    Get.findOrNull<DiscountActivityController>()?.resetData();
    if (promotionController != null) {
      promotionController.tabTitle = "discount".tr;
      promotionController.getActivityData();
    }
    Get.back();
    Get.findOrNull<MainController>()?.getMainMerchantGameListPost();
    mineNewController.getLan();
    mineNewController.setListTies();
    updateBanner();
  }

  updateBanner() async {
    Get.find<MainController>().getRecommendBanner();
  }
}

class Lang {
  String? langTitle;
  String? langCode;
  String? locale1;
  String? locale2;
  bool? check;

  Lang(this.langTitle, this.langCode, this.locale1, this.locale2, this.check);
}

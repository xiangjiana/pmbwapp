import 'dart:async';
import 'dart:convert';

import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/ob_com_base.dart';
import '../modules/web_iframe/ui_fake.dart' if (dart.library.html) 'dart:js'
    as js;

//初始化js相关的
class JsInitializer extends AppInitializer {
  @override
  FutureOr<void> init() {
    //如果的web环境并且test环境，那么开启vConsole
    if (kIsWeb && Flavor.I.getString(API_TYPE) == "test") {
      js.context.callMethod("enableVConsole", []);
    }
    setJsLanguageData();
  }
}
//设置JS端部分的多语言
setJsLanguageData(){
  Map<String,String> languageData={
    "appName":Tools.getAppName(),
    "keep_screen_vertical_for_good_experience":"keep_screen_vertical_for_good_experience".tr,
    "for_good_experience":"for_good_experience".tr,
    "keep_screen_vertical":"keep_screen_vertical".tr,
    "long_press_to_save":"long_press_to_save".tr,
    "tap_to_save":"tap_to_save".tr,
  };
  
  if (kIsWeb) {
    js.context.callMethod("setLanguageData", [jsonEncode(languageData)]);
  }
}
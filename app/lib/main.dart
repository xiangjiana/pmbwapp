import 'dart:async';
import 'dart:ui';

import 'package:cool_ui/cool_ui.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.mapper.g.dart' show modelsGeneratedAdapter;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/initializer/api_initializer.dart';
import 'package:ob_package/initializer/app_initializers.dart';
import 'package:ob_package/initializer/debug_initializer.dart';
import 'package:ob_package/initializer/dio_initializer.dart';
import 'package:ob_package/initializer/getx_initializer.dart';
import 'package:ob_package/initializer/home_route_initializer.dart';
import 'package:ob_package/initializer/js_initializer.dart';
import 'package:ob_package/initializer/login_initializer.dart';
import 'package:ob_package/initializer/network_initializer.dart';
import 'package:ob_package/initializer/ob_agent_initializer.dart';
import 'package:ob_package/initializer/proxy_initializer.dart';
import 'package:ob_package/initializer/sp_initializer.dart';
import 'package:ob_package/initializer/third_platform_config_initializer.dart';
import 'package:ob_package/initializer/tools_initializer.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:repository/utils/net.dart';
import 'package:sp_util/sp_util.dart';
import 'flavor/properties.dart';
import 'main.mapper.g.dart';
import 'modules/debug/launch/route_observer.dart';
import 'routes/app_pages.dart';
import 'dart:html'
    if (dart.library.io) 'package:ob_com_base/src/ob/utils/html_stub.dart'
    as html;
import 'dart:io'
    if (dart.library.html) 'package:ob_com_base/src/ob/utils/js_stub.dart'
    as dartIO;

void main() {
  Flavor.create(
    Environment.beta,
    color: Colors.green,
    name: '测试',
    properties: properties['test'],
  );
  setupApp();
}

void setupApp() {
  runZonedGuarded(() async {
    MockBinding.ensureInitialized();
    initializeJsonMapper(adapters: [modelsGeneratedAdapter]) ;
    //兼容android  SystemUiOverlayStyle 虚拟按键处理
    if (GetPlatform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        //状态栏 背景透明
        //虚拟按键背景色
        systemNavigationBarIconBrightness: Brightness.light,
        //虚拟按键图标色
        statusBarIconBrightness: Brightness.light,
        statusBarBrightness: Brightness.light,
      );
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    } else {
      //ios
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    }
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
    );

    await AppInitializers({
      ThirdPlatformConfigInitializer(),
      DebugInitializer(),
      GetxInitializer(),
      SpInitializer(),
      ProxyInitializer(),
      ApiInitializer(),
      DioInitializer(),
      NetworkInitializer(),
      LoginInitializer(),
      HomeRouteInitializer(),
      OBAgentInitializer(),
      ToolsInitializer(),
      JsInitializer(),
    }).init();
    runMockApp(KeyboardRootWidget(child: MyApp(),)); // 初始化
  }, (exception, stackTrace) async {
    //以便web端debug看到错误信息
    if (kIsWeb && !kReleaseMode) {
      throw exception;
    }
  });
}

//web兼容鼠标控制横向拖动滚动
class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
        // etc.
      };
}

class MyApp extends StatelessWidget {
  ObTranslations getObTranslations() {
    String symbol = AppCurrencyUtils.getAppCurrencySymbol();
    ObTranslations obTranslations = ObTranslations();
    obTranslations.translationsMap.forEach((lang, value) {
      value.forEach((key, value) {
        obTranslations.translationsMap[lang]![key] =
            value.replaceAll('¥', symbol).replaceAll("￥", symbol);
      });
    });
    return obTranslations;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    CustomNumberKeyboard.register();
    return ScreenUtilInit(
      designSize: Size(375, 750),
      builder: (ctx, widget) => GetMaterialApp(
        title: Tools.getAppName(),
        scrollBehavior: MyCustomScrollBehavior(),
        //解决web端鼠标滑动表现跟app不一致不能横向滑动等问题，经测试不影响app端
        translations: getObTranslations(),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          ChineseCupertinoLocalizations.delegate,
          RefreshLocalizations.delegate,
        ],
        onInit: () async {
          if (GetPlatform.isWeb) {
            setJsLanguageData();
            return;
          }
          try {
            //初始化安装数据
            if (!(SpUtil.haveKey('is_open_cache') ?? false)) {
              bool isOpenCache = await PermissionUtils.requestMultiPermission();
              SpUtil.putBool('is_open_cache', isOpenCache);
            }
            Net().openCache = SpUtil.getBool('is_open_cache') ?? false;
          } catch (_) {}
        },
        onReady: () {
          if (GetPlatform.isWeb) {
            SystemChrome.setApplicationSwitcherDescription(ApplicationSwitcherDescription(
              label: Tools.getAppName()
            ));
          }
        },
        defaultTransition: Transition.rightToLeft,
        locale: getInitLocale(),
        fallbackLocale: Locale('en', 'US'),
        supportedLocales: [
          const Locale('zh', 'CN'),
          const Locale('en', 'US'),
          const Locale('th', 'TH'),
          const Locale('ms', 'MY'),
          const Locale('vi', 'VN'),
        ],
        // 添加一个回调语言选项，以备上面指定的语言翻译不存在
        theme: ThemeUtil.light(),
        // TODO: Agent
        // getPages: AppPages.pages + LoginPages.pages + AgentAppPages.pages,
        getPages: AppPages.pages + LoginPages.pages,
        initialRoute: HomeRouteInitializer.initialRoute,
        routingCallback: (routing) {
          if (routing == null || routing.current == '/') {
            NativeUtils.applyNavigationBarColor(1);
          } else {
            NativeUtils.applyNavigationBarColor(-1);
          }
        },
        // localeResolutionCallback: (deviceLocale, supportedLocales) {
        //   SpUtil.putString('countryCode_dev', deviceLocale?.countryCode ?? '');
        //
        //   SpUtil.putString('langCode_dev', deviceLocale?.languageCode ?? '');
        // },
        navigatorObservers: [
          routeObserver,
          ToastObserver(),
          LaunchObserver(),
        ],
        builder: ToastManager.initWithParameters(builder: (context, widget) {
          if (GetPlatform.isAndroid) {
            // TODO: Agent
            // if (Get.currentRoute == AppRoutes.WEB ||
            //     Get.currentRoute == AgentAppRoutes.AGENT_WEB) {
            if (Get.currentRoute == AppRoutes.WEB) {
              //去掉GestureDetector  会引起复制粘贴问题
              return MediaQuery(
                ///设置文字大小不随系统设置改变
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: widget!,
              );
            }
          }

          var dataM = MediaQuery.of(context);
          var viewInsets = dataM.viewInsets;
          if (GetPlatform.isIOS) {
            /// 在 iOS 7 plus上 偶发频繁切回应用出现  MediaQuery.of(context).viewInsets  bottom数据错误问题
            /// 在系统浏览器唤出 键盘bottom 数值会是 226，导致界面底部被截
            if (dataM.viewInsets.bottom > 200 &&
                Store.needUpdateKeyBoardBottom) {
              viewInsets = viewInsets.copyWith(bottom: 0.0);
            }
            Store.needUpdateKeyBoardBottom = false;
          }

          if (kIsWeb) {
            viewInsets = viewInsets.copyWith(bottom: 0.0);
          }

          return GestureDetector(
            onTap: () {
              hideKeyboard(context);
            },
            child: MediaQuery(
              ///设置文字大小不随系统设置改变
              data:
                  dataM.copyWith(textScaleFactor: 1.0, viewInsets: viewInsets),
              child: widget!,
            ),
          );
        }),
      ),
    );
  }

  Locale getInitLocale() {
    String saveLocaleLanguageCode =
        SpUtil.getString("saveLocaleLanguageCode") ?? '';
    String saveLocaleCountryCode =
        SpUtil.getString("saveLocaleCountryCode") ?? '';
    var langCCode = 'zh';
    var countryCode = 'CN';
    var localLan = Flavor.I.getString(MERCHANT_CURRENCY)!;
    if (localLan == 'CNY') {
      langCCode = 'zh';
      countryCode = 'CN';
    } else if (localLan == 'THB') {
      langCCode = 'th';
      countryCode = 'TH';
    } else if (localLan == 'VND') {
      langCCode = 'vi';
      countryCode = 'VN';
    }
    Locale currentLocale = Locale(langCCode, countryCode);
    if (saveLocaleLanguageCode.isNotEmpty) {
      Locale loc = Locale(saveLocaleLanguageCode);
      if (SpUtil.getInt("isSys") == 1) {
        String localeName;
        if (kIsWeb) {
          localeName = html.window.navigator.language.replaceAll("-", "_");
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
        var data = Flavor.I.getObject(MERCHANT_SUPPORT_LANG)!
            as List<Map<String, String>>;
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
        loc = Locale(langCCode, countryCode);
        currentLocale = loc;
      } else {
        loc = Locale(saveLocaleLanguageCode, saveLocaleCountryCode);
        List<Map<String, String>> supportLang = Flavor.I
            .getObject(MERCHANT_SUPPORT_LANG)! as List<Map<String, String>>;
        var res = supportLang.where((element) =>
            element["langCode"] == "${loc.languageCode}_${loc.countryCode}");
        if (res.length > 0) {
          currentLocale = loc;
        }
      }
    }
    SpUtil.putString("LanguageCode",
        "${currentLocale.languageCode}_${currentLocale.countryCode}");
    SpUtil.putString("saveLocaleLanguageCode", currentLocale.languageCode);
    SpUtil.putString("saveLocaleCountryCode", currentLocale.countryCode ?? '');
    Store.curLanguageCode = currentLocale.languageCode.obs;
    Get.locale = currentLocale;
    return currentLocale;
  }

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }
}

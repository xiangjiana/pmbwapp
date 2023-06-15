// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_package/initializer/network_initializer.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home/components/mine_widget/mine_controller.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_package/modules/welcome/welcome_manager.dart';
import 'package:ob_package/utils/constants2.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:ob_package/utils/ob_channel/ob_channel_manager.dart';
import 'package:ob_package/utils/store2.dart';
import 'package:ob_package/utils/web_util2.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:repository/utils/env.dart';
import '../modules/home/components/capital/capital_controller.dart';
import '../modules/home/components/mine_widget_new/mine_new_controller.dart';
import '../modules/home_modules/home_main/main_controller.dart';
import '../modules/home_modules/home_marquee/marquee_controller.dart';
import '../modules/records/discount/discount_activity_controller.dart';

class LoginInitializer extends AppInitializer with LoginCallback, BaseCallback {
  @override
  FutureOr<void> init() async {
    BaseX.instance.baseCallback = this;
    LoginX.instance.loginCallback = this;
    LoginX.instance.flavor = Flavor.I;
    Invitation.getInvitationData();
    Store.clientId = Store.clientIdPG;
    Store.clientChildId = AppMerchantUtils.curMerchantTypes();
    Store.memberCustomerUrl = Flavor.I.getString(MEMBER_CUSTOMER_URL)!;
    ObTheming.init();
    Constants.init();
    //GameUtils().onGameTypeList({"type":"get"});
    OBChannelManager.setup();
  }

  @override
  void AgentTools_resetAgentPayPasswordKey() {
    // TODO: Agent
    // AgentTools.resetAgentPayPasswordKey();
  }

  @override
  String Env_merchantId() {
    return Env.merchantId;
  }

  @override
  void HomeGameManager_refreshAllData() {
    Get.findOrNull<DiscountActivityController>()?.resetData();
    // HomeGameManager.instance.refreshAllData();
  }

  @override
  void HomeGameManager_startRefreshTimer() {
    // HomeGameManager.instance.startRefreshTimer();
  }

  @override
  void HomeWidgetAutoRefreshManager_startRefreshTimer() {
    HomeWidgetAutoRefreshManager.instance.startRefreshTimer();
  }

  @override
  void MineController_refreshInfo() {
    if (Get.isRegistered<MineController>()) {
      Get.find<MineController>().refreshInfo();
    }
    if (Get.isRegistered<CapitalController>()) {
      Get.find<CapitalController>().refreshInfo();
    }
    if (Get.isRegistered<MineNewController>()) {
      Get.find<MineNewController>().refreshInfo();
    }
  }

  @override
  void OBChannelManager_systemInfo() {
    OBChannelManager.instance.sendEventToNative(NativeEvent.systeminfo, {});

    OBChannelManager.instance.sendEventToNative(NativeEvent.syncNativeLanguages,
        {"languages": Get.locale?.languageCode ?? "en"});
  }

  @override
  void WelcomeManager_getConfigStartPagePost() {
    WelcomeManager.getConfigStartPagePost();
  }

  @override
  void WelcomeManager_init() {
    WelcomeManager.init();
  }

  @override
  void gotoHomePage() {
    Get.find<MarqueeController>().setMarqueeShow();
    if (Get.isRegistered<HomePageController>()) {
      Get.back();
      Store.showDow.value = true;
      Get.find<HomePageController>().onTap(0);
      Get.find<MainController>().initData();
    }
    // Get.offAllNamed(AppRoutes.HOME);
  }

  @override
  void gotoMinePage() {
    if (Get.isRegistered<HomePageController>()) {
      Get.find<HomePageController>().onTap(3);
    }
  }

  @override
  void initActivityType() {
    // final loginRepository = Get.find<LoginRepository>();
    // runCatch(() async {
    //   Store.activityTypes = await loginRepository.getActivityType();
    // }, onError: (_) async {
    //   Store.activityTypes = await loginRepository.getActivityType();
    // });
  }

  @override
  void initClientConfig() {
    final loginRepository = Get.find<LoginRepository>();
    Future<void> requestConfig() async {
      final resp = await loginRepository.getConfigClientConfigAll();
      /// banner
      final resBannerList = resp.configBannerRespDTOList;
      Store.bannerList.value = resBannerList;
      /// 字典
      final resDictInfoList = resp.configDictInfoList;
      if (resp.configDictInfoList.isNotEmpty) {
        resDictInfoList.forEach((element) {
          Store.dictionary[element.key] = element.value;
        });
      }

      /// 银行卡列表
      if (resp.bankCodeDtoList.isNotEmpty) {
        Store.banks = resp.bankCodeDtoList;
      }

      Store.registerDefaultVentureCode = resp.registerDefaultVentureCode;
    }

    runCatch(() async {
      await requestConfig();
    }, onError: (_) async {
      await requestConfig();
    });
  }

  @override
  void initHelpAllInfo() {
    // final loginRepository = Get.find<LoginRepository>();
    // runCatch(() async {
    //   Store.allHelp = await loginRepository.getHelpAllInfo();
    // }, onError: (_) async {
    //   Store.allHelp = await loginRepository.getHelpAllInfo();
    // });
  }

  @override
  void onObLoginFailed(int code, String msg) {}

  @override
  void onObRegister(
    String username,
    String registerReference,
    String invitationCode,
    String friendInvitationCode,
  ) {
    // HubAdapter().captureMessage(
    //   'onObRegister->username=$username->registerReference=$registerReference->invitationCode=$invitationCode->friendInvitationCode=$friendInvitationCode',
    //   level: SentryLevel.info,
    // );
  }

  @override
  void onObLoginSuccess(String obToken) {}

  @override
  void Constants_init() {
    Constants2.init();
  }

  @override
  void Store_init() {
    Store2.init();
  }

  @override
  void onPausePatrolRequest() {
    // HomeGameManager.instance.cancelRefreshTimer();
    HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
  }

  @override
  void onRestorePatrolRequest() {
    if (Get.isRegistered<MineController>()) {
      Get.find<MineController>().refreshInfo();
    }
    // HomeGameManager.instance.startRefreshTimer();
    HomeWidgetAutoRefreshManager.instance.startRefreshTimer();
  }

  @override
  void HomePageController_jumpToPage0() {
    if (Get.isRegistered<HomePageController>()) {
      print("------------->空的---1");
      Get.find<HomePageController>().onTap(0);
      print("------------->空的---2");
    }
    Get.findOrNull<DiscountActivityController>()?.resetData();

  }

  @override
  void WebUtil_openGameInApp(
    String url, {
    required String gameId,
    String title = "",
    String gameCode = "",
    String gameType = "",
    bool testify = false,
  }) {
    WebUtil2.openGameInApp(url,
        gameId: gameId,
        title: title,
        gameCode: gameCode,
        testify: testify,
        gameType: gameType);
  }

  @override
  void rollBackOperation() {
    NetworkInitializer.rollBackOperation();
  }
}

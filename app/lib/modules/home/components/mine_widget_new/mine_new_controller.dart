import 'dart:async';

import 'package:exception/exception.dart';
import 'package:main/main.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_component/ob_component.dart';
import 'package:sp_util/sp_util.dart';
import 'package:user/user.dart';
import 'package:get_version/get_version.dart';

import '../../../home_modules/home_float/float_controller.dart';
import '../../../home_modules/home_main/main_controller.dart';
import '../../../home_modules/home_marquee/marquee_controller.dart';
import '../../home_controller.dart';
import '../controller/home_widget_auto_refresh_manager.dart';

bool isFirstMount = true;

class MineNewController extends GetxController {
  final AuthService authService;

  // TODO: Agent
  // final AgentNAgentLoginUtils loginUtils = AgentNAgentLoginUtils();
  final repository = Get.find<HomeRepository>();
  HomePageController homePageController = Get.find<HomePageController>();

  MineNewController(this.authService);

  RxBool isShowToolbar = false.obs;

  late InviteInviteConfigPostRespModel inviteConfig;

  int isActivityUnstarted = 0;

  RxBool get isAgent => authService.isAgent;

  bool get isTryPlay => authService.isTryPlay;

  bool get isActivityEntry {
    return Store.checkInviteActivityEntry > 0 && !isTryPlay;
  }

  ScrollController scrollController = ScrollController();

  List<Map> listTies = [];

  RxString currentLan = "".obs;
  String get vipLevel => authService.vipLevel;

  String get userName => authService.userName;

  bool get isAvatarHttpUrl => authService.isAvatarHttpUrl;

  String get userAvatarUrl => authService.userAvatarUrl;

  String get vipExperience => authService.vipExperience;

  String get vipLabel => authService.vipLabel;

  double get vipExperienceNum => authService.vipExperienceNum;

  bool get disabledAnimate => isFirstMount == false;
  final versioNewMark = false.obs;
  final _version = ''.obs;
  get version => _version.value;

  set version(val) => _version.value = val;
  final mainApi = Get.find<MainApi>();

  void jumpToUserProfile() {
    authService.syncUser();
    Get.toNamed(AppRoutes.USER_PROFILE);
  }

  void jumpToAgent() async {
    // TODO: Agent
    // bool agentEnable = await checkAgentEnable();
    // if (agentEnable) {
    //   loginUtils.loginAgent();
    // } else {
    //   Get.toNamed(AgentAppRoutes.JOIN_US_AGENT);
    // }
  }

  Future<bool> checkAgentEnable() async {
    MemberInfo resp = await Get.find<UserApi>().info();
    return resp.entryAuthority == '1';
  }

  void refreshInfo() {
    BalanceManager.syncAll();
    update();
  }

  ///邀请活动配置
  void jumpToInviteActivity() async {
    if (GetPlatform.isWeb) {
      WebUtil.jumpToOffice();
      return;
    }

    runCatch(() async {
      if (Store.checkInviteActivityEntry.value == 1) {
        warnDialog('mine_activity_state_1'.tr);
        return;
      }

      if (Store.checkInviteActivityEntry.value == 2) {
        warnDialog('mine_activity_state_2'.tr);
        return;
      }

      inviteConfig = await repository.getInviteInviteConfigPost();
      //Store.inviteConfig = inviteConfig;

      Get.toNamed(AppRoutes.INVITE_DETAIL, arguments: inviteConfig);
    });
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'alert'.tr,
        content: tipMsg,
        cancelText: 'confirm'.tr,
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }

  @override
  void onInit() {
    super.onInit();
    scrollController.addListener(() {
      isShowToolbar.value = scrollController.offset > 40;
    });
    getLan();
    setListTies();
    runCatch(() async {
      version = await GetVersion.projectVersion;
      final res = await UpdateUtil.getVersionAndCheckIfHasNew();
      versioNewMark.value = res != null;
    }, onError: (_) {});
    BalanceManager.syncAll();
    if (kIsWeb) {
      isFirstMount = false;
    }
  }

  @override
  void onClose() {
    scrollController.dispose();
    isFirstMount = false;
    super.onClose();
  }

  void setListTies() {
    listTies = [
      {
        'title': 'chose_lang'.tr,
        'icon': Assets.images.icon.iconLanguage3x.path,
        'onPress': () => Get.toNamed(AppRoutes.LANG_SETTING),
      },
      {
        'title': 'feedback_title'.tr,
        'icon': Assets.images.icon.iconFeedBack3x.path,
        'onPress': () => Get.toNamed(AppRoutes.FEEDBACK),
      },
      {
        'title': 'setting_password'.tr,
        'icon': Assets.images.icon.iconPassword3x.path,
        'onPress': () => Get.toNamed(AppRoutes.UPDATE_PASSWORD),
      },
      // {
      //   'title': '加入我们',
      //   'icon': Assets.images.icon.iconJoinUs3x.path,
      //   'onPress': () => Get.toNamed(AppRoutes.JOIN_US_AGENT),
      // },
      {
        'title': 'setting_check_for_updates'.tr,
        'icon': Assets.images.icon.iconVersion3x.path,
        'onPress': () => UpdateUtil.checkUpdateVersion(flag: true),
      },
      {
        'title': 'setting_sign_out'.tr,
        'icon': Assets.images.icon.iconLoginOut3x.path,
        'onPress': () => {},
      },
    ];
    update();
  }

  void getLan() {
    var langCode = SpUtil.getString("saveLocaleLanguageCode")!;

    if (langCode == "zh") {
      currentLan.value = "简体中文".tr;
    } else if (langCode == "en") {
      currentLan.value = "English".tr;
    } else if (langCode == "vi") {
      currentLan.value = "Tiếng Việt".tr;
    } else if (langCode == "th") {
      currentLan.value = "ไทย".tr;
    }
  }

  void logout() async {
    try {
      var gesturePassword = CacheUtil.get('gesture_password');
      //  HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
      await mainApi.logout();
      Store.isLogin.value = false;
      authService.authState = LoggedOut();
      hidePop();
      BalanceManager.clear();
      // TODO: Agent
      // 代理密码状态重置
      // AgentTools.resetAgentPayPasswordKey();
      SpUtil.putString("token", '');
      // Get.offAllNamed(AppRoutes.HOME);
      // Store.currentRootPageIndex = 0;
      //销毁首页面资源:不销毁首页面，退出登录后，再进入，不执行初始化;
      // await Get.delete<HomePageController>();
      //   await Get.delete<FloatController>();
      // Get.offAllNamed(AppRoutes.HOME);
      Get.find<MarqueeController>().setMarqueeShow();
      BaseX.instance.baseCallback?.HomePageController_jumpToPage0();
      Get.find<MainController>().initData();
    } on ServerException catch (e) {
      showToast(e.message);
    } catch (e) {
      print(e);
    }
  }
}

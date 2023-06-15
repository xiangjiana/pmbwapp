import 'dart:async';

import 'package:common/common.dart';
import 'package:exception/exception.dart';
import 'package:flavor/flavor.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:main/main.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_package/modules/settings/setting/cache_manager.dart';

import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart';
import 'package:params/params.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sp_util/sp_util.dart';

class SettingController extends GetxController {
  final commonApi = Get.find<CommonApi>();
  final AuthService authService;
  final _isCacheSettingOpen = false.obs;
  final _version = ''.obs;
  final versioNewMark = false.obs;

  get version => _version.value;

  set version(val) => _version.value = val;

  SettingController(this.authService);

  get isCacheSettingOpen => _isCacheSettingOpen.value;

  set isCacheSettingOpen(value) => _isCacheSettingOpen.value = value;

  bool get isTryPlay => authService.isTryPlay;

  final mainApi = Get.find<MainApi>();

  List<Map<String, String>> supportLang =
      Flavor.I.getObject(MERCHANT_SUPPORT_LANG)! as List<Map<String, String>>;
  @override
  void onInit() {
    super.onInit();
    runCatch(() async {
      cacheReception();
      version = await GetVersion.projectVersion;
      final res = await UpdateUtil.getVersionAndCheckIfHasNew();
      versioNewMark.value = res != null;
      var cacheSetting = CacheUtil.get('cache_setting');
      _isCacheSettingOpen.value =
          cacheSetting.isNotEmpty && cacheSetting['status'] == true;
    }, onError: (_) {});
  }

  Future<void> cacheReception() async {
    if (await Permission.storage.isGranted) {
      CacheManager.currentCacheData();
    }
  }

  void navigateVerifyIdentity() {
    if (isTryPlay) {
      warnDialog("setting_trial_account_cannot_change_the_password".tr);
      return;
    }
    if (authService.authState is LoggedIn) {
      /*final user = (authService.authState as LoggedIn).uiUser;
      if ((user.phone?.isEmpty ?? true) && (user.email?.isEmpty ?? true)) {*/
      Get.toNamed(AppRoutes.UPDATE_PASSWORD);
      return;
      // }
      /*if ((user.phone?.isNotEmpty ?? false) &&
          (user.email?.isNotEmpty ?? false)) {
        Get.toNamed(AppRoutes.VERIFY_INDETITY);
        return;
      }
      if ((user.phone?.isNotEmpty ?? false) && (user.email?.isEmpty ?? true)) {
        Get.toNamed(AppRoutes.PHONE_VERIFY_INDETITY);
        return;
      }
      if ((user.phone?.isEmpty ?? true) && (user.email?.isNotEmpty ?? false)) {
        Get.toNamed(AppRoutes.EMAIL_VERIFY_INDETITY);
        return;
      }*/
    }
  }

  void logout() async {
    try {
      var gesturePassword = CacheUtil.get('gesture_password');
    //  HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
      await mainApi.logout();
      Store.isLogin.value = false;
      authService.authState=LoggedOut();
      hidePop();
      BalanceManager.clear();
      // TODO: Agent
      // 代理密码状态重置
      // AgentTools.resetAgentPayPasswordKey();
      SpUtil.putString("token", '');
      //销毁首页面资源:不销毁首页面，退出登录后，再进入，不执行初始化;
     // await Get.delete<HomePageController>();
    //  await Get.delete<FloatController>();
      Get.offAllNamed(AppRoutes.HOME);
    } on ServerException catch (e) {
      showToast(e.message);
    } catch (e) {
      print(e);
    }
  }

  void toggleCacheSetting() {
    isCacheSettingOpen = !isCacheSettingOpen;
    CacheUtil.save('cache_setting', {
      'status': isCacheSettingOpen,
    });
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'alert'.tr,
        content: tipMsg,
        cancelText: 'user_profile_understood'.tr,
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }

  Future<void> clearCache() async {
    runCatch(() async {
      if (GetPlatform.isAndroid) {
        var isGranted = await PermissionUtils.requestStoragePermission();
        if (CacheManager.sizeDes.value.startsWith('-')) {
          CacheManager.currentCacheData();
        }
        if (isGranted == true && !CacheManager.sizeDes.value.startsWith('-')) {
          CacheManager.clearCache();
        }
      } else {
        ///IOS数据存储在文件沙盒， 清除缓存不需要权限
        CacheManager.clearCache();
      }
    }, onError: (e) {});
  }

  Future<List<KvConfig>> postKvConfigValueList(List<String> list) async {
    try {
      List<KvConfig> kvConfig = await commonApi.getKvConfigValueList(
        KvConfigValueParam(keys: list),
      );
      return Future.value(kvConfig);
    } catch (e) {
      return Future.error(e);
    }
  }

  //获取手机/邮箱验证码（非生产环境接口） 测试
  Future<String> getPhoneCode(String phoneOrEmail) {
    try {
      final res = commonApi.getPhoneCode(
        phoneOrEmail: phoneOrEmail,
      );
      return Future.value(res);
    } catch (e) {
      return Future.error(e);
    }
  }
}

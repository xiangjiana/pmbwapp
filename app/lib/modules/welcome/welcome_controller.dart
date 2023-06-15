import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:ob_package/initializer/network_initializer.dart';
import 'package:ob_package/modules/welcome/welcome_manager.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:sp_util/sp_util.dart';

class WelcomeController extends GetxController {
  final swiperController = SwiperController();
  Timer? timer;
  String initialRoute = AppRoutes.HOME;
  final _splashTime = 0.obs;
  final _splashImageUrl = ''.obs;
  final _splashFilePath = ''.obs;

  int get splashTime => _splashTime.value;

  String get splashFilePath => _splashFilePath.value;

  String get splashImageUrl => _splashImageUrl.value;

  @override
  void onInit() {
    super.onInit();
    runCatch(() async {
      if (Get.currentRoute == AppRoutes.SPLASH) {
        initialRoute = await getInitialRoute();
        _splashImageUrl.value = SpUtil.getString('ob_splash_image_url') ?? '';
        _splashFilePath.value = await WelcomeManager.getSplashFullPath();
        String dictionaryKey = 'login.jump.countdown.time';
        _splashTime.value = int.tryParse(Store.dictionary[dictionaryKey]) ?? 5;
        timer = Timer.periodic(Duration(seconds: 1), (_) {
          _splashTime.value--;
          if (_splashTime.value <= 0) {
            _splashTime.value = 0;
            goNextPage();
            timer?.cancel();
          }
        });
      }
    });
  }

  void goLogin() {
    if (NetworkInitializer.ip403) {
      NetworkInitializer.go403();
    } else {
      Get.offAndToNamed(AppRoutes.HOME);
    }
  }

  Future<String> getInitialRoute() async {
    if (NetworkInitializer.ip403) {
      return Future.value(AppRoutes.limitIpPage);
    }

    try {
      String newVersion = await GetVersion.projectVersion;
      String version = SpUtil.getString('version') ?? '';
      if (version.isEmpty) {
        SpUtil.putString('version', newVersion);
        return Future.value(AppRoutes.ONBOARDING);
      }
      if (version != newVersion) {
        SpUtil.putString('version', newVersion);
        return Future.value(AppRoutes.ONBOARDING);
      }
      var gesturePassword = CacheUtil.get('gesture_password');
      if (gesturePassword.isNotEmpty && gesturePassword['status'] == true) {
        return Future.value(AppRoutes.HOME);
      } 
      return Future.value(AppRoutes.HOME);
    } on PlatformException {
      return Future.value(AppRoutes.HOME);
    } catch (e) {
      return Future.value(AppRoutes.HOME);
    }
  }

  void goNextPage() async {
    timer?.cancel();

    if (NetworkInitializer.ip403) {
      NetworkInitializer.go403();
    } else {
      Get.offAndToNamed(initialRoute);
    }
  }

  @override
  void onClose() {
    timer?.cancel();
    super.onClose();
  }
}

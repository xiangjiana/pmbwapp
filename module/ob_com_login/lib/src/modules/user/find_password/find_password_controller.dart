import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_phone_controller.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_email_controller.dart';

class FindPasswordController extends GetxController with KeyboardManager {
  late TabController tabController; //0手机找回 1邮箱找回
  late PageController pageController = PageController(); //页面

  FindPhoneController findPhoneController = Get.find();
  FindEmailController findEmailController = Get.find();
  bool isDj=true;
  @override
  void onInit() {
    super.onInit();
    if (Store.clientId == Store.clientIdDJ) {
      isDj=true;
    }else{
      isDj=false;
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    pageController.dispose();
    super.onClose();
  }

  //步骤提示
  /*void stepTips(int index) {
    tabController.animateTo(index);
    if (tabController.index == 0) {
      findPhoneController.stepTips();
    } else {
      findEmailController.stepTips();
    }
  }*/

  void onTapTabBar(i) {
    onPageChange(tabController.index, p: pageController);
  }

  onPageChange(int index, {PageController? p, TabController? t}) async {
    try {
      hideKeyboard();
      if (p != null) {
        await pageController.animateToPage(index,
            duration: Duration(milliseconds: 500), curve: Curves.ease);
      } else {
        tabController.animateTo(index);
      }
      if (index == 0) {
        findPhoneController.stepTips();
      } else {
        findEmailController.stepTips();
      }
    } catch (_) {}
  }
}

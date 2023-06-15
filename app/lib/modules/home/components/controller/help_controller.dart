import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

bool isFirstMount = true;

class HelpController extends GetxController {
  final AuthService authService;

  HelpController(this.authService);

  final repository = Get.find<HomeRepository>();
  final scrollController = ScrollController();

  RxBool isVisible = false.obs;

  bool get disabledAnimate => isFirstMount == false;

  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(() {
      isVisible.value = scrollController.offset > 50;
    });
  }

  @override
  void onClose() {
    scrollController.dispose();
    isFirstMount = false;
    super.onClose();
  }
}

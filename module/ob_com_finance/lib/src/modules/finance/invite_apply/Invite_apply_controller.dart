import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';


class InviteApplyController extends GetxController {


  InviteApplyController(this.authService);

  final AuthService authService;
  final TextEditingController editAmountController = TextEditingController();
  final selectedVenueName = 'please_choose'.tr.obs;
  late num maxLimit = 50000;

  void onAmountChanged(String value){

  }

  @override
  void onInit() {
    super.onInit();
    editAmountController.clear();
  }

  @override
  void onClose() {
    editAmountController.dispose();
    super.onClose();
  }
}
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_accout_profile/repository/add_account_profile_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/bank_card_withdraw_controller.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class AddBankAccountProfileController extends GetxController
    with FormValidate, KeyboardManager {
  final AddAccountProfileRepository repository;
  final AuthService authService;

  final addressCtrl = TextEditingController();
  final phoneNumberCtrl = TextEditingController();
  final verifyCodeCtrl = TextEditingController();
  final countDownCtrl = CountDownController();
  final int seconds = 60;
  RxString areaCode = '+86'.obs; //区号 +86
  var city = '';
  var province = '';

  AddBankAccountProfileController(this.repository, this.authService);

  @override
  void onInit() {
    super.onInit();
    areaCode.value = LocaleUtils.areaCode;
    addressCtrl.clear();
    phoneNumberCtrl.clear();
    verifyCodeCtrl.clear();

    //StringUtil.countDownReload(countDownCtrl, maxSeconds: seconds);

    if (authService.authState is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      final phone = user.phone ?? "";
      var phoneNo = phone.split('-');
      if (phoneNo.length >= 2) {
        areaCode.value = phoneNo[0];
        phoneNumberCtrl.text =
            phoneNo[1].length > 0 ? phoneNo[1].replaceRange(3, 7, '****') : "";
      } else {
        phoneNumberCtrl.text =
            phone.length > 0 ? phone.replaceRange(3, 7, '****') : '';
      }
    }
  }

  void showCityPickers() async {
    final result = await Get.addressPicker();
    if (result != null) {
      AddressResult addressResult = result;
      province = addressResult.provinceName;
      city = addressResult.cityName;
      addressCtrl.text = province + city + addressResult.townName;
    }
  }

  void sendSmsCode() {
    runCatch(() async {
      if (authService.authState is LoggedIn) {
        final cancel = showLoading();
        await repository.postSendVerifyCode();
        showToast("sent_successfully".tr);
        cancel();
        StringUtil.startCountDown(seconds, countDownCtrl);
      }
    }, onError: (error) {
      if (error != null && error is String) {
        String res = error;
        var list = res.split('|');
        if (list.isNotEmpty) {
          if (list.first == '100019') {
            StringUtil.startCountDownMsg(list.last, countDownCtrl);
          }
          dismissAll();
          showToast(list.last);
        }
      }
    });
  }

  void apply() {
    runCatch(() async {
      if (CoolDownManager.handler(key: 'kaAddBankAccount', duration: 1000)) {
        if (authService.authState is LoggedIn) {
          hideKeyboard();
          final cancel = showGaLoading();
          final verifyRes = await repository.postConfirmVerifyCode(
            verifyCodeCtrl.text,
          );
          if (verifyRes == true) {
            final res = await repository.postAddBankAccount(
              addressCtrl.text,
              Get.parameters['bankCode'] ?? '',
              Get.parameters['bankName'] ?? '',
              Get.parameters['cardNumber'] ?? '',
              Get.parameters['realName'] ?? '',
              city,
              province,
              int.parse(Get.parameters['bankId']!),
            );
            if (res == true) {
              showToast("add_virtual_account_added_successfully".tr);
            }
            cancel();
            authService.syncUser();
            if (Get.isRegistered<AccountController>()) {
              Get.find<AccountController>().refreshBankAccount();
            }
            if (Get.isRegistered<BankCardWithdrawController>()) {
              Get.find<BankCardWithdrawController>().refreshBankAccount();
            }
            Get.close(2);
          } else {
            cancel();
            showToast("add_virtual_account_incorrect_verification_code".tr);
          }
        }
      }
    });
  }

  @override
  void onClose() {
    addressCtrl.dispose();
    phoneNumberCtrl.dispose();
    verifyCodeCtrl.dispose();
    countDownCtrl.dispose();
    super.onClose();
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/protocol_address_validator.dart';
import 'package:ob_com_finance/src/modules/finance/add_virtual_account/repository/add_virtual_account_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/cryptocurrency_withdraw_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class AddVirtualAccountController extends GetxController
    with FormValidate, KeyboardManager {
  final AddVirtualAccountRepository repository;
  final AuthService authService;

  var virtualProtocolType = <String>[].obs;
  var virtualType = <VirtualType>[].obs;
  final RxnString _selectedVirtualType = RxnString(null);

  String? get selectedVirtualType => _selectedVirtualType.value;

  set selectedVirtualType(String? value) => _selectedVirtualType.value = value;

  final RxnString _selectedVirtualProtocolType = RxnString(null);

  String? get selectedVirtualProtocolType => _selectedVirtualProtocolType.value;

  set selectedVirtualProtocolType(String? value) =>
      _selectedVirtualProtocolType.value = value;

  final aliasCtrl = TextEditingController();
  final addressCtrl = TextEditingController();
  final phoneNumberCtrl = TextEditingController();
  final verifyCodeCtrl = TextEditingController();
  final countDownCtrl = CountDownController();
  RxString areaCode = '+86'.obs; //区号 +86
  final int seconds = 60;
  RxString errorTextName = "".obs;

  AddVirtualAccountController(this.repository, this.authService);

  void selectType(String type) => selectedVirtualType = type;

  void selectProtocol(String protocol) {
    selectedVirtualProtocolType = protocol;
  }

  @override
  void onInit() {
    super.onInit();
    areaCode.value = LocaleUtils.areaCode;
    successClear();
    StringUtil.countDownReload(countDownCtrl, maxSeconds: seconds);
    runCatch(() async {
      if (authService.authState is LoggedIn) {
        final user = (authService.authState as LoggedIn).uiUser;
        final phone = user.phone ?? "";
        var phoneNo = phone.split('-');
        if (phoneNo.length >= 2) {
          areaCode.value = phoneNo[0];
          phoneNumberCtrl.text = phoneNo[1].length > 0
              ? phoneNo[1].replaceRange(3, 7, '****')
              : "";
        } else {
          phoneNumberCtrl.text =
              phone.length > 0 ? phone.replaceRange(3, 7, '****') : '';
        }
      }

      DictVirtualType res = await repository.getDicList();
      virtualProtocolType.value = res.virtualProtocolType.map((e) => e.code).toList().cast();
      virtualProtocolType.value = virtualProtocolType.where((element) => element != 'OMIN').toList();

      virtualType.value = res.virtualType;
      selectedVirtualType = virtualType[0].code;
      for (int i = 0; i < virtualType.length; i++) {
        print("虚拟币信息:${virtualType[i].code}--${virtualType[i].description}");
      }
      selectedVirtualProtocolType = virtualProtocolType.firstWhere((element) => element == 'ERC20');
    });
  }

  void checkVirtualType(String code) {
    selectedVirtualType = code;
  }

  void onChangedName(String value) {
    if (value.length < 6) {
      if (value.isEmpty) {
        errorTextName.value =
            'add_virtual_account_enter_your_digital_wallet_address'.tr;
      } else {
        errorTextName.value = 'error_text_virtual'.tr;
      }

      isValidate = false;
    } else {
      errorTextName.value = '';
      isValidate = true;
    }
    //checkSub();
  }

  void sendSmsCode() {
    runCatch(() async {
      if (authService.authState is LoggedIn) {
        final cancel = showLoading();
        await repository.postSendVerifyCode();
        cancel();
        showToast("sent_successfully".tr);
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

  void applyNewAccount() {
    if (selectedVirtualType == null) {
      showToast('add_virtual_account_select_the_type_of_virtual_currency'.tr);
      return;
    }
    if (selectedVirtualProtocolType == null) {
      showToast('add_virtual_account_select_protocol_type'.tr);
      return;
    }
    try {
      ProtocolAddressValidator.isValid(
          selectedVirtualProtocolType!, addressCtrl.text);
    } on InvalidException {
      showToast(
          'add_virtual_account_virtual_currency_account_does_not_correspond'
              .tr);
      return;
    }

    // 收起键盘 否则
    //W/HiTouch_PressGestureDetector(31640): Touch pointer move a lot. The moving distance of X is:34.0, limit is:60The moving distance of Y is:79.0, limit is:60
    hideKeyboard();

    runCatch(() async {
      if (authService.authState is LoggedIn) {
        final cancel = showGaLoading();
        // final verifyRes = await repository.postConfirmVerifyCode(
        //   verifyCodeCtrl.text,
        // );
        // if (verifyRes.data == true) {
        final res = await repository.postAddVirtualAccount(
          // aliasCtrl.text,
          addressCtrl.text,
          selectedVirtualType!,
          selectedVirtualProtocolType!,
        );

        if (res == true) {
          showToast("add_virtual_account_added_successfully".tr);
        }
        cancel();
        successClear();
        if (Get.isRegistered<AccountController>()) {
          Get.find<AccountController>().refreshUsdtAccount();
        }
        if (Get.isRegistered<CryptoCurrencyWithdrawController>()) {
          Get.find<CryptoCurrencyWithdrawController>().refreshUsdtAccount();
        }
        Get.back();
        // } else {
        //   cancel();
        //   showToast("add_virtual_account_incorrect_verification_code".tr);
        // }
      }
    });
  }

  void successClear() {
    aliasCtrl.clear();
    addressCtrl.clear();
    phoneNumberCtrl.clear();
    verifyCodeCtrl.clear();
  }

  @override
  void onClose() {
    aliasCtrl.dispose();
    addressCtrl.dispose();
    phoneNumberCtrl.dispose();
    verifyCodeCtrl.dispose();
    countDownCtrl.dispose();
    super.onClose();
  }
}

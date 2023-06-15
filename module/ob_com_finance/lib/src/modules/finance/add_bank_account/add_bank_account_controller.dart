import 'dart:async';

import 'package:flutter/material.dart' hide PageController;
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/account_controller.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/bank_card_withdraw_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/select_bank.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/repository/add_bank_account_repository.dart';

class AddBankAccountController extends GetxController
    with FormValidate, KeyboardManager {
  final AddBankAccountRepository repository;
  final AuthService authService;
  final nameCtrl = TextEditingController();
  final bankNameCtrl = TextEditingController();
  final bankCardNumberCtrl = TextEditingController();
  late final StreamSubscription streamSubscription;
  var selectId;
  RxString errorText = "".obs;
  RxString errorTextName = "".obs;
  RxString errorCardName = "".obs;
  RxBool validate = false.obs;
  RxBool enable = true.obs;
  bool get isAllowTypeUserName => authService.isAllowTypeUserName;

  AddBankAccountController(this.repository, this.authService);

  @override
  void onInit() {
    super.onInit();
    nameCtrl.clear();
    bankNameCtrl.clear();
    bankCardNumberCtrl.clear();
    authService.syncUser();
    void updateRxAuth(AuthState state) {
      if (state is LoggedIn) {
        final user = (authService.authState as LoggedIn).uiUser;
        nameCtrl.text = user.realName ?? '';
        if(nameCtrl.text.isNotEmpty) {
          enable.value = false;
        }else{
          enable.value = true;
        }
      }
    }

    streamSubscription = authService.rxAuthState.listen(updateRxAuth);
    updateRxAuth(authService.authState);

    getManagerBankList();
  }

  List<BankNameResp>? managerBankListModel;

  getManagerBankList() async {
    showGaLoading();
    final bankDtoList = await repository.getManagerBankList(
      Store.merchantCurrency,
    );
    managerBankListModel = bankDtoList;

    dismissLoading();
  }

  void showBankBottomSheet() {
    runCatch(() async {
      if (managerBankListModel != null) {
        final selectedBank = await Get.bottomSheet<UiBank>(
          SelectBank(
            title: "selectBank".tr,
            needBankIcon: false,
            banks: managerBankListModel!
                .map((e) => UiBank(e.bankName,e.bankLogo, e.id))
                .toList(),
            selectId: selectId,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
          isScrollControlled: false,
          backgroundColor: const Color(0xff1C1E22),
        );
        if (selectedBank != null) {
          selectId = selectedBank.id;
          bankNameCtrl.text = selectedBank.bankName;
          checkSub();
        }
      }
    });
  }

  void onChangedName(String value) {
    if (value.isEmpty) {
      if (value.isEmpty) {
        errorTextName.value =
            'add_bank_account_please_enter_cardholder_name'.tr;
      } else {
        errorTextName.value = 'error_text_name'.tr;
      }
    } else {
      errorTextName.value = '';
    }
    checkSub();
  }

  void onChangedCard(String value) {
    if (value.isEmpty) {
      if (value.isEmpty) {
        errorCardName.value = 'select_open_bank'.tr;
      } else {
        errorCardName.value = 'error_card_name'.tr;
      }
    } else {
      errorCardName.value = '';
    }
    checkSub();
  }

  void checkSub() {
    if (bankCardNumberCtrl.text.length >= 2 &&
        nameCtrl.text.length >= 1 &&
        bankNameCtrl.text.isNotEmpty) {
      validate.value = true;
    } else {
      validate.value = false;
    }
  }

  void onChanged(String value) {
    if (value.length < 2) {
      if (value.isEmpty) {
        errorText.value = 'input_bank_card_number'.tr;
      } else {
        errorText.value = 'error_card_num_name'.tr;
      }
    } else {
      errorText.value = '';
    }
    checkSub();
  }

  void apply() {
    runCatch(() async {
      if (CoolDownManager.handler(key: 'kaAddBankAccount', duration: 1000)) {
        if (authService.authState is LoggedIn) {
          hideKeyboard();
          final cancel = showGaLoading();

          final res = await repository.postAddBankAccountNew(
            // addressCtrl.text,
            // Get.parameters['bankCode'] ?? '',
              bankNameCtrl.text,
              bankCardNumberCtrl.text,
              nameCtrl.text,
              int.parse(selectId)
            // city,
            // province,
          );
          if (res == true) {
            showToast("add_bank_account_added_successfully".tr);
          }
          cancel();
          authService.syncUser();
          if (Get.isRegistered<AccountController>()) {
            Get.find<AccountController>().refreshBankAccount();
          }
          if (Get.isRegistered<BankCardWithdrawController>()) {
            Get.find<BankCardWithdrawController>().refreshBankAccount();
          }
          Get.back();
        }
      }
    });
  }

  @override
  void onClose() {
    nameCtrl.dispose();
    bankNameCtrl.dispose();
    bankCardNumberCtrl.dispose();
    streamSubscription.cancel();
    super.onClose();
  }
}

class UiBank {
  final String bankName;
  final String bankIconUrl;
  final String id;
  final String cardNumber;

  UiBank(this.bankName, this.bankIconUrl, this.id, {this.cardNumber = ''});
}


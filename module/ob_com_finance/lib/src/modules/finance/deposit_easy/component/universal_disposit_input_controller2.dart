import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/deposit_easy_controller.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/repository/deposit_easy_repository.dart';
import 'package:repository/utils/net.dart';

import '../../add_bank_account/add_bank_account_controller.dart';
import '../../add_bank_account/component/select_bank.dart';

class UniversalDepositInputController2 extends GetxController with FormValidate, KeyboardManager {
  UiPayType payType;
  final AuthService authService;
  final DepositEasyRepository repository;
  final DepositEasyController depositEasyController;
  final _editAmount = ''.obs;
  final _editRealName = ''.obs;
  RxBool isLoadingStatus = false.obs;

  get editAmount => _editAmount.value;

  get editRealName => _editRealName.value;

  get depositMaxAmount => payType.depositMaxAmount;

  final amountCtrl = TextEditingController();
  final nameCtrl = TextEditingController();
  final nameFocusNode = FocusNode();

  RxString errorTextName = "".obs;

  UniversalDepositInputController2(this.payType, this.authService, this.repository, this.depositEasyController);

  @override
  void onInit() {
    super.onInit();
    amountCtrl.addListener(() {
      _editAmount.value = amountCtrl.text;
    });

    nameCtrl.addListener(() {
      _editRealName.value = nameCtrl.text;
      if (nameCtrl.text.isNotEmpty) {
        onChangedName(nameCtrl.text);
      }
    });
    nameFocusNode.addListener(() {
      if (nameCtrl.text.isNotEmpty && !nameFocusNode.hasFocus) {
        onFormChanged();
      }
      if (!nameFocusNode.hasFocus) {
        onChangedName(nameCtrl.text);
      }
    });
  }

  var selectId;
  final bankNameCtrl = TextEditingController();

  void showBankBottomSheet() {
    runCatch(() async {
      final selectedBank = await Get.bottomSheet<UiBank>(
        SelectBank(
          title: "selectBank".tr,
          needBankIcon: false,
          banks: payType.bankDtoList.map((e) => UiBank(e.bankName, e.bankLogo, e.id)).toList(),
          selectId: selectId,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
        isScrollControlled: false,
        backgroundColor: const Color(0xff1D2933),
      );
      if (selectedBank != null) {
        selectId = selectedBank.id;
        bankNameCtrl.text = selectedBank.bankName;
      }
    });
  }


  void onChangedName(String value) {
    if (value.isEmpty) {
      //'add_bank_account_please_enter_cardholder_name2': "请输入合法的姓名",
      errorTextName.value = 'add_bank_account_please_enter_cardholder_name2'.tr;
    } else {
      errorTextName.value = '';
    }
  }

  void onRaidAmountSelect(String amount) {
    var hasK = AppCurrencyUtils.getAppCurrencySymbolIsVND();
    if (hasK) {
      amount = (double.parse(amount) / 1000).toStringAsFixed(2);
    }
    if (!payType.isClosed && depositMaxAmount < double.parse(amount)) {
      if (hasK) {
        amount = (depositMaxAmount / 1000).toStringAsFixed(2);
      } else {
        amount = depositMaxAmount.toString();
      }
    }

    amountCtrl.value = amountCtrl.value.copyWith(
      text: amount,
      selection: TextSelection.collapsed(offset: amount.length),
      composing: TextRange.empty,
    );
  }

  Future<void> applyDeposit() async {
    if (CoolDownManager.handler(key: 'kCoolDownApplyDeposit', duration: 1000)) {
      if (authService.isTryPlay) {
        warnDialog('deposit_trial_account_does_not_support_recharge'.tr);
        return;
      }
      // 跳转前需要收起键盘，在iOS上跳转页面后再回来会自动弹出键盘警告会导致pop页面controller未能正常释放
      hideKeyboard();
      runCatch(() async {
        final showDialogPayTypeIds = ['1', '214', '11', '710', '113'];
        if (showDialogPayTypeIds.contains(payType.id)) {
          await OBDialogUtil.show(
            ObaseDialog.alert(
              title: 'alert'.tr,
              content: 'deposit_the_company_bank_card_is_changed_from_time_to_time'.tr,
              confirmText: 'user_profile_understood'.tr,
              onConfirmListener: () => Get.back(),
            ),
            barrierDismissible: false,
          );
        }
        isLoadingStatus.value = true;
        if (kIsWeb && Net().isConnect && GetPlatform.isIOS) {
          WebUtil.windowPreOpen();
        }
        showLoading();
        final res = await repository.postDeposit(
            payType.realObj!.id,
            AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "${double.parse(amountCtrl.text) * 1000}" : amountCtrl.text,
            depositEasyController.chargeType,
            nameCtrl.text,
            '',
            bankId: payType.needFlag == 1 ? selectId : '');
        dismissLoading();
        isLoadingStatus.value = false;
        // 这个字段目前没有返回0的情况，因为现在返回的response是一串html代码，flag这个以后可能会有0的情况，可能response返回的是一个url 用来跳转的
        WebUtil.openInApp(
          res.response,
          showTitle: true,
          hasLoading: true,
          title: 'deposit_label'.tr,
          isHtml: res.frontLoadFlag == 1,
        );
      }, onError: (e) {
        if (kIsWeb) {
          WebUtil.windowClose();
        }
        onError(e);
      });
    }
  }

  void onError(e) {
    dismissLoading();
    isLoadingStatus.value = false;
    final msg = e.toString();
    if (msg.contains("deposit_multiple_deposit_failures".tr)) {
      OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'alert'.tr,
          content: msg,
          confirmText: 'submit'.tr,
          onConfirmListener: () => Get.back(),
        ),
        barrierDismissible: false,
      );
    } else {
      //showToast(e.toString());
    }
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObaseDialog.alert(
        title: 'alert'.tr,
        content: tipMsg,
        cancelText: 'user_profile_understood'.tr,
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }

  @override
  void onClose() {
    amountCtrl.dispose();
    nameCtrl.dispose();
    nameFocusNode.dispose();
    super.onClose();
  }
}

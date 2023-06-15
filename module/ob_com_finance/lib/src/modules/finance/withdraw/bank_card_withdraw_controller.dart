import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/repository/bank.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/navigate_list_tile.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/select_list_tile.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/repository/withdraw_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:repository/utils/device_type.dart';
import 'package:sprintf/sprintf.dart';

class BankCardWithdrawController extends GetxController
    with FormValidate, KeyboardManager {
  final WithdrawRepository withdrawRepository;
  final AuthService authService;
  final bankAccountAmountCtrl = TextEditingController();
  RxBool isLoadingStatus = false.obs;

  final Rx<UserBankCard?> _selectedBankAccount = Rx(null);
  var cancel;

  UserBankCard? get selectedBankAccount => _selectedBankAccount.value;

  set selectedBankAccount(value) => _selectedBankAccount.value = value;

  BankCardWithdrawController(this.withdrawRepository, this.authService);

  final selectableBanks = <UserBankCard>[].obs;

  num get bankWithdrawMaxAmount {
    return min(
        min(bankCardMaxAmount, totalWithdrawAble), dateWithdrawAbleAmount);
  }

  num get bankWithdrawMinAmount {
    return double.tryParse(Get.find<WithdrawController>().bankCardMinAmount) ??
        0.00;
  }

  num get bankCardMaxAmount {
    return double.tryParse(Get.find<WithdrawController>().bankCardMaxAmount) ??
        0.00;
  }

  num get totalWithdrawAble {
    return double.tryParse(Get.find<WithdrawController>().totalWithdrawAble) ??
        0.00;
  }

  num get dateWithdrawAbleAmount {
    return double.tryParse(
            Get.find<WithdrawController>().dateWithdrawAbleAmount) ??
        0.00;
  }

  num get dateNum {
    return int.tryParse(Get.find<WithdrawController>().dateNum) ?? 0;
  }

  num get totalDifferentAmount {
    return double.tryParse(
            Get.find<WithdrawController>().totalDifferentAmount) ??
        0.00;
  }

  bool? get allowWithdraw {
    return Get.find<WithdrawController>().allowWithdraw;
  }

  //输入金额是否在允许范围内
  bool get isInputInRange {
    num amount = double.tryParse(bankAccountAmountCtrl.text) ?? 0;
    num bankWithdrawMinAmountCp = bankWithdrawMinAmount;
    num bankWithdrawMaxAmountCp = bankWithdrawMaxAmount;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      bankWithdrawMinAmountCp = bankWithdrawMinAmount / 1000;
      bankWithdrawMaxAmountCp = bankWithdrawMaxAmount / 1000;
    }
    return (amount >= bankWithdrawMinAmountCp &&
        amount <= bankWithdrawMaxAmountCp);
  }

  String getWithdrawAvailable() {
    return sprintf(
      'withdraw_amount_available_for_withdrawal'.tr.breakWordOnWeb,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  String getWithdrawLimitToday() {
    return sprintf(
      'withdraw_available_withdrawal_limit_today'.tr.breakWordOnWeb,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  String getWithdrawAbleAmount() {
    return dateWithdrawAbleAmount > 0
        ? dateWithdrawAbleAmount.toString()
        : "0.00";
  }

  String getSingleWithdrawalAmount() {
    return sprintf(
      'withdraw_maximum_single_withdrawal_amount'.tr.breakWordOnWeb,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  String getBankCardMaxAmount() {
    return bankCardMaxAmount > 0 ? bankCardMaxAmount.toString() : "0.00";
  }

  String getInputHint() {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      return '${'symbol'.tr}${AppCurrencyUtils.fixAmount(
        bankWithdrawMinAmount.toString(),
      )}-${AppCurrencyUtils.fixAmount(
        bankCardMaxAmount.toString(),
        suffix: 'K',
      )}';
    }
    return '${'input_withdrawal_amount'.tr}（${'symbol'.tr}${numberFormat(bankWithdrawMinAmount)}-${numberFormat(bankCardMaxAmount)})';
  }

  @override
  void onReady() {
    super.onReady();
    runCatch(() async {
      selectableBanks.value = await withdrawRepository.getAccounts('1');
      if (selectableBanks.isNotEmpty) {
        selectedBankAccount = selectableBanks.first;
      }
      var lastWithdrawBankAccount = CacheUtil.get('last_withdraw_bank_account');
      if (lastWithdrawBankAccount.isNotEmpty) {
        selectedBankAccount = UserBankCard(
          accountType: lastWithdrawBankAccount["accountType"],
          bankBranch: lastWithdrawBankAccount["bankBranch"],
          bankCode: lastWithdrawBankAccount["bankCode"],
          bankName: lastWithdrawBankAccount["bankName"],
          bindNum: lastWithdrawBankAccount["bindNum"],
          bindStatus: lastWithdrawBankAccount["bindStatus"],
          bindUserName: lastWithdrawBankAccount["bindUserName"],
          blacklistStatus: lastWithdrawBankAccount["blacklistStatus"],
          cardNumber: lastWithdrawBankAccount["cardNumber"],
          city: lastWithdrawBankAccount["city"],
          cnName: lastWithdrawBankAccount["cnName"],
          createdAt: lastWithdrawBankAccount["createdAt"],
          createdBy: lastWithdrawBankAccount["createdBy"],
          dataType: lastWithdrawBankAccount["dataType"],
          id: lastWithdrawBankAccount["id"],
          isUsed: lastWithdrawBankAccount["isUsed"],
          merchantId: lastWithdrawBankAccount["merchantId"],
          province: lastWithdrawBankAccount["province"],
          proxyWithdrawalFailNum:
              lastWithdrawBankAccount["proxyWithdrawalFailNum"],
          proxyWithdrawalSuccessNum:
              lastWithdrawBankAccount["proxyWithdrawalSuccessNum"],
          proxyWithdrawalTotalAmount:
              lastWithdrawBankAccount["proxyWithdrawalTotalAmount"],
          realName: lastWithdrawBankAccount["realName"],
          remark: lastWithdrawBankAccount["remark"],
          sign: lastWithdrawBankAccount["sign"],
          status: lastWithdrawBankAccount["status"],
          updatedAt: lastWithdrawBankAccount["updatedAt"],
          updatedBy: lastWithdrawBankAccount["updatedBy"],
          userId: lastWithdrawBankAccount["userId"],
          virtualAddress: lastWithdrawBankAccount["virtualAddress"],
          virtualKind: lastWithdrawBankAccount["virtualKind"],
          virtualProtocol: lastWithdrawBankAccount["virtualProtocol"],
          windControlId: lastWithdrawBankAccount["windControlId"],
          windControlName: lastWithdrawBankAccount["windControlName"],
          withdrawalFailNum: lastWithdrawBankAccount["withdrawalFailNum"],
          withdrawalSuccessNum: lastWithdrawBankAccount["withdrawalSuccessNum"],
          withdrawalTime: lastWithdrawBankAccount["withdrawalTime"],
          withdrawalTotalAmount:
              lastWithdrawBankAccount["withdrawalTotalAmount"],
        );
      }
    });
  }

  Future<void> refreshBankAccount() async {
    runCatch(() async {
      selectableBanks.value = await withdrawRepository.getAccounts('1');
      if (selectableBanks.isNotEmpty) {
        selectedBankAccount = selectableBanks.first;
      }

      var lastWithdrawBankAccount = CacheUtil.get('last_withdraw_bank_account');
      if (lastWithdrawBankAccount.isNotEmpty) {
        selectedBankAccount = UserBankCard(
          accountType: lastWithdrawBankAccount["accountType"],
          bankBranch: lastWithdrawBankAccount["bankBranch"],
          bankCode: lastWithdrawBankAccount["bankCode"],
          bankName: lastWithdrawBankAccount["bankName"],
          bindNum: lastWithdrawBankAccount["bindNum"],
          bindStatus: lastWithdrawBankAccount["bindStatus"],
          bindUserName: lastWithdrawBankAccount["bindUserName"],
          blacklistStatus: lastWithdrawBankAccount["blacklistStatus"],
          cardNumber: lastWithdrawBankAccount["cardNumber"],
          city: lastWithdrawBankAccount["city"],
          cnName: lastWithdrawBankAccount["cnName"],
          createdAt: lastWithdrawBankAccount["createdAt"],
          createdBy: lastWithdrawBankAccount["createdBy"],
          dataType: lastWithdrawBankAccount["dataType"],
          id: lastWithdrawBankAccount["id"],
          isUsed: lastWithdrawBankAccount["isUsed"],
          merchantId: lastWithdrawBankAccount["merchantId"],
          province: lastWithdrawBankAccount["province"],
          proxyWithdrawalFailNum:
              lastWithdrawBankAccount["proxyWithdrawalFailNum"],
          proxyWithdrawalSuccessNum:
              lastWithdrawBankAccount["proxyWithdrawalSuccessNum"],
          proxyWithdrawalTotalAmount:
              lastWithdrawBankAccount["proxyWithdrawalTotalAmount"],
          realName: lastWithdrawBankAccount["realName"],
          remark: lastWithdrawBankAccount["remark"],
          sign: lastWithdrawBankAccount["sign"],
          status: lastWithdrawBankAccount["status"],
          updatedAt: lastWithdrawBankAccount["updatedAt"],
          updatedBy: lastWithdrawBankAccount["updatedBy"],
          userId: lastWithdrawBankAccount["userId"],
          virtualAddress: lastWithdrawBankAccount["virtualAddress"],
          virtualKind: lastWithdrawBankAccount["virtualKind"],
          virtualProtocol: lastWithdrawBankAccount["virtualProtocol"],
          windControlId: lastWithdrawBankAccount["windControlId"],
          windControlName: lastWithdrawBankAccount["windControlName"],
          withdrawalFailNum: lastWithdrawBankAccount["withdrawalFailNum"],
          withdrawalSuccessNum: lastWithdrawBankAccount["withdrawalSuccessNum"],
          withdrawalTime: lastWithdrawBankAccount["withdrawalTime"],
          withdrawalTotalAmount:
              lastWithdrawBankAccount["withdrawalTotalAmount"],
        );
      }
    });
  }

  void withdrawMaxAmount() {
    hideKeyboard();
    if (!(Get.find<WithdrawController>().allowWithdraw ?? false)) return;
    if (bankWithdrawMaxAmount < 0) return;
    var bankWithdrawMaxAmountIn = bankWithdrawMaxAmount;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      bankWithdrawMaxAmountIn = bankWithdrawMaxAmount / 1000;
    }
    bankAccountAmountCtrl.text = bankWithdrawMaxAmountIn.floor().toString();
  }

  void addBankAccount() {
    // if (authService.isTryPlay) {
    //   warnDialog(
    //       'withdraw_trial_account_does_not_support_binding_a_bank_card'.tr);
    //   return;
    // }
    if (authService.authState is LoggedIn) {
      // final user = (authService.authState as LoggedIn).uiUser;
      // if (user.phone?.isEmpty ?? true) {
      //   OBDialogUtil.show(
      //     ObaseDialog.alert(
      //       title: 'alert'.tr,
      //       content:
      //           'withdraw_do_you_want_to_go_to_bind_the_mobile_phone_number'.tr,
      //       confirmText: 'continue'.tr,
      //
      //       onConfirmListener: () {
      //         Get.back();
      //         Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
      //       },
      //     ),
      //   );
      // } else {
      Get.toNamed('${AppRoutes.ACCOUNT}${AppRoutes.BANK}');
      // }
    }
  }

  String displace(String num) {
    if (num.isNotEmpty) {
      return num.replaceAll("*", "").replaceAll(" ", "");
    } else {
      return "";
    }
  }

  void selectBankAccount() async {
    final selectedBank = await Get.bottomSheet(
      ObBottomSheet.list(
        cancelFontSize: 14,
        titleFontSize: 14,
        title: 'withdraw_select_debit_card'.tr,
        onCancelListener: () => Get.back(),
        children: selectableBanks
            .map((b) => GestureDetector(
                  onTap: () => Get.back(result: b),
                  child: SelectListTile(
                    // leading: Avatar(
                    //   radius: 12.w,
                    //   backgroundColor: Colors.white.withOpacity(0.8),
                    //   child: pkObImage(
                    //     'assets/images/bank/bank_${b.bankCode}.webp',
                    //     width: 16.w,
                    //   ),
                    // ),
                    selected: selectedBankAccount?.id == b.id,
                    title: /*Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [*/
                        Row(
                      children: [
                        /*pkObImage(
                              Assets.images.icon.comBankCard.path,
                              width: 24.w,
                            ),
                            SizedBox(width: 12.w),*/
                        Flexible(
                          child: Text(
                            b.bankName ?? '',
                            style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 16.w),
                        Text(
                          '(' +
                              'withdraw_tail_number'.tr +
                              displace(b.cardNumber ?? '') +
                              ')',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                    /*Row(
                          children: [
                            Text(
                              '(' +
                                  'withdraw_tail_number'.tr +
                                  '${b.cardNumber ?? ''})',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              '(${realNameFormat(b.realName ?? '')})',
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),*/
                    /* ],
                    ),*/
                  ),
                ))
            .toList(),
        footer: selectableBanks.length < 3
            ? GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed('${AppRoutes.ACCOUNT}${AppRoutes.BANK}');
                },
                child: NavigateListTile(
                  leading: pkObImage(
                    Assets.images.icon.comBankCard.path,
                    width: 24.w,
                  ),
                  title: Text(
                    'withdraw_add_a_new_bank_card'.tr,
                    style: TextStyle(
                        color: Colors.white.withOpacity(0.6), fontSize: 14),
                  ),
                ),
              )
            : Column(
                children: [
                  SizedBox(height: 8.w),
                  Center(
                    child: Text(
                      'withdraw_only_add_up_to_3_bank_cards'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ),
                ],
              ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
    );
    if (selectedBank != null) {
      selectedBankAccount = selectedBank;
    }
  }

  void withdrawBankCard() {
    if (selectedBankAccount == null) {
      showToast('withdraw_select_a_bank_account'.tr);
      return;
    }

    if (selectedBankAccount?.realName != authService.realName) {
      OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'warm_tips'.tr,
          content: "user_withdraw_real_name_err".tr,
          confirmText: 'user_profile_understood'.tr,
          onConfirmListener: () => Get.back(),
        ),
      );
      return;
    }

    runCatch(() async {
      isLoadingStatus.value = true;
      await withdrawRepository.postWithdrawal(
        selectedBankAccount!.id!,
        InstallDeviceType.platFormInfo.deviceId.toString(),
        AppCurrencyUtils.getAppCurrencySymbolIsVND()
            ? "${double.parse(bankAccountAmountCtrl.text) * 1000}"
            : bankAccountAmountCtrl.text,
        '1',
      );

      isLoadingStatus.value = false;
      Bank data = Bank(
        accountType: selectedBankAccount?.accountType,
        bankBranch: selectedBankAccount?.bankBranch,
        bankCode: selectedBankAccount?.bankCode,
        bankName: selectedBankAccount?.bankName,
        cardNumber: selectedBankAccount?.cardNumber,
        city: selectedBankAccount?.city,
        cnName: selectedBankAccount?.cnName,
        id: selectedBankAccount?.id,
        isUsed: selectedBankAccount?.isUsed,
        merchantId: selectedBankAccount?.merchantId,
        province: selectedBankAccount?.province,
        realName: selectedBankAccount?.realName,
        status: selectedBankAccount?.status,
        userId: selectedBankAccount?.userId,
        virtualAddress: selectedBankAccount?.virtualAddress,
        virtualKind: selectedBankAccount?.virtualKind,
        virtualProtocol: selectedBankAccount?.virtualProtocol,
      );
      CacheUtil.save('last_withdraw_bank_account', data);
      if (Get.isRegistered<WithdrawController>()) {
        Get.find<WithdrawController>().onRefresh(needAbleTotal: false);
      }
      bankAccountAmountCtrl.text = '';
      showToast('withdraw_successfully'.tr);
    }, onError: (e) {
      isLoadingStatus.value = false;
      showToast(e);
    });
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
    bankAccountAmountCtrl.dispose();
    super.onClose();
  }
}

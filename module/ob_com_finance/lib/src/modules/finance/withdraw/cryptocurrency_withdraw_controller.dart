import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/account/component/dic.dart';
import 'package:ob_com_finance/src/modules/finance/account/repository/bank.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/repository/withdraw_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/withdraw_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:repository/utils/device_type.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sprintf/sprintf.dart';
import 'component/navigate_list_tile.dart';
import 'component/select_list_tile.dart';

class CryptoCurrencyWithdrawController extends GetxController
    with FormValidate, KeyboardManager {
  final WithdrawRepository withdrawRepository;
  final AuthService authService;
  RxBool isLoadingStatus = false.obs;
  var cancel;

  CryptoCurrencyWithdrawController(this.withdrawRepository, this.authService);

  final usdtAccountAmountCtrl = TextEditingController();

  final Rx<UserBankCard?> _selectedUSDTAccount = Rx(null);

  UserBankCard? get selectedUSDTAccount => _selectedUSDTAccount.value;

  set selectedUSDTAccount(value) => _selectedUSDTAccount.value = value;

  final selectableUSDTs = <UserBankCard>[].obs;
  double exchangeRate = 0.0;
  RxString expectedAmount = '0.00'.obs;

  num get usdtWithdrawMaxAmount {
    return min(
        min(virtualCardMaxAmount, totalWithdrawAble), dateWithdrawAbleAmount);
  }

  num get usdtWithdrawMinAmount {
    return double.tryParse(
            Get.find<WithdrawController>().virtualCardMinAmount) ??
        0;
  }

  num get virtualCardMaxAmount {
    return double.tryParse(
            Get.find<WithdrawController>().virtualCardMaxAmount) ??
        double.infinity;
  }

  num get totalWithdrawAble {
    return double.tryParse(Get.find<WithdrawController>().totalWithdrawAble) ??
        double.infinity;
  }

  num get dateWithdrawAbleAmount {
    return double.tryParse(
            Get.find<WithdrawController>().dateWithdrawAbleAmount) ??
        double.infinity;
  }

  num get dateNum {
    return int.tryParse(Get.find<WithdrawController>().dateNum) ?? 0;
  }

  num get totalDifferentAmount {
    return double.tryParse(
            Get.find<WithdrawController>().totalDifferentAmount) ??
        0.0;
  }

  bool? get allowWithdraw {
    return Get.find<WithdrawController>().allowWithdraw;
  }

  //输入金额是否在允许范围内
  bool get isInputInRange {
    num amount = double.tryParse(usdtAccountAmountCtrl.text) ?? 0;
    num usdtWithdrawMinAmountCp = usdtWithdrawMinAmount;
    num usdtWithdrawMaxAmountCp = usdtWithdrawMaxAmount;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      usdtWithdrawMinAmountCp = usdtWithdrawMinAmount / 1000;
      usdtWithdrawMaxAmountCp = usdtWithdrawMaxAmount / 1000;
    }
    return (amount >= usdtWithdrawMinAmountCp &&
        amount <= usdtWithdrawMaxAmountCp);
  }

  bool get isWithdrawByBank {
    return Get.find<WithdrawController>().isWithdrawByBank;
  }

  String getWithdrawAvailable() {
    return sprintf(
      'withdraw_amount_available_for_withdrawal'.tr,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  String getWithdrawLimitToday() {
    return sprintf(
      'withdraw_available_withdrawal_limit_today'.tr,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  String getWithdrawAbleAmount() {
    return dateWithdrawAbleAmount > 0
        ? numberFormat(dateWithdrawAbleAmount)
        : "0.00";
  }

  String getSingleWithdrawalAmount() {
    return sprintf(
      'withdraw_maximum_single_withdrawal_amount'.tr,
      [AppCurrencyUtils.getAppCurrencySymbol()],
    );
  }

  bool get hasUsdtAccount => selectableUSDTs.length > 0;

  Timer? _timer;

  @override
  void onInit() {
    super.onInit();
    usdtAccountAmountCtrl.addListener(() {
      if (usdtAccountAmountCtrl.text == '') {
        expectedAmount.value = '0.00';
      } else {
        if (exchangeRate <= 0) {
          expectedAmount.value = '0.00';
          return;
        }
        var amount = (double.tryParse(usdtAccountAmountCtrl.text) ?? 0);
        final rate = (double.tryParse(exchangeRate.fixed(2)) ?? 0);
        if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
          amount *= 1000;
        }
        expectedAmount.value = numberFormat(amount / rate);
      }
    });
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 30), (timer) {
      runCatch(
        () async {
          await getVirtualRate();
          var amount = (double.tryParse(usdtAccountAmountCtrl.text) ?? 0);
          final rate = (double.tryParse(exchangeRate.fixed(2)) ?? 0);
          if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
            amount *= 1000;
          }
          expectedAmount.value = numberFormat(amount / rate);
        },
        onError: (_) {},
      );
    });
  }

  @override
  void onReady() {
    super.onReady();
    runCatch(() async {
      selectableUSDTs.value = await withdrawRepository.getAccounts('2');
      if (selectableUSDTs.isNotEmpty) {
        selectedUSDTAccount = selectableUSDTs.first;
      }
      Map lastWithdrawUsdtAccount = CacheUtil.get('last_withdraw_usdt_account');
      if (lastWithdrawUsdtAccount.isNotEmpty) {
        selectedUSDTAccount = UserBankCard(
          accountType:lastWithdrawUsdtAccount["accountType"],
          bankBranch:lastWithdrawUsdtAccount["bankBranch"],
          bankCode:lastWithdrawUsdtAccount["bankCode"],
          bankName:lastWithdrawUsdtAccount["bankName"],
          bindNum:lastWithdrawUsdtAccount["bindNum"],
          bindStatus:lastWithdrawUsdtAccount["bindStatus"],
          bindUserName:lastWithdrawUsdtAccount["bindUserName"],
          blacklistStatus:lastWithdrawUsdtAccount["blacklistStatus"],
          cardNumber:lastWithdrawUsdtAccount["cardNumber"],
          city:lastWithdrawUsdtAccount["city"],
          cnName:lastWithdrawUsdtAccount["cnName"],
          createdAt:lastWithdrawUsdtAccount["createdAt"],
          createdBy:lastWithdrawUsdtAccount["createdBy"],
          dataType:lastWithdrawUsdtAccount["dataType"],
          id:lastWithdrawUsdtAccount["id"],
          isUsed:lastWithdrawUsdtAccount["isUsed"],
          merchantId:lastWithdrawUsdtAccount["merchantId"],
          province:lastWithdrawUsdtAccount["province"],
          proxyWithdrawalFailNum:lastWithdrawUsdtAccount["proxyWithdrawalFailNum"],
          proxyWithdrawalSuccessNum:lastWithdrawUsdtAccount["proxyWithdrawalSuccessNum"],
          proxyWithdrawalTotalAmount:lastWithdrawUsdtAccount["proxyWithdrawalTotalAmount"],
          realName:lastWithdrawUsdtAccount["realName"],
          remark:lastWithdrawUsdtAccount["remark"],
          sign:lastWithdrawUsdtAccount["sign"],
          status:lastWithdrawUsdtAccount["status"],
          updatedAt:lastWithdrawUsdtAccount["updatedAt"],
          updatedBy:lastWithdrawUsdtAccount["updatedBy"],
          userId:lastWithdrawUsdtAccount["userId"],
          virtualAddress:lastWithdrawUsdtAccount["virtualAddress"],
          virtualKind:lastWithdrawUsdtAccount["virtualKind"],
          virtualProtocol:lastWithdrawUsdtAccount["virtualProtocol"],
          windControlId:lastWithdrawUsdtAccount["windControlId"],
          windControlName:lastWithdrawUsdtAccount["windControlName"],
          withdrawalFailNum:lastWithdrawUsdtAccount["withdrawalFailNum"],
          withdrawalSuccessNum:lastWithdrawUsdtAccount["withdrawalSuccessNum"],
          withdrawalTime:lastWithdrawUsdtAccount["withdrawalTime"],
          withdrawalTotalAmount:lastWithdrawUsdtAccount["withdrawalTotalAmount"],
        ); 
      }
      getVirtualRate();
    }, onError: (_) {
      expectedAmount.value = '0.00';
    });
  }

  ///汇率类型 1-会员存款 2-会员取款 3-代理存款 4-代理取款
  ///目前包网没有代理业务？？？
  Future<void> getVirtualRate() async {
    final res = await withdrawRepository.getVirtualRatePost(2);
    exchangeRate = res.memberWithdrawRate.toDouble();
    update();
  }

  Future<void> refreshUsdtAccount() async {
    runCatch(() async {
      selectableUSDTs.value = await withdrawRepository.getAccounts('2');
      selectableUSDTs.refresh();
      if (selectableUSDTs.isNotEmpty) {
        selectedUSDTAccount = selectableUSDTs.first;
      }

      Map lastWithdrawUsdtAccount = CacheUtil.get('last_withdraw_usdt_account');
      if (lastWithdrawUsdtAccount.isNotEmpty) {
        selectedUSDTAccount = UserBankCard(
          accountType:lastWithdrawUsdtAccount["accountType"],
          bankBranch:lastWithdrawUsdtAccount["bankBranch"],
          bankCode:lastWithdrawUsdtAccount["bankCode"],
          bankName:lastWithdrawUsdtAccount["bankName"],
          bindNum:lastWithdrawUsdtAccount["bindNum"],
          bindStatus:lastWithdrawUsdtAccount["bindStatus"],
          bindUserName:lastWithdrawUsdtAccount["bindUserName"],
          blacklistStatus:lastWithdrawUsdtAccount["blacklistStatus"],
          cardNumber:lastWithdrawUsdtAccount["cardNumber"],
          city:lastWithdrawUsdtAccount["city"],
          cnName:lastWithdrawUsdtAccount["cnName"],
          createdAt:lastWithdrawUsdtAccount["createdAt"],
          createdBy:lastWithdrawUsdtAccount["createdBy"],
          dataType:lastWithdrawUsdtAccount["dataType"],
          id:lastWithdrawUsdtAccount["id"],
          isUsed:lastWithdrawUsdtAccount["isUsed"],
          merchantId:lastWithdrawUsdtAccount["merchantId"],
          province:lastWithdrawUsdtAccount["province"],
          proxyWithdrawalFailNum:lastWithdrawUsdtAccount["proxyWithdrawalFailNum"],
          proxyWithdrawalSuccessNum:lastWithdrawUsdtAccount["proxyWithdrawalSuccessNum"],
          proxyWithdrawalTotalAmount:lastWithdrawUsdtAccount["proxyWithdrawalTotalAmount"],
          realName:lastWithdrawUsdtAccount["realName"],
          remark:lastWithdrawUsdtAccount["remark"],
          sign:lastWithdrawUsdtAccount["sign"],
          status:lastWithdrawUsdtAccount["status"],
          updatedAt:lastWithdrawUsdtAccount["updatedAt"],
          updatedBy:lastWithdrawUsdtAccount["updatedBy"],
          userId:lastWithdrawUsdtAccount["userId"],
          virtualAddress:lastWithdrawUsdtAccount["virtualAddress"],
          virtualKind:lastWithdrawUsdtAccount["virtualKind"],
          virtualProtocol:lastWithdrawUsdtAccount["virtualProtocol"],
          windControlId:lastWithdrawUsdtAccount["windControlId"],
          windControlName:lastWithdrawUsdtAccount["windControlName"],
          withdrawalFailNum:lastWithdrawUsdtAccount["withdrawalFailNum"],
          withdrawalSuccessNum:lastWithdrawUsdtAccount["withdrawalSuccessNum"],
          withdrawalTime:lastWithdrawUsdtAccount["withdrawalTime"],
          withdrawalTotalAmount:lastWithdrawUsdtAccount["withdrawalTotalAmount"],
        );
      }
      update();
    });
  }

  String getInputHint() {
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      return '${AppCurrencyUtils.dealBalance(
        usdtWithdrawMinAmount.toString(),
      )}-${AppCurrencyUtils.dealBalance(
        virtualCardMaxAmount.toString(),
      )}';
    }
    return '${'input_withdrawal_amount'.tr}${Get.locale!.languageCode=='zh'?'（':'('}${AppCurrencyUtils.dealBalance(usdtWithdrawMinAmount.toString())}-${AppCurrencyUtils.dealBalance(virtualCardMaxAmount.toString())}${Get.locale!.languageCode=='zh'?'）':')'}';
  }

  void withdrawMaxAmount() {
    hideKeyboard();
    if (!(Get.find<WithdrawController>().allowWithdraw ?? false)) return;
    if (usdtWithdrawMaxAmount < 0) return;
    var usdtWithdrawMaxAmountIn = usdtWithdrawMaxAmount;
    if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
      usdtWithdrawMaxAmountIn = usdtWithdrawMaxAmount / 1000;
    }
    usdtAccountAmountCtrl.text = usdtWithdrawMaxAmountIn.floor().toString();
  }

  void addUSDTAccount() {
    // if (authService.isTryPlay) {
    //   warnDialog('withdraw_trial_account_does_not_support_binding_usdt'.tr);
    //   return;
    // }
    if (authService.authState is LoggedIn) {
      // final user = (authService.authState as LoggedIn).uiUser;
      // if (user.phone?.isEmpty ?? true) {
      //   OBDialogUtil.show(
      //     ObaseDialog.alert(
      //       title: 'alert'.tr,
      //       content: 'withdraw_do_you_want_to_go_to_bind_the_mobile_phone_number'.tr,
      //       confirmText: 'continue'.tr,
      //       onConfirmListener: () {
      //         Get.back();
      //         Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
      //       },
      //     ),
      //   );
      // } else {
      Get.toNamed('${AppRoutes.ACCOUNT}${AppRoutes.CRYPTOCURRENCY}');
      // }
    }
  }

  void selectUSDTAccount() async {
    final selectedBank = await Get.bottomSheet(
      ObBottomSheet.list(
        title: 'withdraw_select_the_virtual_currency_address'.tr,
        onCancelListener: () => Get.back(),
        children: selectableUSDTs
            .map((b) => GestureDetector(
                  onTap: () => Get.back(result: b),
                  child: SelectListTile(
                    // leading: pkObImage(
                    //   USDT_PROTOCOL_ICON_DIC[b.virtualProtocol] ?? '',
                    //   width: 24.w,
                    // ),
                    height: 64.w,
                    selected: selectedUSDTAccount?.id == b.id,
                    title: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          '${b.virtualProtocol ?? ''}'.tr +
                              'virtual_protocol'.tr,
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 8.w,
                        ),
                        Text(
                          '(${b.virtualAddress ?? ''})',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.6),
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ))
            .toList(),
        footer: selectableUSDTs.length < 3
            ? GestureDetector(
                onTap: () {
                  Get.back();
                  Get.toNamed(
                      '${AppRoutes.ACCOUNT}${AppRoutes.CRYPTOCURRENCY}');
                },
                child: NavigateListTile(
                  leading: pkObImage(
                    Assets.images.icon.iconUsdtCommon.path,
                    width: 24.w,
                  ),
                  title: Text(
                    'withdraw_add_new_virtual_currency_address'.tr,
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
                      'withdraw_add_up_to3_virtual_currency_addresses'.tr,
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
      selectedUSDTAccount = selectedBank;
    }
  }

  void withdrawUSDT() async {
    if (selectedUSDTAccount == null) {
      showToast('withdraw_please_select_usdt_account'.tr);
      return;
    }
    runCatch(() async {
      await getVirtualRate();
      var amount = (double.tryParse(usdtAccountAmountCtrl.text) ?? 0);
      if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
        amount *= 1000;
      }
      final rate = (double.tryParse(exchangeRate.fixed(2)) ?? 0);
      expectedAmount.value = numberFormat(amount / rate);

      final confirmed = await OBDialogUtil.show(
        ObaseDialog.alert(
          title: 'alert'.tr,
          content: sprintf('withdraw_current_real_time_exchange_rate'.tr, [
            AppCurrencyUtils.dealBalance(exchangeRate.toString()) +
                " " +
                SpUtil.getString(Constants.appCurrency, defValue: "CNY")!,
            expectedAmount
          ]),
          confirmText: 'user_profile_understood'.tr,
          onConfirmListener: () => Get.back(result: true),
        ),
      );
      if (confirmed == true) {
        isLoadingStatus.value = true;
        await withdrawRepository.postWithdrawal(
          selectedUSDTAccount!.id!,
          InstallDeviceType.platFormInfo.deviceId.toString(),
          AppCurrencyUtils.getAppCurrencySymbolIsVND()
              ? "${double.parse(usdtAccountAmountCtrl.text) * 1000}"
              : usdtAccountAmountCtrl.text,
          '2',
        );
        isLoadingStatus.value = false;
        Bank data = Bank(
          accountType: selectedUSDTAccount?.accountType,
          bankBranch: selectedUSDTAccount?.bankBranch,
          bankCode: selectedUSDTAccount?.bankCode,
          bankName: selectedUSDTAccount?.bankName,
          cnName: selectedUSDTAccount?.cnName,
          id: selectedUSDTAccount?.id,
          isUsed: selectedUSDTAccount?.isUsed,
          merchantId: selectedUSDTAccount?.merchantId,
          province: selectedUSDTAccount?.province,
          realName: selectedUSDTAccount?.realName,
          status: selectedUSDTAccount?.status,
          userId: selectedUSDTAccount?.userId,
          virtualAddress: selectedUSDTAccount?.virtualAddress,
          virtualKind: selectedUSDTAccount?.virtualKind,
          virtualProtocol: selectedUSDTAccount?.virtualProtocol,
        );
        showToast('withdraw_successfully'.tr);
        CacheUtil.save('last_withdraw_usdt_account', data);
        if (Get.isRegistered<WithdrawController>()) {
          Get.find<WithdrawController>().onRefresh(needAbleTotal: false);
        }
        showToast('withdraw_successfully'.tr);
        usdtAccountAmountCtrl.text = '';
      }
    }, handleError: (e) => isLoadingStatus.value = false);
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
    _timer?.cancel();
    usdtAccountAmountCtrl.dispose();
    super.onClose();
  }
}

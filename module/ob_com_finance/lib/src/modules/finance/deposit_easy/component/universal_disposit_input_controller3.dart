import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/deposit_easy_controller.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/repository/deposit_easy_repository.dart';
import 'package:params/params.dart';
import 'package:wallet/wallet.dart';

class UniversalDepositInputController3 extends AppGetController with FormValidate, KeyboardManager {
  final walletApi = Get.find<WalletApi>();
  UiPayType payType;
  final AuthService authService;
  final DepositEasyRepository repository;
  final DepositEasyController depositEasyController;
  final _editAmount = ''.obs;
  final _trcAmount = ''.obs;
  final _editRealName = ''.obs;
  final usdtRate = 1.00.obs;
  final usdt = '0'.obs;
  RxBool isLoadingStatus = false.obs;

  get editAmount => _editAmount.value;

  get trcAmount => _trcAmount.value;

  get editRealName => _editRealName.value;

  get depositMaxAmount => payType.depositMaxAmount;

  final amountCtrl = TextEditingController();
  final nameCtrl = TextEditingController();

  UniversalDepositInputController3(
    this.payType,
    this.authService,
    this.repository,
    this.depositEasyController,
  );

  @override
  void onInit() {
    super.onInit();
    if (payType.virtualProtocols.isNotEmpty) {
      _trcAmount.value = payType.virtualProtocols[0];
    }

    amountCtrl.addListener(() {
      _editAmount.value = amountCtrl.text;
      int n = 1;
      if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
        n = 1000;
      }
      double sValue = NullUtils.toDouble(
        NumberUtils.divide(NullUtils.toDouble(amountCtrl.text) * n, usdtRate.value).toString(),
      );
      var sValue2 = (sValue * 100).ceil();
      sValue = NullUtils.toDouble(NumberUtils.divide(sValue2, 100).toString());
      usdt.value = sValue.toStringAsFixed(2).toString();
    });
    nameCtrl.addListener(() {
      _editRealName.value = nameCtrl.text;
    });

    getVirtualRate();
  }

  void onTrcAmountSelect(String trc) {
    _trcAmount.value = trc;
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

  ///汇率类型 1-会员存款 2-会员取款 3-代理存款 4-代理取款
  Future<void> getVirtualRate() async {
    runCatch(
      () async {
        final res = await walletApi.getVirtualRate(
          VirtualRateType(
            virtualRateType: depositEasyController.chargeType > 0 ? 3 : 1,
          ),
        );
        if (depositEasyController.chargeType > 0) {
          usdtRate.value = res.proxyDepositRate.toDouble();
        } else {
          usdtRate.value = res.memberDepositRate.toDouble();
        }

        double sValue = NumberUtils.divide(
          NullUtils.toDouble(amountCtrl.text),
          usdtRate.value,
        );
        var sValue2 = (sValue * 100).ceil();
        sValue = NumberUtils.divide(sValue2, 100);
        usdt.value = sValue.toStringAsFixed(2).toString();
      },
      onError: (e) {},
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
        showLoading();
        WebUtil.windowPreOpen();
        final res = await repository.postDeposit(
          payType.realObj!.id,
          AppCurrencyUtils.getAppCurrencySymbolIsVND() ? "${double.parse(amountCtrl.text) * 1000}" : amountCtrl.text,
          depositEasyController.chargeType,
          nameCtrl.text,
          _trcAmount.value,
          bankId: '',
        );

        dismissLoading();
        isLoadingStatus.value = false;
        // 这个字段目前没有返回0的情况，因为现在返回的response是一串html代码，flag这个以后可能会有0的情况，可能response返回的是一个url 用来跳转的
        WebUtil.openInApp(
          res.response,
          showTitle: true,
          hasLoading: true,
          title: '充值',
          isHtml: res.frontLoadFlag == 1,
        );
      }, onError: (e) {
        WebUtil.windowClose();
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
  Future<void> onClose() async {
    amountCtrl.dispose();
    nameCtrl.dispose();
    super.onClose();
  }

  @override
  void onBusEvent(BusEvent event) {
    if (event.id == RxEvent.refreshUsdtRate) {
      getVirtualRate();
      return;
    }
  }
}

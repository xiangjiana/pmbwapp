import 'package:capital/capital.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/tip.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/repository/withdraw_repository.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;
import 'bank_card_withdraw_controller.dart';
import 'cryptocurrency_withdraw_controller.dart';

class WithdrawController extends GetxController
    with KeyboardManager, SingleGetTickerProviderMixin {
  final WithdrawRepository withdrawRepository;
  final AuthService authService;
  final BankCardWithdrawController bankCardWithdrawController;
  final CryptoCurrencyWithdrawController cryptoCurrencyWithdrawController;
  final MyWalletRepository myWalletRepository = MyWalletRepository();
  static final String dictionaryKey = 'withdraw.card.show.onoff';

  final List<RefreshController> refreshControllers =
      List<RefreshController>.generate(
          Store.isBaimhWithdraw
              ? int.tryParse(Store.dictionary[dictionaryKey]) == 0
                  ? 3
                  : 2
              : int.tryParse(Store.dictionary[dictionaryKey]) == 0
                  ? 2
                  : 1,
          (index) => RefreshController());

  final List<ScrollController> scrollControllers =
      List<ScrollController>.generate(
          Store.isBaimhWithdraw
              ? int.tryParse(Store.dictionary[dictionaryKey]) == 0
                  ? 3
                  : 2
              : int.tryParse(Store.dictionary[dictionaryKey]) == 0
                  ? 2
                  : 1,
          (index) => ScrollController());

  final FocusNode bankInputFocusNode = FocusNode();
  final FocusNode cryptoFocusNode = FocusNode();

  final _isWalletDetailExpand = true.obs;

  bool get isWalletDetailExpand => _isWalletDetailExpand.value;

  set isWalletDetailExpand(value) => _isWalletDetailExpand.value = value;

  /// 是否允许提款
  final _allowWithdraw = RxnBool(null);

  bool? get allowWithdraw => _allowWithdraw.value;

  /// 总剩余流水额
  final _totalDifferentAmount = '--'.obs;

  String get totalDifferentAmount => _totalDifferentAmount.value;

  /// 可提款金额
  String get totalWithdrawAble => BalanceManager.centerBalance.value;

  /// 银行卡单次提款最低限额
  final _bankCardMinAmount = '--'.obs;

  String get bankCardMinAmount => _bankCardMinAmount.value;

  /// 银行卡单次提款最高限额
  final _bankCardMaxAmount = '--'.obs;

  String get bankCardMaxAmount => _bankCardMaxAmount.value;

  /// 今日可用提款次数
  final _dateNum = '--'.obs;

  String get dateNum => _dateNum.value;

  /// 今日可用提款额度
  final _dateWithdrawAbleAmount = '--'.obs;

  String get dateWithdrawAbleAmount => _dateWithdrawAbleAmount.value;

  /// 虚拟币单次提款最低限额
  final _virtualCardMinAmount = '--'.obs;

  String get virtualCardMinAmount => _virtualCardMinAmount.value;

  /// 虚拟币单次提款最高限额
  final _virtualCardMaxAmount = '--'.obs;

  String get virtualCardMaxAmount => _virtualCardMaxAmount.value;

  /// 是否用银行卡取过款
  final _isWithdrawByBank = false.obs;

  bool get isWithdrawByBank => _isWithdrawByBank.value;

  /// 是否显示一键回收不再提示
  final _isShowRecycleTip = false.obs;

  set isShowRecycleTip(bool value) => _isShowRecycleTip.value = value;

  bool get isShowRecycleTip => _isShowRecycleTip.value;

  bool get isTryPlay => authService.isTryPlay;

  WithdrawController(
    this.withdrawRepository,
    this.authService,
    this.bankCardWithdrawController,
    this.cryptoCurrencyWithdrawController,
  );

  late final tabController;

  @override
  void onInit() {
    super.onInit();
    hideKeyboard();
    tabController = TabController(
      length: !AppMerchantUtils.loadCurMerchantBy(OBModules.vUSDT) ? 1 : 2,
      vsync: this,
      initialIndex: 0,
    )..addListener(() {
        hideKeyboard();
      });
  }

  final capitalApi = Get.find<CapitalApi>();

  @override
  void onReady() {
    super.onReady();
    runCatch(() async {
      if (!authService.isTryPlay && authService.isAutoTransferOpen) {
        await capitalApi.withdraw();
      }
      await onRefresh();
      authService.syncUser(); //刷新用户取款成功次数 决定虚拟币是否允许取款
    });
  }

  Future<void> moveViewToTop(int index) async {
    await Future.delayed(Duration(milliseconds: 200));
    scrollControllers[index].animateTo(
      Get.context!.mediaQueryViewInsets.bottom == 0
          ? 0
          : Get.context!.mediaQueryViewInsets.bottom,
      duration: Duration(microseconds: 200),
      curve: Curves.linear,
    );
  }

  getBack() async {
    Get.back();
  }

  onRefresh({bool needAbleTotal = true}) async {
    runCatch(() async {
      final res1 = await withdrawRepository.getMemberWithdrawInfo();
      StillBillAmount? res2;
      if (needAbleTotal) {
        res2 = await withdrawRepository.getUserBillDetails();
      }

      await BalanceManager.syncAll();
      await cryptoCurrencyWithdrawController.getVirtualRate();
      await bankCardWithdrawController.refreshBankAccount();
      await cryptoCurrencyWithdrawController.refreshUsdtAccount();
      _bankCardMinAmount.value = res1.bankCardMinAmount.toString();
      _bankCardMaxAmount.value = res1.bankCardMaxAmount.toString();
      _dateNum.value = res1.dateNum.toInt().toString();
      _dateWithdrawAbleAmount.value = res1.dateWithdrawAbleAmount.toString();
      _virtualCardMinAmount.value = res1.virtualCardMinAmount.toString();
      _virtualCardMaxAmount.value = res1.virtualCardMaxAmount.toString();
      _isWithdrawByBank.value = res1.isWithdrawalByBank == 1;

      if (needAbleTotal) {
        _allowWithdraw.value = res2?.allowWithdraw ?? false;
        _totalDifferentAmount.value = res2?.differentAmount.fixed(2) ?? "0.00";
      }

      refreshControllers.forEach((element) {
        element.refreshCompleted();
      });
    }, onError: (e) {
      refreshControllers.forEach((element) {
        element.refreshFailed();
      });
    });
  }

  void toggleWalletDetailSwitch() {
    isWalletDetailExpand = !isWalletDetailExpand;
  }

  void showFlowDialog() {
    runCatch(() async {
      final cancel = showGaLoading();
      final res = await withdrawRepository.getUserBillDetails();
      final lastDepositAmount = await withdrawRepository.getLastDepositAmount();
      cancel();
      OBDialogUtil.show(
        ObDialog(
          background: ObTheming.obDialogBgColor,
          titleWidget: Text(
            'withdraw_flowing_water_details'.tr,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          contentWidget: Padding(
            padding: EdgeInsets.only(top: 16.w, bottom: 24.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Tip(
                  padding: EdgeInsets.all(12.w),
                  margin: EdgeInsets.only(top: 12.w, bottom: 16.w),
                  borderRadius: 8.w,
                  backgroundColor: Colors.white.withOpacity(0.04),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'withdraw_recharge_amount'.tr,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white60),
                          )),
                          Text(
                            AppCurrencyUtils.getAppCurrencySymbolIsVND()
                                ? "${(lastDepositAmount.item1 / 1000).fixed(2)}K"
                                : AppCurrencyUtils.dealBalance(
                                    lastDepositAmount.item1.toString(),
                                  ),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Row(
                        children: [
                          Expanded(
                              child: Text(
                            'withdraw_earned_dividends'.tr,
                            style:
                                TextStyle(fontSize: 12, color: Colors.white60),
                          )),
                          Text(
                            AppCurrencyUtils.getAppCurrencySymbolIsVND()
                                ? "${(lastDepositAmount.item2 / 1000).fixed(2)}K"
                                : lastDepositAmount.item2.fixed(2),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 8.w,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              'withdraw_flow_has_been_completed'.tr,
                              style: TextStyle(
                                  fontSize: 12, color: Colors.white60),
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                                text:
                                    '${AppCurrencyUtils.dealBalance(res.completeAmount.toString())}',
                                children: [
                                  TextSpan(
                                    text:
                                        '/${AppCurrencyUtils.dealBalance("${res.differentAmount + res.completeAmount}")}',
                                    style: TextStyle(color: Colors.white60),
                                  )
                                ]),
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            '${numberFormat(res.completeAmount / (res.differentAmount + res.completeAmount) * 100, comma: false)}%',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color(0xffE1A100),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Text(
                  'withdraw_withdrawal_operation'.tr.breakWordOnWeb,
                  style: TextStyle(fontSize: 12, color: Colors.white60),
                ),
              ],
            ),
          ),
          actionsWidget: OBasePrimaryButton(
            block: true,
            size: ButtonSize.large,
            image: DecorationImage(
              image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
              fit: BoxFit.fill,
            ),
            onPressed: () => Get.back(),
            child: Text(
              'user_profile_understood'.tr,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
        ),
      );
    });
  }

  void showRecycleTip() {
    isShowRecycleTip = true;
  }

  Future<void> recyclerBalance() async {
    showRecycleTip();
    await BalanceManager.recyclerBalance();
  }

  void hideRecycleTip() {
    isShowRecycleTip = false;
    Store.recycleTipSwitch = false;
  }

  @override
  void onClose() {
    refreshControllers.forEach((element) {
      element.dispose();
    });
    scrollControllers.forEach((element) {
      element.dispose();
    });
    bankInputFocusNode.dispose();
    cryptoFocusNode.dispose();
    super.onClose();
  }
}

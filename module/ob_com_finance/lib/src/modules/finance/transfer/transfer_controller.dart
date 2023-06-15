import 'dart:async';

import 'package:capital/capital.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart' hide Navigator;
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/repository/transfer_repository.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:params/params.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sprintf/sprintf.dart';
import 'component/select_wallet.dart';
import 'repository/ui_account.dart';

class TransferController extends GetxController with FormValidate {
  final TransferRepository transferRepository;
  final AuthService authService;
  final capitalApi = Get.find<CapitalApi>();

  RxBool isLoadingStatus = false.obs;
  bool curIsVND = false;
  FocusNode focusNode = FocusNode();

  TransferController(this.transferRepository, this.authService,
      {this.isFromHome = false});

  MyWalletRepository myWalletRepository = MyWalletRepository();

  final transferAmountCtrl = TextEditingController();

  Rx<UiAccount?> rxTransferInAccount = Rx<UiAccount?>(null);

  UiAccount? get transferInAccount => rxTransferInAccount.value;

  set transferInAccount(value) {
    rxTransferInAccount.value = value;
  }

  Rx<UiAccount?> rxTransferOutAccount = Rx<UiAccount?>(null);

  UiAccount? get transferOutAccount => rxTransferOutAccount.value;

  set transferOutAccount(value) {
    rxTransferOutAccount.value = value;
  }

  bool isFromHome = false;

  /// 是否从中心钱包转出
  final _isTransferOutFromCenter = true.obs;

  set isTransferOutFromCenter(value) => _isTransferOutFromCenter.value = value;

  bool get isTransferOutFromCenter => _isTransferOutFromCenter.value;

  List<UiAccount> get _accounts {
    final list = BalanceManager.walletItems //merchantGames
        .map((element) => UiAccount(element.name, element.id, element.balance))
        .toList();

    /// 中心钱包的id设为0
    list.insert(
        0,
        UiAccount(
            'mine_center_wallet'.tr, '0', BalanceManager.centerBalance.value));
    return list;
  }

  num get transferMaxAmount {
    if (transferOutAccount == null) {
      return double.infinity;
    } else {
      if (transferOutAccount!.accountId == '0') {
        return double.tryParse(BalanceManager.centerBalance.value) ?? 0.00;
      } else {
        return double.tryParse(transferOutAccount!.accountBalance) ?? 0.00;
      }
    }
  }

  num get transferMinAmount => transferOutAccount == null ? double.infinity : 0;

  bool get isTryPlay => authService.isTryPlay;

  double getAccountBalance(UiAccount? account) {
    if (account != null) {
      String accountId = account.accountId;
      //中心钱包
      if (accountId == '0') {
        return double.tryParse(BalanceManager.centerBalance.value) ?? 0.00;
      }
      return double.tryParse(account.accountBalance) ?? 0.00;
    }
    return 0.00;
  }

  @override
  void onReady() {
    super.onReady();
    curIsVND = SpUtil.getString(Constants.appCurrency,
            defValue: Store.merchantCurrency) ==
        'VND';
    if (curIsVND) {
      focusNode.addListener(() {
        if (!focusNode.hasFocus) {
          // transferAmountCtrl.text =
          //     '${transferAmountCtrl.text.substring(0, transferAmountCtrl.text.length - 1)}0';
          focusNode.unfocus();
        }
      });
    }

    String transferInId = '';
    String transferOutId = '';

    if (isFromHome) {
      transferOutId = '0';
    } else {
      Map m = Get.parameters;
      //直接进入的转账页面，转出钱包默认为中心钱包
      // 在钱包点击转出/转入进入转账页面
      transferInId = m['transferInId'] ?? '';
      transferOutId = m['transferOutId'] ?? '0';
    }

    isTransferOutFromCenter = transferOutId == '0';
    transferInAccount =
        _accounts.firstWhereOrNull((e) => e.accountId == transferInId);
    transferOutAccount =
        _accounts.firstWhereOrNull((e) => e.accountId == transferOutId);
    update();

    runCatch(() async {
      await BalanceManager.syncAll();
    });
  }

  void toggleAutoTransferSwitch(BuildContext context) async {
    if (authService.authState is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      final confirm = await OBDialogUtil.show<bool>(
          ObDialog.alert(
            background: Color(0xff171E24),
            title: 'alert'.tr,
            content: user.isAutoTransferOpen
                ? 'my_wallet_turn_off_the_automatic_carry_in_amount'.tr
                : 'my_wallet_enable_automatic_transfer_of_amount'.tr,
            confirmText: 'confirm'.tr,
            cancelText: 'cancel'.tr,
            conformColor: ObDialogAlertType.purple,
            onConfirmListener: () {
              Navigator.of(context).pop(true);
            },
            onCancelListener: () => Navigator.of(context).pop(),
          ),
          context: context);
      if (confirm == true) {
        runCatch(() async {
          final cancel = showLoading();
          await capitalApi.noTransfer(SetTransferInfoParam(
              noTransfer: user.isAutoTransferOpen ? 0 : 1));
          cancel();
          showToast(user.isAutoTransferOpen
              ? 'my_wallet_automatic_carry_in_amount_is_turned_off'.tr
              : 'my_wallet_automatic_transfer_amount_is_turned_on'.tr);
          authService.syncUserAutoUpdateSetting(!user.isAutoTransferOpen);
        });
      }
    }
  }

  void transferAll() {
    if (transferOutAccount != null) {
      final balance = transferOutAccount!.accountId == '0'
          ? BalanceManager.centerBalance.value
          : BalanceManager.walletItems // merchantGames
              .where((e) => e.id == transferOutAccount!.accountId)
              .first
              .balance;
      if (balance != '-.-') {
        transferAmountCtrl.text = AppCurrencyUtils.getAppCurrencySymbolIsVND()
            ? numberFormat(double.parse(balance) / 1000)
            : numberFormat(balance);
        transferAmountCtrl.selection = TextSelection.fromPosition(
          TextPosition(offset: transferAmountCtrl.text.length),
        );
      }
    }
  }

  void transfer(BuildContext context) {
    focusNode.unfocus();
    if (transferInAccount == null) {
      showToast("my_wallet_please_select_a_wallet".tr);
      return;
    }
    if (transferOutAccount == null) {
      showToast("my_wallet_please_select_a_wallet".tr);
      return;
    }
    if (transferInAccount!.accountId == transferOutAccount!.accountId) {
      showToast("vip_level_trans_tips".tr);
      return;
    }

    /// 交易类型：0 钱包到场馆 1 场馆到钱包
    final transferType = transferOutAccount!.accountId == '0' ? '0' : '1';
    void transferRequest() {
      runCatch(() async {
        if (CoolDownManager.handler(key: 'kCoolDownTransfer', duration: 1000)) {
          isLoadingStatus.value = true;
          String amount = AppCurrencyUtils.getAppCurrencySymbolIsVND()
              ? "${double.parse(transferAmountCtrl.text.replaceAll(',', '')) * 1000}"
              : transferAmountCtrl.text.replaceAll(',', '');
          transferAmountCtrl.clear();
          String gameCode = transferType == '0'
              ? transferInAccount!.accountId
              : transferOutAccount!.accountId;
          await capitalApi.balanceTransfer(BalanceTransferParam(
              amount: amount, gameCode: gameCode, transferType: transferType));
          await BalanceManager.syncAll();
          handleUpdateBalance();
          onChangeAutoTransferSwitch(true);
          isLoadingStatus.value = false;
          showToast("transfer_successful_transfer".tr);
        }
      }, handleError: (e) => isLoadingStatus.value = false);
    }

    /// 从中心钱包到场馆
    if (transferType == '0') {
      final merchant = BalanceManager.walletItems // merchantGames
          .firstWhereOrNull((e) => e.id == transferInAccount!.accountId);

      if (merchant != null) {
        if (merchant.enabled) {
          if (merchant.vipActivityGoing) {
            runCatch(() async {
              final cancel = showLoading();
              final res = await myWalletRepository.getFlowDetail(merchant.id);
              var transferAmount =
                  double.parse(transferAmountCtrl.text.replaceAll(',', ''));
              if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
                transferAmount = transferAmount * 1000;
              }
              final flowLimit =
                  (res.billAmount - res.completeBillAmount) + transferAmount;
              cancel();
              final confirmed = await OBDialogUtil.show<bool>(
                ObDialog.alert(
                  background: Color(0xff171E24),
                  title: 'alert'.tr,
                  content: sprintf(
                      'transfer_since_the_activity_of_this_platform_is_in_progress'
                          .tr,
                      [AppCurrencyUtils.dealBalance(flowLimit.toString())]),
                  confirmText: 'confirm'.tr,
                  cancelText: 'cancel'.tr,
                  conformColor: ObDialogAlertType.purple,
                  onConfirmListener: () => Navigator.of(context).pop(true),
                  onCancelListener: () => Navigator.of(context).pop(),
                ),
                context: context,
              );
              if (confirmed == true) {
                transferRequest();
              }
            });
          } else {
            transferRequest();
          }
        } else {
          showToast(
              "this_venue_is_under_maintenance_please_select_another_venue".tr);
        }
      }
    }

    /// 从场馆到中心钱包
    if (transferType == '1') {
      final merchant = BalanceManager.walletItems // merchantGames
          .firstWhereOrNull((e) => e.id == transferOutAccount!.accountId);
      if (merchant != null) {
        if (merchant.enabled) {
          if (merchant.vipActivityGoing) {
            showToast("transfer_in_activities_cannot_be_transferred_out".tr);
          } else {
            transferRequest();
          }
        } else {
          showToast(
              "this_venue_is_under_maintenance_please_select_another_venue".tr);
        }
      }
    }
  }

  void handleUpdateBalance() {
    if (transferInAccount != null) {
      for (int i = 0; i < BalanceManager.walletItems.length; i++) {
        UiWalletItem walletItem = BalanceManager.walletItems[i];
        if (walletItem.id == transferInAccount?.accountId) {
          transferInAccount = transferInAccount?.copyWith(
            accountBalance: walletItem.balance,
          );
        }
      }
    }
    var accountId = transferOutAccount?.accountId;
    if (accountId != "0") {
      for (int i = 0; i < BalanceManager.walletItems.length; i++) {
        UiWalletItem walletItem = BalanceManager.walletItems[i];
        if (walletItem.id == transferOutAccount?.accountId) {
          transferOutAccount = transferOutAccount?.copyWith(
            accountBalance: walletItem.balance,
          );
        }
      }
    }

    // runCatch(() {
    //   double kCenterBalance = double.parse(BalanceManager.centerBalance.value);
    //   Decimal centerBalance = Decimal.parse(BalanceManager.centerBalance.value);
    //
    //   final inAccount = transferInAccount;
    //   if (inAccount != null) {
    //     final accountId = inAccount.accountId;
    //     Decimal transferAmount = Decimal.parse(tAmount);
    //     if (accountId != '0') {
    //       for (int i = 0; i < BalanceManager.walletItems.length; i++) {
    //         if (BalanceManager.walletItems[i].id == inAccount.accountId) {
    //           Decimal walletBalance = Decimal.parse(inAccount.accountBalance);
    //           Decimal amount;
    //           if (operator == 'transfer') {
    //             amount = walletBalance + transferAmount;
    //           } else {
    //             if (BalanceManager.walletItems[i].vipActivityGoing) {
    //               amount = walletBalance;
    //             } else {
    //               amount = walletBalance - transferAmount;
    //             }
    //           }
    //           BalanceManager.walletItems[i] = BalanceManager.walletItems[i].copyWith(balance: amount.toString());
    //           transferInAccount = inAccount.copyWith(accountBalance: amount.toString(),);
    //           break;
    //         }
    //       }
    //     } else {
    //       if (operator == 'transfer') {
    //         centerBalance = centerBalance + transferAmount;
    //         centerBalance = centerBalance.toDouble() > kCenterBalance
    //             ? Decimal.parse(kCenterBalance.toString())
    //             : centerBalance;
    //       } else {
    //         centerBalance = centerBalance - transferAmount;
    //         centerBalance =
    //             centerBalance.toDouble() < 0 ? Decimal.zero : centerBalance;
    //       }
    //       BalanceManager.centerBalance.value = centerBalance.toString();
    //     }
    //   }
    //
    //   final outAccount = transferOutAccount;
    //   if (outAccount != null) {
    //     final accountId = outAccount.accountId;
    //     Decimal transferAmount = Decimal.parse(tAmount);
    //     if (accountId != '0') {
    //       for (int i = 0; i < BalanceManager.walletItems.length; i++) {
    //         if (BalanceManager.walletItems[i].id == outAccount.accountId) {
    //           Decimal walletBalance = Decimal.parse(outAccount.accountBalance);
    //           Decimal amount;
    //           if (operator == 'transfer') {
    //             amount = walletBalance - transferAmount;
    //           } else {
    //             if (BalanceManager.walletItems[i].vipActivityGoing) {
    //               amount = walletBalance;
    //             } else {
    //               amount = walletBalance - transferAmount;
    //             }
    //           }
    //           BalanceManager.walletItems[i] = BalanceManager.walletItems[i]
    //               .copyWith(balance: amount.toString());
    //           transferOutAccount = outAccount.copyWith(
    //             accountBalance: amount.toString(),
    //           );
    //           break;
    //         }
    //       }
    //     } else {
    //       Decimal centerBalance =
    //           Decimal.parse(BalanceManager.centerBalance.value);
    //       if (operator == 'transfer') {
    //         centerBalance = centerBalance - transferAmount;
    //         centerBalance = centerBalance.toDouble() < 0 ? Decimal.zero : centerBalance;
    //       } else {
    //         centerBalance = centerBalance + transferAmount;
    //         centerBalance = centerBalance.toDouble() > kCenterBalance
    //             ? Decimal.parse(kCenterBalance.toString())
    //             : centerBalance;
    //       }
    //       BalanceManager.centerBalance.value = centerBalance.toString();
    //     }
    //   }
    // });
  }

  void selectTransferInAccount(BuildContext context) async {
    if (!isTransferOutFromCenter) {
      return;
    }
    final selected = await Get.bottomSheet<UiWalletItem>(
      FractionallySizedBox(
        heightFactor: Store.clientId == Store.clientIdFYB ? 0.6 : 1,
        child: SelectWallet(
          selectId: transferInAccount?.accountId,
          isTransferOut: false,
        ),
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
      clipBehavior: Clip.hardEdge,
    );
    if (selected != null) {
      _accounts.forEach((element) {
        if (element.accountId == selected.id) {
          transferInAccount = element;
        }
      });
    }
  }

  // void selectTransferOutAccount(BuildContext context) async {
  //   if (isTransferOutFromCenter) {
  //     return;
  //   }
  //   final selected = await Get.bottomSheet<UiWalletItem>(
  //     SelectWallet(
  //       selectId: transferOutAccount?.accountId,
  //       isTransferOut: true,
  //     ),
  //     shape: RoundedRectangleBorder(
  //         borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
  //     isScrollControlled: false,
  //     backgroundColor: Color(0xff1D2933),
  //     clipBehavior: Clip.hardEdge,
  //   );
  //   if (selected != null) {
  //     _accounts.forEach((element) {
  //       if (element.accountId == selected.id) {
  //         transferOutAccount = element;
  //       }
  //     });
  //   }
  // }

  void selectTransferOutAccount(BuildContext context) async {
    if (isTransferOutFromCenter) {
      return;
    }
    final selected = await Get.bottomSheet<UiWalletItem>(
      SelectWallet(
        selectId: transferOutAccount?.accountId,
        isTransferOut: true,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
      clipBehavior: Clip.hardEdge,
    );
    if (selected != null) {
      _accounts.forEach((element) {
        if (element.accountId == selected.id) {
          transferOutAccount = element;
        }
      });
    }
  }

  void switchAccount() {
    if (transferInAccount == null) {
      showToast("my_wallet_please_select_a_wallet".tr);
      return;
    }

    final merchant = BalanceManager.walletItems // merchantGames
        .firstWhereOrNull((e) => e.id == transferInAccount!.accountId);
    if (merchant != null && merchant.enabled && merchant.vipActivityGoing) {
      showToast('transfer_cannot_be_transferred_out'
          .tr
          .replaceAll('%@', merchant.name));
      return;
    }
    UiAccount? inAccount = transferInAccount;
    UiAccount? outAccount = transferOutAccount;
    rxTransferOutAccount.value = inAccount;
    rxTransferInAccount.value = outAccount;
    isTransferOutFromCenter = transferOutAccount!.accountId == '0';
  }

  void showTip(BuildContext context) {
    OBDialogUtil.show(
      ObaseDialog.alert(
          title: 'alert'.tr,
          content: 'transfer_will_be_carried_over_to_the_entering_venue'.tr,
          confirmText: 'vip_level_active_alert_know'.tr,
          onConfirmListener: () {
            Navigator.of(context).pop();
          }),
      context: context,
      barrierDismissible: false,
    );
  }

  /// 一键回收
  Future<void> recyclerBalance() async {
    await BalanceManager.recyclerBalance();
    await BalanceManager.syncAll();
    onChangeAutoTransferSwitch(true);
    handleUpdateBalance();
    // if (transferInAccount != null) {
    //   final transferAmount = transferInAccount!.accountId == '0'
    //       ? transferOutAccount!.accountBalance
    //       : transferInAccount!.accountBalance;
    //   handleUpdateBalance('recycle', transferAmount);
    // }
  }

  /// 1 如果临时开启自动转额，需要改变 getURLable = true
  /// 2 如果临时手动转额，也需要改变 getURLable = true
  /// 3 一键回收 也需要改变 getURLable = true
  void onChangeAutoTransferSwitch(bool isAutoTransferOpen) {
    Store.getURLable = isAutoTransferOpen;
  }

  void jumpToOffice() {
    Get.toNamed(AppRoutes.h5DownloadPage);
  }

  @override
  void onClose() {
    transferAmountCtrl.dispose();
    super.onClose();
  }
}

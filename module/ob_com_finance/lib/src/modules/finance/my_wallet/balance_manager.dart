import 'package:capital/capital.dart';
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:models/models.dart';

final MyWalletRepository myWalletRepository = MyWalletRepository();
final capitalApi = Get.find<CapitalApi>();

class BalanceManager {
  BalanceManager._privateConstructor();

  static final BalanceManager _instance = BalanceManager._privateConstructor();

  static BalanceManager get instance {
    return _instance;
  }

  /// 总余额
  static RxString totalBalance = '--'.obs;

  /// 中心钱包余额（千分位）
  static String get formatTotalBalance =>
      AppCurrencyUtils.dealBalance(totalBalance.value);

  /// 中心钱包余额
  static RxString centerBalance = '--'.obs;

  /// 中心钱包余额（千分位）
  static String get formatCenterBalance =>
      AppCurrencyUtils.dealBalance(centerBalance.value);

  static double minActivityAmount = 0.0;

  /// 场馆钱包余额
  static double get venueBalance {
    if (totalBalance.value == '--' || centerBalance.value == '--') return 0.0;
    return NumUtil.subtract(
      double.parse(totalBalance.value),
      double.parse(centerBalance.value),
    );
  }

  /// 场馆钱包余额（千分位）
  static String get formatVenueBalance =>
      AppCurrencyUtils.dealBalance(venueBalance.toString());

  static RxBool isRefreshing = false.obs;
  static RxBool isRefreshDone = false.obs;

  /// 场馆钱包
  static RxList<UiWalletItem> walletItems = <UiWalletItem>[].obs;

  /// 清空钱包
  static void clear() {
    totalBalance.value = '--';
    centerBalance.value = '--';
    walletItems = <UiWalletItem>[].obs;
  }

  ///游戏钱包
  static RxList<GameBalance> gameBalance = RxList<GameBalance>();

  static VoidCallback? _callback;

  static syncAll({VoidCallback? voidCallback}) async {
    _callback = voidCallback;
    try {
      final authService = Get.find<AuthService>();
      if (!authService.isLogin) return;
      final res = await capitalApi.balanceWithBilling();
      centerBalance.value = res.centerBalance.toString();
      totalBalance.value = res.totalBalance.toString();
      List<GameBalance> gameBalance = [];
      for (var element in res.gameBalance) {
        if (Store.clientId == Store.clientIdFYB) {
          if (element.gameCode == "ty" || element.gameCode == "dj") {
            gameBalance.add(
              GameBalance(
                balance: element.balance.toDouble(),
                gameCode: element.gameCode,
                status: element.status,
                remainBilling: element.remainBilling.toDouble(),
                walletName: element.walletName,
                venueIconUrlApp: element.venueIconUrlApp,
                venueWalletIconUrl: element.venueWalletIconUrl,
                venueType: element.venueType,
                venueTypeName: element.venueTypeName,
                venueIconUrlPc: element.venueIconUrlPc,
                venueName: element.venueName,
              ),
            );
          }
        } else {
          gameBalance.add(
            GameBalance(
              balance: element.balance.toDouble(),
              gameCode: element.gameCode,
              status: element.status,
              remainBilling: element.remainBilling.toDouble(),
              walletName: element.walletName,
              venueIconUrlApp: element.venueIconUrlApp,
              venueWalletIconUrl: element.venueWalletIconUrl,
              venueType: element.venueType,
              venueTypeName: element.venueTypeName,
              venueIconUrlPc: element.venueIconUrlPc,
              venueName: element.venueName,
            ),
          );
        }
      }
      await setUiWalletItem(gameBalance);
    } catch (e) {
      throw e.toString();
    }
  }

  static setUiWalletItem(List<GameBalance> gameBalance) async {
    List<UiWalletItem> wallets = [];
    for (int i = 0; i < gameBalance.length; i++) {
      final wallet = gameBalance[i];
      bool isVipActivityGoing = wallet.remainBilling > 0;
      wallets.add(UiWalletItem(
        id: wallet.gameCode,
        name: wallet.walletName,
        balance: wallet.balance.toString(),
        status: wallet.status,
        venueType: wallet.venueType,
        vipActivityGoing: isVipActivityGoing,
        venueIconUrlApp: wallet.venueIconUrlApp,
        venueWalletIconUrl: wallet.venueWalletIconUrl,
        venueName: wallet.venueName,
      ));
    }
    walletItems.value = wallets;
    if (_callback != null) {
      _callback?.call();
    }
  }

  static refreshAll([isManualRefresh = false]) async {
    try {
      await syncAll();
      if (isManualRefresh) {
        showToast('my_wallet_balance_refresh_successfully'.tr);
      }
    } catch (_) {}
  }

  static recyclerBalance() async {
    try {
      await capitalApi.withdraw();
      await syncAll();
      showToast('my_wallet_one_click_recovery_success'.tr);
    } catch (e) {
      showToast(e.toString());
    }
  }

  static bool get isAllWalletDisabled => walletItems.every((e) => e.disabled);
}

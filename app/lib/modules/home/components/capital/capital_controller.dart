import 'package:flutter/material.dart' hide PageController;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_component/ob_component.dart' hide SizeExtension;
import 'package:params/params.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_com_base/ob_com_base.dart' hide PageResponse, Navigator;
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ledger_record_repository.dart';
import 'package:intl/intl.dart';

import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';

import '../../home_controller.dart';
import '../mine_widget_new/mine_new_controller.dart';

import '../mine_widget/mine_controller.dart';

UiTranscation transaction = TRANSACTION_DIC().first;

class CapitalController extends GetxController
    with MelosPageController<PageResponse<MemberAccountRecording>> {
  ScrollController scrollController = ScrollController();
  ScrollController scrollSmartController = ScrollController();
  final AuthService authService;
  final RefreshController refreshController = RefreshController();
  final LedgerRecordRepository repository = LedgerRecordRepository();
  RxBool visible = false.obs;
  HomePageController homePageController = Get.find<HomePageController>();

  CapitalController(this.authService);

  @override
  void onInit() {
    super.onInit();
    BalanceManager.syncAll();
    scrollController.addListener(() {
      visible.value = scrollController.offset > 256.w;
    });
    onRefresh();
  }

  void refreshInfo() {
    BalanceManager.syncAll();
    update();
  }

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final endTime =
        DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
    final startTime = DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 6))) +
        ' 00:00:00';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  /// 一键回收
  Future<void> recyclerBalance() async {
    await BalanceManager.recyclerBalance();
    await BalanceManager.syncAll();
    onChangeAutoTransferSwitch(true);
    // if (transferInAccount != null) {
    //   final transferAmount = transferInAccount!.accountId == '0'
    //       ? transferOutAccount!.accountBalance
    //       : transferInAccount!.accountBalance;
    //   handleUpdateBalance('recycle', transferAmount);
    // }
  }

  void onChangeAutoTransferSwitch(bool isAutoTransferOpen) {
    Store.getURLable = isAutoTransferOpen;
  }

  void toggleAutoTransferSwitch(BuildContext context) async {
    if (authService.authState is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      final confirm = await OBDialogUtil.show<bool>(
          ObDialog.alert(
            background: const Color(0xff171E24),
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
            onCancelListener: () {
              Navigator.of(context).pop();
            },
          ),
          context: context);
      if (confirm == true) {
        runCatch(() async {
          final cancel = showLoading();
          authService.syncUserAutoUpdateSetting(!user.isAutoTransferOpen);
          await capitalApi.noTransfer(SetTransferInfoParam(
            noTransfer: user.isAutoTransferOpen ? 0 : 1,
          ));
          cancel();
          showToast(user.isAutoTransferOpen
              ? 'my_wallet_automatic_carry_in_amount_is_turned_off'.tr
              : 'my_wallet_automatic_transfer_amount_is_turned_on'.tr);
        });
      }
    }
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
}

import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/component/flow_details_dialog.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

class MyWalletController extends GetxController {
  final AuthService authService;
  final MyWalletRepository repository;

  MyWalletController(this.authService, this.repository);

  bool get isTryPlay => authService.isTryPlay;

  RxString showWithdraw = "0".obs;
  RxString showDeposit = "0".obs;

  @override
  void onReady() {
    super.onReady();
    BalanceManager.syncAll();
    Map para = Get.parameters;
    showDeposit.value = para['showDeposit'];
    showWithdraw.value = para['showWithdraw'];
  }

  @override
  void onClose() {
    super.onClose();
    BalanceManager.syncAll();
  }

  void navigateTransfer({String transferInId = '', String transferOutId = ''}) {
    Get.toNamed(AppRoutes.TRANSFER, parameters: {
      'transferInId': transferInId,
      'transferOutId': transferOutId,
    });
  }

  void showMerchantDepositFlow(String gameCode) {
    runCatch(() async {
      final cancel = showLoading();
      final res = await repository.getFlowDetail(gameCode);
      cancel();
      OBDialogUtil.show(
        FlowDetailsDialog(
          activityName: res.activityName,
          billAmount: res.billAmount.toDouble(),
          completeBillAmount: res.completeBillAmount.toDouble(),
          percentage: res.lowActivityAmount.toDouble(),
        ),
      );
    });
  }
}

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_finance/src/modules/finance/account/repository/account_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

class AccountController extends GetxController {
  final AccountRepository repository;
  final AuthService authService;
  var bankCards = <UserBankCard>[].obs;
  var usdts = <UserBankCard>[].obs;

  AccountController(this.repository, this.authService);

  @override
  void onReady() {
    super.onReady();
    runCatch(() async {
      bankCards.value = (await repository.getAccounts('1'));
      usdts.value = (await repository.getAccounts('2'));
    });
  }

  void refreshBankAccount() {
    runCatch(() async {
      bankCards.value = (await repository.getAccounts('1'));
      update();
    });
  }

  void refreshUsdtAccount() {
    runCatch(() async {
      usdts.value = (await repository.getAccounts('2'));
      update();
    });
  }

  void navigateAddBankAccount(String route, String type) {
    // if (authService.isTryPlay) {
    //   OBDialogUtil.show(
    //     ObaseDialog.alert(
    //       title: 'alert'.tr,
    //       content: 'account_trial_account_does_not_support_binding'.tr+'$type',
    //       cancelText: 'user_profile_understood'.tr,
    //       onCancelListener: () {
    //         Get.back();
    //       },
    //     ),
    //   );
    //   return;
    // }
    authService.syncUser();
    // if ((authService.authState as LoggedIn).uiUser.phone!.isEmpty) {
    //   OBDialogUtil.show(
    //     ObaseDialog.alert(
    //       title: 'alert'.tr,
    //       content: 'account_currently_have_phone_number_bound'.tr,
    //       confirmText: 'continue'.tr,
    //       onConfirmListener: () {
    //         Get.back();
    //         Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
    //       },
    //     ),
    //   );
    //   return;
    // }
    Get.toNamed(route);
  }
}

class UiBankCard {
  final String iconUrl;
  final String bankName;
  final String bankNumber;
  final String cardType;
  final String cardId;

  UiBankCard(
      this.iconUrl, this.bankName, this.bankNumber, this.cardType, this.cardId);
}

class UiUsdt {
  final String protocol;
  final String token;
  final String usdtId;

  UiUsdt(this.protocol, this.token, this.usdtId);
}

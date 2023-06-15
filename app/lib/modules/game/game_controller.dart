
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

class GameController extends GetxController
    with GetSingleTickerProviderStateMixin {
  final myWalletRepository = MyWalletRepository();
  late String gameCode;
  late String gameId;
  late String url;
  late RxString title = ''.obs;
  bool testify = Get.arguments["testify"] ?? false;
  final authService = Get.find<AuthService>();

  @override
  void onInit() {
    super.onInit();
    runCatch(() async {
      url = Get.arguments["url"];
      title = Get.arguments["title"];

      eventBus.fire(FloatBonusEvent(show: false));
    }, onError: (_) {});
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    eventBus.fire(FloatBonusEvent(show: true));
    super.onClose();
  }
}

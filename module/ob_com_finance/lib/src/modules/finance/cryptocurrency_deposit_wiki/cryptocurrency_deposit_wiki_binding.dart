import 'package:get/get.dart';

import 'cryptocurrency_deposit_wiki_controller.dart';

class CryptoCurrencyDepositWikiBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CryptoCurrencyDepositWikiController());
  }
}

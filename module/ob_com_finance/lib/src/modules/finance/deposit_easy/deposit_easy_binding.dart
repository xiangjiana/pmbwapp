import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/repository/deposit_easy_repository.dart';

import 'deposit_easy_controller.dart';


class DepositEasyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DepositEasyRepository());
    Get.lazyPut(() => DepositEasyController(Get.find(), Get.find()));
  }
}

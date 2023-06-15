import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_package/modules/vip/vip_level/repository/vip_level_repository.dart';

class VipLevelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VipLevelRepository());
    Get.lazyPut(() => VipLevelController(Get.find(), Get.find()));
  }
}

import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_level_detail_controller.dart';

class VipLevelDetailBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VipLevelController(Get.find(), Get.find()));
    Get.lazyPut(() => VipLevelDetailController());
  }
}
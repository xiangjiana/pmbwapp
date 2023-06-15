import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

///IP限制提示页面
class LimitIpController extends GetxController {
  RxString ip = '0.0.0.0'.obs;
  RxString region = '-'.obs;

  @override
  void onInit() {
    super.onInit();
    Store.isIpLimited = true;
    if (Get.arguments != null) {
      ip.value = Get.arguments["ip"];
      region.value = Get.arguments["region"];
    }
    eventBus.fire(FloatBonusEvent(show: false));
  }
}

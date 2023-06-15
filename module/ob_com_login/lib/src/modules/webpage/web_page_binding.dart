import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/webpage/web_page_controller.dart';

class WebPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebPageController());
  }
}

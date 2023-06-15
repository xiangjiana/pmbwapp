import 'package:get/get.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page_controller.dart';

class WebIframePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => WebIframePageController());
  }
}

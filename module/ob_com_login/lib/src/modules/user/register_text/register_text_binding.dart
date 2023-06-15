import 'package:get/get.dart';

import 'register_text_controller.dart';

class RegisteTextBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterTextController>(() => RegisterTextController());
  }
}

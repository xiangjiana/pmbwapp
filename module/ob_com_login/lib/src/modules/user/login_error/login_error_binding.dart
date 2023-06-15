import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/login_error/login_error_controller.dart';

class LoginErrorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginErrorController>(() => LoginErrorController());
  }
}

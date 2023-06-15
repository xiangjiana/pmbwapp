import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_password_controller.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_phone_controller.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_email_controller.dart';

class FindPasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FindPasswordController>(() => FindPasswordController(),fenix: true);
    Get.lazyPut<FindPhoneController>(() => FindPhoneController(),fenix: true);
    Get.lazyPut<FindEmailController>(() => FindEmailController(),fenix: true);
  }
}

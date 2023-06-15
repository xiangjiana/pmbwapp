import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/login/login_controller.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_repository.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(), fenix: true);
    Get.lazyPut(() => LoginRepository(), fenix: true);
  }
}

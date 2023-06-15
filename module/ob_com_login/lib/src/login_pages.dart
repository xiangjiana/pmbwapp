import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/help_widget/help_empty_controller.dart';
import 'package:ob_com_login/src/modules/help_widget/help_empty_page.dart';
import 'package:ob_com_login/src/modules/settings/error/limit_ip_controller.dart';
import 'package:ob_com_login/src/modules/settings/error/limit_ip_page.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/bind_phone_number_controller.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/bind_phone_number_page.dart';
import 'package:ob_com_login/src/modules/user/bind_phone_number/repository/bind_phone_number_repository.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_password_binding.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_password_page.dart';
import 'package:ob_com_login/src/modules/user/login/gesture_login_page.dart';
import 'package:ob_com_login/src/modules/user/login/login_binding.dart';
import 'package:ob_com_login/src/modules/user/login/login_page.dart';
import 'package:ob_com_login/src/modules/user/login_error/login_error_binding.dart';
import 'package:ob_com_login/src/modules/user/login_error/login_error_page.dart';
import 'package:ob_com_login/src/modules/user/register_text/register_text_binding.dart';
import 'package:ob_com_login/src/modules/user/register_text/register_text_page.dart';
import 'package:ob_com_login/src/modules/user/reset_password/repository/reset_repository.dart';
import 'package:ob_com_login/src/modules/user/reset_password/reset_password_controller.dart';
import 'package:ob_com_login/src/modules/user/reset_password/reset_password_page.dart';
import 'package:ob_com_login/src/modules/user/setup_gesture_password/confirm_gestrue_password_page.dart';
import 'package:ob_com_login/src/modules/user/setup_gesture_password/setup_gestrue_password_page.dart';
import 'package:ob_com_login/src/modules/user/third_party/third_bind_controller.dart';
import 'package:ob_com_login/src/modules/user/third_party/third_bind_register.dart';
import 'package:ob_com_login/src/modules/user/update_password/repository/update_password_repository.dart';
import 'package:ob_com_login/src/modules/user/update_password/update_password_controller.dart';
import 'package:ob_com_login/src/modules/user/update_password/update_password_page.dart';
import 'package:ob_com_login/src/modules/user/user_add/user_add_controller.dart';
import 'package:ob_com_login/src/modules/user/user_add/user_add_page.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/repository/toggle_user_repository.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/user_toggle_controller.dart';
import 'package:ob_com_login/src/modules/user/user_toggle/user_toggle_page.dart';
import 'package:ob_com_login/src/modules/webpage/web_page.dart';
import 'package:ob_com_login/src/modules/webpage/web_page_binding.dart';
import 'package:ob_com_base/ob_com_base.dart';

abstract class LoginPages {
  static final pages = [
    GetPage(
      name: AppRoutes.LOGIN,
      page: () => const LoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.GESTURE_LOGIN,
      transition: Transition.fade,
      page: () => GestureLoginPage(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.LOGIN_ERROE,
      page: () => LoginErrorPage(),
      binding: LoginErrorBinding(),
    ),
    GetPage(
      name: AppRoutes.FIND_PASSWORD,
      page: () => FindPasswordPage(),
      binding: FindPasswordBinding(),
    ),
    GetPage(
      name: AppRoutes.USER_ADD,
      page: () => const UserAddPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => UserAddController(Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.USER_TOGGLE,
      page: () => UserTogglePage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => UserToggleRepository()),
          Get.lazyPut(() => UserToggleController(Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.UPDATE_PASSWORD,
      page: () => const UpdatePasswordPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => UpdatePasswordRepository()),
          Get.lazyPut(() => UpdatePasswordController(Get.find(), Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.THIRD_PARTY,
      page: () => const ThirdPartyRegister(),
      binding: BindingsBuilder(
            () => {
          Get.lazyPut(() => ThirdBindController()),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.SETUP_GESTURE_PASSWORD,
      page: () => SetupGesturePasswordPage(),
    ),
    GetPage(
      name: AppRoutes.CONFIRM_GESTURE_PASSWORD,
      page: () => ConfirmGesturePasswordPage(),
    ),
    GetPage(
      name: AppRoutes.REGISTER_TEXT,
      page: () => const RegisterTextPage(),
      binding: RegisteTextBinding(),
    ),
    GetPage(
      name: AppRoutes.WEB,
      page: () => const WebPage(),
      binding: WebPageBinding(),
    ),
    GetPage(
      name: AppRoutes.RESET_PASSWORD,
      page: () => const ResetPasswordPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => ResetPasswordController()),
          Get.lazyPut(() => ResetRepository()),
        },
      ),
    ),
    GetPage(name: AppRoutes.WEB, page: () => const WebPage(), binding: WebPageBinding()),
    GetPage(
      name: AppRoutes.BIND_PHONE_NUMBER,
      page: () => const BindPhoneNumberPage(),
      middlewares: [AuthMiddleware()],
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => BindPhoneNumberRepository()),
          Get.lazyPut(() => BindPhoneNumberController(Get.find(), Get.find())),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.limitIpPage,
      page: () => const LimitIpPage(),
      binding: BindingsBuilder(
        () => {
          Get.lazyPut(() => LimitIpController()),
        },
      ),
    ),
    GetPage(
      name: AppRoutes.HELP_EMPTY,
      page: () => HelpEmptyPage(),
      binding: BindingsBuilder(() => {
        Get.lazyPut(() => HelpEmptyController()),
      }),
    ),
  ];
}

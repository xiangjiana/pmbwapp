import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  Future<GetNavConfig> redirectDelegate(GetNavConfig route) async {
    final authService = Get.find<AuthService>();
    if (!authService.isLogin) {
      return route.copyWith(location: AppRoutes.LOGIN, state: null);
    }
    return route;
  }
  
  @override
  RouteSettings? redirect(String? route) {
    final authService = Get.find<AuthService>();
    if (!authService.isLogin&&route!=AppRoutes.LOGIN) {
      return const RouteSettings(name: AppRoutes.LOGIN);
    }
    return null;
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:sp_util/sp_util.dart';

class HomeRouteInitializer extends AppInitializer {
  static String initialRoute = AppRoutes.HOME;

  @override
  FutureOr<void> init() async {
    try {
      if (GetPlatform.isWeb) {
        initialRoute = AppRoutes.HOME;
        return;
      }
      String splashFilePath = SpUtil.getString('ob_splash_file_path') ?? '';
      if (splashFilePath.isNotEmpty) {
        initialRoute = AppRoutes.SPLASH;
        return;
      }
      String newVersion = await GetVersion.projectVersion;
      String version = SpUtil.getString('version') ?? '';
      if (version.isNullOrEmpty) {
        SpUtil.putString('version', newVersion);
        initialRoute = AppRoutes.ONBOARDING;
        return;
      }
      if (version != newVersion) {
        SpUtil.putString('version', newVersion);
        initialRoute = AppRoutes.ONBOARDING;
        return;
      }
      return;
    } catch (e) {
      return;
    }
  }
}

import 'dart:async';

import 'package:get/get.dart';
import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_com_base/ob_com_base.dart';


class GetxInitializer extends AppInitializer {
  @override
  FutureOr<void> init() {
    Get.put(AuthService());
  }
}

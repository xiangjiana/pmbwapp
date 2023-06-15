import 'dart:async';

import 'package:ob_package/initializer/app_initializer.dart';
import 'package:ob_com_base/ob_com_base.dart';

class ToolsInitializer extends AppInitializer {
  @override
  FutureOr<void> init() async {
    await Tools.initAes();
  }
}

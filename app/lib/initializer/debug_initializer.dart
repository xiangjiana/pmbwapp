import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:ob_package/initializer/app_initializer.dart';

class DebugInitializer extends AppInitializer {
  @override
  FutureOr<void> init() {
    FlutterError.onError = (FlutterErrorDetails details) async {
      FlutterError.dumpErrorToConsole(details);
    };
  }
}

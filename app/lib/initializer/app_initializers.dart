import 'package:ob_package/initializer/app_initializer.dart';

class AppInitializers {
  final Set<AppInitializer> initializers;

  AppInitializers(this.initializers);

  Future<void> init() async {
    for (final initializer in initializers) {
      final result = initializer.init();
      if (result is Future) await result;
    }
  }
}

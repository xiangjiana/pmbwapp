import 'package:get/get.dart';
import 'package:ob_package/modules/game/game_controller.dart';

class GameBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<GameController>(() => GameController());
  }
}

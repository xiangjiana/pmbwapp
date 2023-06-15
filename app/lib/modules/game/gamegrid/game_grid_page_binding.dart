import 'package:get/get.dart';

import 'game_grid_page_controller.dart';

class GameGridBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => GameGridPageController());
  }
}

import 'package:get/get.dart';

import 'logic.dart';

class MyCollectionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyCollectionLogic());
  }
}

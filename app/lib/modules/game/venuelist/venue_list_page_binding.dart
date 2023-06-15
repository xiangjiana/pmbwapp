import 'package:get/get.dart';

import 'venue_list_page_controller.dart';

class VenueListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VenueListPageController());
  }
}

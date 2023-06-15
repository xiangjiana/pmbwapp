import 'package:get/get.dart';
import 'package:ob_package/modules/records/my_feedback/my_feedback_controller.dart';

class MyFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyFeedbackController());
  }
}

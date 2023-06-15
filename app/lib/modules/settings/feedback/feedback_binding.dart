
import 'package:get/get.dart';
import 'package:ob_package/modules/settings/feedback/feedback_controller.dart';

class FeedbackBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => FeedbackController());
  }

}
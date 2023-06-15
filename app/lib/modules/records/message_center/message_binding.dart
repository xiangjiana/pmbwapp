import 'package:get/get.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';

class MessageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MessageCenterMsgRepository());
    Get.lazyPut(() => MemberMessageController(Get.find()));
  }
}

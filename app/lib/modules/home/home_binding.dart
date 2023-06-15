import 'package:get/get.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_package/modules/home_modules/home_marquee/marquee_controller.dart';
import 'package:ob_package/modules/home_modules/home_user/user_controller.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/repository/transfer_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/transfer_controller.dart';

import '../home_modules/home_main/main_controller.dart';
import 'components/mine_widget_new/mine_new_controller.dart';

class HomePageBinding extends Bindings {
  // Permanent 和 fenix 之间的根本区别在于存储实例的方式，默认情况下，GetX 在实例不使用时删除它们。
  // 这意味着: 如果屏幕1有控制器1，屏幕2有控制器2，并且您从堆栈中删除了第一个路由(如果您使用 Get.off ()或 Get.offNamed ()) ，
  // 则控制器1将失去其使用，因此它将被删除。

  // 选择使用 permanent: true，那么控制器在这个转换中不会丢失——这对于希望在整个应用程序中保持控制器是活动的非常有用。

  // fenix：true，你不用担心在屏幕更改之间丢失它将处理未使用的控制器，但是当您需要它时，
  // 它将“从内存中重新创建”一个新实例，不需要时，会被get回收，也就可能会频繁的重新创建实例

  @override
  void dependencies() {
    /// Controller

 //   Get.lazyReplace(() => MainController(Get.find()),fenix: true);
    Get.lazyReplace(() => HomePageController(),fenix: true);
    Get.lazyReplace(() => UserController(), fenix: true); //资金详情+vip
    Get.lazyReplace(() => FloatController(), fenix: true); //浮动红利
    Get.lazyReplace(() => MessageCenterMsgRepository());
    Get.lazyReplace(() => MemberMessageController(Get.find()), fenix: true);
    Get.lazyReplace(() => MarqueeController(), fenix: true);
    Get.lazyReplace(() => MineNewController(Get.find()),);
    Get.lazyReplace(() => TransferRepository(), fenix: true);
    Get.lazyReplace(() => TransferController(Get.find(), Get.find()), fenix: true);

    /// Repository
    Get.lazyReplace(() => HomeRepository(), fenix: true);
    Future.delayed(Duration(seconds: 1),(){
      final homeController = Get.find<HomePageController>();
    });
  }
}

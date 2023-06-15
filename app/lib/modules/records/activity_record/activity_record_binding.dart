
import 'package:get/get.dart';
import 'package:ob_package/modules/records/activity_record/bonus_record_controller.dart';
import 'package:ob_package/modules/records/activity_record/invite_record_controller.dart';
import 'package:ob_package/modules/records/activity_record/repository/invite_record_repository.dart';

import 'activity_record_controler.dart';

class ActivityRecordBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => InviteRecordRepository());
    Get.lazyPut(() => ActivityRecordControler());
    Get.lazyPut(() => BonusRecordController());
    Get.lazyPut(() => InviteRecordController());
  }

}
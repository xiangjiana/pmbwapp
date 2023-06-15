import 'dart:async';

import 'package:activity/activity.dart';
import 'package:get/get.dart';

class DiscountDetailRepository {
  final activityApi = Get.find<ActivityApi>();

  ///活动分享地址
  Future<String> getActivitySharingDomainLink() async {
    try {
      return activityApi.getActivitySharingDomainLink();
    } catch (e) {
      return Future.error(e);
    }
  }
}

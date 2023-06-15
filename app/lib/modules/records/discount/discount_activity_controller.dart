import 'dart:async';

import 'package:activity/activity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:repository/utils/device_type.dart';

import 'components/discount_list.dart';

bool isFirstMount = true;

class DiscountActivityController extends GetxController
    with SingleGetTickerProviderMixin {
  final activityApi = Get.find<ActivityApi>();
  var tabBarTitle = <String>[].obs;
  var tabBarViews = <Widget>[].obs;
  final PageController pageController = PageController();

  RxInt currentIndex = 0.obs;
  var discountDiscountActivityPostFuture;
  List<ActivityConfigTab> activityTags = [];

  bool get enabledSkeleton => isFirstMount == true;

  @override
  void onInit() {
    isFirstMount = true;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    getAllData();
  }

  resetData(){
    currentIndex.value = 0;
    getAllData();
  }

  Future<void> getAllData() async {
    try {
      activityTags = await activityApi.tag();
      discountDiscountActivityPostFuture = activityApi.discountActivity(DiscountActivityParam(deviceType:InstallDeviceType.deviceType!));
      final allActivities = await discountDiscountActivityPostFuture;
      tabBarTitle.clear();
      tabBarViews.clear();
      tabBarTitle.add('discount_all_events'.tr);
      tabBarViews.add(DiscountList(
        allActivities,
      ));
      for (int i = 0; i < activityTags.length; i++) {
        DiscountActivityParam discountActivityParam=DiscountActivityParam(deviceType:InstallDeviceType.deviceType!,discountTagId:activityTags[i].id);
        final activity = await activityApi.discountActivity(discountActivityParam);
        tabBarTitle.add(activityTags[i].activityName);
        tabBarViews.add(DiscountList(activity));
      }
      update();
    } catch (e) {
      showToast(e.toString());
    }
  }

  Future<void> onRefresh(RefreshController refreshController) async {
    try {
      if (currentIndex.value == 0) {
        final allActivities = await activityApi.discountActivity(
          DiscountActivityParam(deviceType:InstallDeviceType.deviceType!)
        );
        tabBarViews[0] = DiscountList(
          allActivities,
          key: UniqueKey(),
        );
      } else {
        final activity = await activityApi.discountActivity(
          DiscountActivityParam(deviceType:InstallDeviceType.deviceType!,discountTagId:activityTags[currentIndex.value - 1].id)
        );
        tabBarViews[currentIndex.value] = DiscountList(
          activity,
          key: UniqueKey(),
        );
      }
      refreshController.refreshCompleted();
      Store.isActivityManualRefresh = true;
      update();
      await Future.delayed(const Duration(milliseconds: 2000));
      Store.isActivityManualRefresh = false;
      update();
    } catch (e) {
      showToast(e.toString());
    }
  }

  void onLoading(RefreshController refreshController) {
    refreshController.loadNoData();
  }

  void onTabBarTap(index) {
    Store.isActivityManualRefresh = false;
    if (index != currentIndex.value) {
      currentIndex.value = index;
      pageController.jumpToPage(index);
    }
  }

  void onPageChange(index) {
    currentIndex.value = index;
  }

  @override
  void onClose() {
    isFirstMount = false;
    pageController.dispose();
    super.onClose();
  }
}

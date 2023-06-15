import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/records/discount/components/discount_activity.dart';
import 'package:ob_package/modules/records/discount/repository/discount.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

class PromotionController extends GetxController
    with SingleGetTickerProviderMixin {
  final repository = Get.find<HomeRepository>();
  late TabController tabController;
  RxList<Widget> tabBarTitle = <Widget>[].obs;
  RxList<Widget> tabBarViews = <Widget>[].obs;
  RxList<Discount> dataSource = <Discount>[].obs;
  // List<ActivityType> activityTypeList = [];
  String tabTitle = "discount".tr;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(
      length: tabBarTitle.length,
      vsync: this,
    );
    getActivityData();
  }

  Future<void> getActivityData() async {
    List<Widget> tabs = [];
    List<Widget> views = [];
    try {
      /*List<ActivityType> types = Store.activityTypes.cast<ActivityType>();
      if (types.isEmpty) {
        types = await repository.getActivityType();
      }*/
      /*types = types.take(3).toList();
      types.sort((a, b) => (a.activitySort!).compareTo(b.activitySort!));
      types.forEach((element) {*/
        tabs.add(Tab(
          key: ValueKey(/*element.activityName!*/tabTitle),
          child: Text(/*element.activityName!*/tabTitle),
        ));
        views.add(DiscountActivity());
        /*switch (element.activityType) {
          // case 0:
          //   tabs.add(Tab(
          //     key: ValueKey(element.activityName!),
          //     child: Text(element.activityName!),
          //   ));
          //   views.add(DiscountActivity());
          //   break;
          // case 1:
          //   tabs.add(Text(element.activityName!));
          //   views.add(DiscountList(repository.getVipDiscount));
          //   break;
          // case 2:
          //   tabs.add(Tab(
          //     key: ValueKey(element.activityName!),
          //     child: Text(element.activityName!),
          //   ));
          //   views.add(SponsorDiscount());
          //   break;
        }
      });*/
      /*activityTypeList = types;
      activityTypeList.removeWhere((element) =>
          (element.activityType == 1 || element.activityType == 2));*/
      tabBarTitle.value = tabs;
      tabBarViews.value = views;
      tabController = TabController(
        length: tabBarTitle.length,
        vsync: this,
      );
    } catch (_) {
      List<String> types = ["discount".tr];
      types.forEach((element) {
        tabs.add(Tab(
          key: ValueKey(element),
          child: Text(element),
        ));
        views.add(const EmptyView());
      });
      tabBarTitle.value = tabs;
      tabBarViews.value = views;
      tabController = TabController(
        length: tabBarTitle.length,
        vsync: this,
      );
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

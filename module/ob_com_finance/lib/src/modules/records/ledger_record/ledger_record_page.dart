import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/component/tab_view_item.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/component/tab_view_item_custom.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'ledger_record_controller.dart';

class LedgerRecordPage extends GetView<LedgerRecordController> {
  final todayRecordController = Get.find<TodayRecordController>();
  final yesterdayRecordController = Get.find<YesterdayRecordController>();
  final recentWeekRecordController = Get.find<RecentWeekRecordController>();
  final recentMonthRecordController = Get.find<RecentMonthRecordController>();
  final customRecordController = Get.find<CustomRecordController>();

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('ledger_detail_quota_record'.tr),
          leading: ObBackButton(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(44.w),
            child: Row(
              children: [
                SizedBox(width: 8.w),
                Expanded(
                  child: ObTheme(
                    tabFixedSizedIndicator: TabFixedSizedIndicator(
                      Size(24.w, 3.w),
                      ColorName.colorMain1,
                    ),
                    child: ObTabBar(
                      isScrollable: true,
                      indicatorSize: TabBarIndicatorSize.label,
                      labelColor: ColorName.colorMain1,
                      onTap: (index) => controller.selectPeriod(index),
                      controller: controller.tabController,
                      labelPadding: EdgeInsets.symmetric(
                        horizontal: 8.w,
                        vertical: 8.w,
                      ),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      unselectedLabelStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      tabs: [
                        Text('bet_time_choose_today'.tr),
                        Text('bet_time_choose_yesterday'.tr),
                        Text('bet_time_choose_week'.tr),
                        Text('bet_time_choose_month'.tr),
                        Obx(
                          () => Text(
                            controller.customTimeTabText,
                            style: TextStyle(
                              fontSize: controller.customTimeTabText ==
                                      'periods_custom'.tr
                                  ? 14
                                  : 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.showFilters(),
                  child: Container(
                    height: 44.w,
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 16.w),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'bet_history_filter'.tr,
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Obx(() {
                          return RotatedBox(
                            quarterTurns: controller.isFilterOpen ? 2 : 0,
                            child: pkObImage(
                              Assets.images.icon.homeMoreDown.path,
                              width: 16.w,
                            ),
                          );
                        }),
                        SizedBox(width: 8.w),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        body: Column(
          children: [
            Divider(
              key: controller.filterAnchorKey,
              height: 8.w,
              thickness: 8.w,
              color: Color(0xff0E1519),
            ),
            Expanded(
              child: TabBarView(
                controller: controller.tabController,
                physics: const ClampingScrollPhysics(),
                children: [
                  TabViewItem(controller: todayRecordController),
                  TabViewItem(controller: yesterdayRecordController),
                  TabViewItem(controller: recentWeekRecordController),
                  TabViewItem(controller: recentMonthRecordController),
                  TabViewItemCustom(
                    parentController: controller,
                    controller: customRecordController,
                    warnTips: 'bet_quota_records_of_the_last30_days'.tr,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

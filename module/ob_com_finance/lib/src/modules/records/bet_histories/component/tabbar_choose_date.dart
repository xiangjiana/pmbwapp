import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';

import 'package:ob_com_finance/src/modules/records/access_record/access_record_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_base/ob_com_base.dart';

import '../bet_settled_controller.dart';

class TabBarChooseDate extends StatelessWidget {
  TabBarChooseDate({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final BetSettledController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 47.w,
      padding: EdgeInsets.only(left: 8.w),
      alignment: Alignment.centerLeft,
      child: ObTheme(
        tabFixedSizedIndicator: TabFixedSizedIndicator(Size(24.w,3.w), ColorName.colorMain),
        child: ObTabBar(
          isScrollable: true,
          indicatorSize: TabBarIndicatorSize.label,
          labelColor: ColorName.colorMain,
          controller: controller.tabController,
          onTap: (index) => controller.onSelectPeriod(index),
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
                controller.customTimeTabText.value,
                style: TextStyle(
                  fontSize: controller.customTimeTabText.value ==
                          'bet_time_choose_customize'.tr
                      ? 14
                      : 10,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TabBarChooseDate2 extends StatelessWidget {
  const TabBarChooseDate2({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final AccessRecordDateTabController controller;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(44.w),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Expanded(
            child: ObTheme(
              tabFixedSizedIndicator: TabFixedSizedIndicator(Size(24.w,3.w), ColorName.colorMain1),
              child: ObTabBar(
                isScrollable: true,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: ColorName.colorMain1,
                controller: controller.tabController,
                onTap: (index) {
                  controller.onSelectPeriod(index);
                },
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
                indicatorPadding: EdgeInsets.only(bottom: 0.w),
                tabs: [
                  Text('access_record_today'.tr),
                  Text('access_record_yesterday'.tr),
                  Text('access_record_last_7_days'.tr),
                  Text('access_record_last_30_days'.tr),
                  Obx(
                    () => Text(
                      controller.customTimeTabText.value,
                      style: TextStyle(
                        fontSize: controller.customTimeTabText.value ==
                                'access_record_customize'.tr
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
            onTap: controller.showFilters,
            child: Container(
              height: 44.w,
              padding: EdgeInsets.only(left: 16.w),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'access_record_filter'.tr,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
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
    );
  }
}

import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_detail_list_tab_view_item.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_detail_list_tab_view_item_custom.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'bet_detail_list_controller.dart';

final textColor = const Color(0xFFFFFFFF).withOpacity(0.6);

class BetDetailListPage extends GetView<BetDetailListController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: Column(
          children: [
            Divider(
              key: controller.filterAnchorKey,
              height: 8.w,
              thickness: 8.w,
              color: const Color(0xff0E1519),
            ),
            if (controller.obBetStatus == '0')
              const Expanded(child: BetDetailListTabViewItem(index: 0))
            else
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  physics: const NeverScrollableScrollPhysics(),
                  children: const [
                    BetDetailListTabViewItem(index: 0),
                    BetDetailListTabViewItem(index: 1),
                    BetDetailListTabViewItem(index: 2),
                    BetDetailListTabViewItem(index: 3),
                    BetDetailListTabViewItemCustom(index: 4),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    if (controller.obBetStatus == '0') {
      return AppBar(
        title: ObNavigationBarTitle('${controller.gameName}'),
        actions:const [
          //_buildFilter(context),
        ],
        leading: ObBackButton(),
      );
    }
    return AppBar(
      title: ObNavigationBarTitle('${controller.gameName}'),
      leading: ObBackButton(),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(44.w),
        child: Row(
          children: [
            SizedBox(width: 8.w),
            Expanded(
              child: ObTheme(
                tabFixedSizedIndicator: TabFixedSizedIndicator(Size(24.w,3.w), ColorName.colorMain),
                child: ObTabBar(
                  isScrollable: true,
                  labelColor: ColorName.colorMain,
                  controller: controller.tabController,
                  onTap: (index) => controller.onSelectPeriod(index),
                  physics: const NeverScrollableScrollPhysics(),
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
                    Text('access_record_today'.tr),
                    Text('bet_time_choose_yesterday'.tr),
                    Text('access_record_last_7_days'.tr),
                    Text('bet_time_choose_month'.tr),
                    Obx(
                      () => Text(
                        controller.customTimeTabText.value,
                        style: TextStyle(
                          fontSize: controller.customTimeTabText.value == 'periods_custom'.tr
                              ? 14
                              : 10,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // _buildFilter(context)
          ],
        ),
      ),
    );
  }

  GestureDetector _buildFilter(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        controller.showFilters(context);
      },
      child: Container(
        height: 44.w,
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          children: [
            Container(
              alignment: Alignment.centerRight,
              child: Text(
                'bet_history_filter'.tr,
                style: const TextStyle(
                  fontSize: 12,
                  color: Color(0xFFFFFFFF),
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Container(width: 4.w),
            Obx(() {
              return RotatedBox(
                quarterTurns: controller.isFilterOpen ? 2 : 0,
                child: pkObImage(
                  Assets.images.icon.homeMoreDown.path,
                  width: 16.w,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

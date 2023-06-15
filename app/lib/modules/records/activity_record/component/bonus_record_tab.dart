import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../bonus_record_controller.dart';
import 'activity_empty.dart';
import 'bonus_tile.dart';

class BonusRecordTab extends GetView<BonusRecordController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => SmartRefresher(
            enablePullUp: true,
            controller: controller.smartRefreshCtrl,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: SingleChildScrollView(
              child: controller.data == null
                  ? controller.systemLoadingFail.value
                      ? ActivityEmpty()
                      : SizedBox()
                  : controller.data!.record.isNotEmpty
                      ? _buildList(controller)
                      : ActivityEmpty(),
            ),
          ),
        ),
        Obx(
          () => Offstage(
            offstage: !controller.systemLoadingShow.value,
            child: Container(
              color: ColorName.white.withOpacity(0.0),
              width: 1.sw,
              height: 1.sh,
              child: PlaceholderLoading(
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildList(BonusRecordController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          Container(
            height: 74.w,
            child: Row(
              children: [
                _headCount("bonus_title_tab_item_1".tr,
                    '${numberFormat(controller.todayRebateAmount.value)}'),
                Container(
                  height: 16.w,
                  width: 2.w,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.10),
                    borderRadius: BorderRadius.circular(0.5.w),
                  ),
                ),
                _headCount("bonus_title_tab_item_4".tr,
                    '${numberFormat(controller.totalRebateAmount.value)}'),
              ],
            ),
          ),
          ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: controller.data!.record.length,
            itemBuilder: (ctx, index) {
              return BonusTile(uiRecord: controller.data!.record[index]);
            },
            separatorBuilder: (BuildContext context, index) {
              return SizedBox(height: 16.w);
            },
          )
        ],
      ),
    );
  }

  Widget _headCount(String title, String count) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(
              color: ColorName.colorTextWhite60,
              fontSize: 14,
            ),
          ),
          SizedBox(height: 4.w),
          Text(
            '$count',
            style: TextStyle(
              color: ColorName.white,
              fontFamily: FontFamily.gothamMedium,
              package: BaseX.pkg2,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_list_tile.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/custom_date_picker.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/empty_un_settled_list.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:intl/intl.dart';


final textColor = const Color(0xFFFFFFFF).withOpacity(0.6);

class BetSettledTabViewItemCustom extends StatefulWidget {
  final int index;
  final TabBetSettledController controller;

  const BetSettledTabViewItemCustom({Key? key, required this.index,required this.controller})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _BetSettledTabViewItemCustomState();
}

class _BetSettledTabViewItemCustomState
    extends State<BetSettledTabViewItemCustom> with BackTopMixin {
  final RefreshController refreshController = RefreshController();

  TabBetSettledController get controller =>widget.controller;

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    TimeRange   timeRange =   TimeRange(
      DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(Duration(days: 7))),
      DateFormat('yyyy-MM-dd').format(DateTime.now()),
    );
    return Obx(
      () => SmartRefresher(
        controller: refreshController,
        scrollController: scrollController,
        onRefresh: () {
          try {
            controller.onRefresh();
            refreshController.refreshCompleted();
          } catch (_) {
            refreshController.refreshFailed();
          }
        },
        enablePullUp: true,
        onLoading: () {
          refreshController.loadNoData();
        },
        child: Stack(
          alignment: AlignmentDirectional.topCenter,
          children: [
            SingleChildScrollView(
              child: Column(
                children: [
                  _buildSubtotal(context),
                  if (controller.metas == null)
                    PlaceholderLoading()
                  else if (controller.metas!.isEmpty)
                    EmptyUnSettledList()
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: GetPlatform.isAndroid
                          ? ClampingScrollPhysics()
                          : BouncingScrollPhysics(),
                      padding: EdgeInsets.zero,
                      itemCount: controller.metas!.length,
                      itemBuilder: (ctx, index) {
                        return BetListTile(controller.metas![index], true);
                      },
                    ),
                ],
              ),
            ),
            if (controller.betSettledController.isShowDatePicker.value)
              CustomDatePicker(
                startTime:controller.betSettledController.lastStartTime,
                endTime: controller.betSettledController.lastEndTime,
                warnTips: 'bet_histories_records_of_the_last30_days'.tr,
                onConfirm: (TimeRange range) {
                  controller.betSettledController.onDatePickerConfirm(range);
                },
                range: timeRange,
                onCancel: () {
                  controller.betSettledController.onDatePickerCancel();
                },
              )
          ],
        ),
      ),
    );
  }

  Widget _buildSubtotal(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: Color(0xFF1D2933),
        height: 42.w,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text.rich(TextSpan(
                text: 'bet_notes_amount_label'.tr,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                      text:
                          '${AppCurrencyUtils.dealBalance(controller.summary.value.betAmountTotal.toString())}',
                      style: TextStyle(
                          color: textColor,
                          fontFamily: FontFamily.dINMedium,
                          package: BaseX.pkg2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14)),
                  TextSpan(
                      text: 'bet_notes_win_or_lose_label'.tr,
                      style: TextStyle(
                        color: textColor,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      )),
                  TextSpan(
                      text: _getNetAmountTotal(),
                      style: TextStyle(
                          color: textColor,
                          fontFamily: FontFamily.dINMedium,
                          package: BaseX.pkg2,
                          fontWeight: FontWeight.w500,
                          fontSize: 14))
                ])),
            Row(
              children: [
                Container(
                  width: 1.w,
                  height: 16.w,
                  color: Colors.white24,
                  margin: EdgeInsets.only(right: 8.w),
                ),
                Text.rich(
                  TextSpan(
                    text: 'bet_histories_total'.tr,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                          text: '${controller.summary.value.countTotal}'
                              .split('.')
                              .first,
                          style: TextStyle(
                              color: textColor,
                              fontWeight: FontWeight.w500,
                              fontFamily: FontFamily.dINMedium,
                              package: BaseX.pkg2,
                              fontSize: 14)),
                      if((Get.locale?.languageCode??"")!="en"&&(Get.locale?.languageCode??"")!="vi")
                      TextSpan(
                        text: 'bet_histories_single'.tr,
                        style: TextStyle(
                          color: textColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  String _getNetAmountTotal() {
    if (controller.summary.value.netAmountTotal > 0) {
      return '+${AppCurrencyUtils.dealBalance(controller.summary.value.netAmountTotal.toString())}';
    }
    if (controller.summary.value.netAmountTotal < 0) {
      return '${AppCurrencyUtils.dealBalance(controller.summary.value.netAmountTotal.toString())}';
    }
    return '${AppCurrencyUtils.dealBalance(controller.summary.value.netAmountTotal.toString())}';
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';

import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_list_tile.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/empty_un_settled_list.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

const textColor = ColorName.colorTextWhite60;

class BetSettledTabViewItem extends StatefulWidget {
  final int index;
  final TabBetSettledController controller;

  const BetSettledTabViewItem(
      {Key? key, required this.index, required this.controller})
      : super(key: key);

  @override
  _BetSettledTabViewItemState createState() => _BetSettledTabViewItemState();
}

class _BetSettledTabViewItemState extends State<BetSettledTabViewItem>
    with BackTopMixin {
  final RefreshController refreshController = RefreshController();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  TabBetSettledController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildSubtotal(context),
        Expanded(
          child: Obx(
            () => SmartRefresher(
              controller: refreshController,
              scrollController: scrollController,
              onRefresh: () {
                try {
                  widget.controller.onRefresh();
                  refreshController.refreshCompleted();
                } catch (_) {
                  refreshController.refreshFailed();
                }
              },
              enablePullUp: true,
              onLoading: () {
                refreshController.loadNoData();
              },
              child: SingleChildScrollView(
                child: controller.metas == null
                    ? controller.loadFail.value
                        ? const EmptyUnSettledList()
                        : const PlaceholderLoading()
                    : controller.metas!.isEmpty || controller.metas!.length == 0
                        ? const EmptyUnSettledList()
                        : ListView.builder(
                            shrinkWrap: true,
                            physics: GetPlatform.isAndroid
                                ? const ClampingScrollPhysics()
                                : const BouncingScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemCount: controller.metas!.length,
                            itemBuilder: (ctx, index) {
                              var data = controller.metas![index];
                              return BetListTile(data, true);
                            },
                          ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSubtotal(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        color: ColorName.colorBlack4,
        constraints: BoxConstraints(
          minHeight: 42.w,
        ),
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text.rich(
                TextSpan(
                    text: 'bet_notes_amount_label'.tr,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                    children: [
                      TextSpan(
                          text:
                              '${AppCurrencyUtils.dealBalance(controller.summary.value.betAmountTotal.toString())}\n',
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
                    ]),
                softWrap: true,
                maxLines: 3,
              ),
            ),
            Container(
              width: 1.w,
              height: 12.w,
              color: Colors.white.withOpacity(0.1),
              margin: EdgeInsets.only(right: 16.w),
            ),
            Text.rich(
              TextSpan(
                text: 'bet_notes_overall_label'.tr,
                style: TextStyle(
                  color: textColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
                children: [
                  TextSpan(
                      text: ' '+'${controller.summary.value.countTotal}'
                          .split('.')
                          .first+' ',
                      style: TextStyle(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                          fontFamily: FontFamily.dINMedium,
                          package: BaseX.pkg2,
                          fontSize: 14)),
                  if((Get.locale?.languageCode??"")!="en")
                  TextSpan(
                    text: 'bet_notes_unlined_label'.tr,
                    style: TextStyle(
                      color: textColor,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  )
                ],
              ),
              softWrap: true,
              maxLines: 3,
            ),
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

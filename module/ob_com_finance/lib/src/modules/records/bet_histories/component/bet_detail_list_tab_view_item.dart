import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/bet_detail_list_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_item.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

final textColor = const Color(0xFFFFFFFF).withOpacity(0.6);

class BetDetailListTabViewItem extends StatefulWidget {
  final int index;

  const BetDetailListTabViewItem({Key? key, required this.index})
      : super(key: key);

  @override
  _BetDetailListTabViewItemState createState() =>
      _BetDetailListTabViewItemState();
}

class _BetDetailListTabViewItemState extends State<BetDetailListTabViewItem>
    with BackTopMixin {
  final controller = Get.find<BetDetailListController>();
  final refreshController = RefreshController();

  void initState() {
    super.initState();
    controller.onSelectPeriod(widget.index);
    if (controller.isRequestedList[widget.index] == false) {
      initialRefresh();
    } else {
      onRefresh();
    }
    controller.isRequestedList[widget.index] = true;
  }

  void initialRefresh() {
    controller.metas = null;
    onRefresh();
  }

  onRefresh() async {
    try {
      await controller.onRefresh();
      refreshController.refreshCompleted();
    } catch (_) {
      refreshController.refreshFailed();
    }
  }

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => Column(
            children: [
              if (controller.obBetStatus == '0')
                Container(
                  height: 42.w,
                  color: const Color(0xFF1D2933),
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      _buildTotal(),
                      _buildCount(),
                    ],
                  ),
                ),
              if (controller.obBetStatus == '1')
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  color: const Color(0xFF1D2933),
                  height: 60.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTotal(),
                          Text.rich(TextSpan(
                              text: "bets_effective_with_money_icon".tr + " ${'symbol'.tr} ",
                              style: TextStyle(
                                color: textColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                              children: [
                                TextSpan(
                                    text: '${AppCurrencyUtils.dealBalance(controller.summary.value.validBetAmountTotal.toString())}',

                                    style: TextStyle(
                                        color: textColor,
                                        fontFamily: FontFamily.dINMedium,
                                        package: BaseX.pkg2,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 14)),
                              ])),
                        ],
                      ),
                      _buildCount(),
                    ],
                  ),
                ),
              Expanded(
                child: SmartRefresher(
                  controller: refreshController,
                  scrollController: scrollController,
                  onRefresh: onRefresh,
                  enablePullUp: true,
                  onLoading: () {
                    refreshController.loadNoData();
                  },
                  child: controller.metas == null
                      ? const PlaceholderLoading()
                      : (controller.metas!.length == 0 ||
                              controller.metas!.isEmpty)
                          ? const EmptyView()
                          : SingleChildScrollView(
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 20.w),
                                itemCount: controller.metas!.length,
                                shrinkWrap: true,
                                physics: GetPlatform.isAndroid
                                    ? const ClampingScrollPhysics()
                                    : const BouncingScrollPhysics(),
                                itemBuilder: (context, index) {
                                  final meta = controller.metas![index];
                                  return Column(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(
                                          left: 16.w,
                                          top: 16.w,
                                          bottom: 8.w,
                                        ),
                                        child: Text(
                                          '${meta.date}',
                                          style: TextStyle(
                                            color: const Color(0xFFFFFFFF)
                                                .withOpacity(0.6),
                                            fontSize: 14,
                                          ),
                                        ),
                                      ),
                                      for (int i = 0;
                                          i < meta.gameRecords.length;
                                          i++)
                                        BetItem(
                                          meta.gameRecords[i],
                                          controller.obBetStatus,
                                          controller.gameCode,
                                        )
                                    ],
                                  );
                                },
                              ),
                            ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Text _buildTotal() {
    return Text.rich(
      TextSpan(
        text: 'bet_histories_bet_amount'.tr + ' ${'symbol'.tr} ',
        style: TextStyle(
          color: textColor,
          fontSize: 12,
        ),
        children: [
          TextSpan(
            text: '${AppCurrencyUtils.dealBalance(controller.summary.value.betAmountTotal.toString())}\n',
            style: TextStyle(
              color: textColor,
              fontFamily: FontFamily.dINMedium,
              package: BaseX.pkg2,
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          if (controller.obBetStatus == '1')
            TextSpan(
              text: 'bet_histories_win_or_lose'.tr,
              style: TextStyle(
                color: textColor,
                fontSize: 12,
              ),
              children: [
                TextSpan(
                  text: " "+_getNetAmountTotal(),
                  style: TextStyle(
                    color: textColor,
                    fontFamily: FontFamily.dINMedium,
                    package: BaseX.pkg2,
                    fontSize: 14,
                  ),
                )
              ],
            ),
        ],
      ),
    );
  }

  Row _buildCount() {
    return Row(
      children: [
        Container(
          width: 1.w,
          height: 16.w,
          color: textColor,
          margin: EdgeInsets.only(right: 8.w),
        ),
        Text.rich(
          TextSpan(
            text: 'bet_histories_total'.tr,
            style: TextStyle(color: textColor, fontSize: 12),
            children: [
              TextSpan(
                text: '${controller.summary.value.countTotal}'.split('.').first,
                style: TextStyle(
                  color: textColor,
                  fontFamily: FontFamily.dINMedium,
                  package: BaseX.pkg2,
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              if((Get.locale?.languageCode??"")!="en")
              TextSpan(
                text: 'bet_histories_single'.tr,
                style: TextStyle(color: textColor, fontSize: 12),
              )
            ],
          ),
        ),
      ],
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

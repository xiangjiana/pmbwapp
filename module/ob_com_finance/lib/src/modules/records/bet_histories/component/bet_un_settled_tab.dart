import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';

import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import '../bet_un_settled_controller.dart';
import 'bet_list_tile.dart';
import 'empty_un_settled_list.dart';

const textColor = ColorName.colorTextWhite60;

class BetUnSettledTab extends StatefulWidget {
  const BetUnSettledTab({Key? key}) : super(key: key);

  @override
  _BetUnSettledTabState createState() => _BetUnSettledTabState();
}

class _BetUnSettledTabState extends State<BetUnSettledTab> with BackTopMixin {
  final controller = Get.find<BetUnSettledController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(
            height: 8.w, thickness: 8.w, color: ColorName.colorSplitWhite10),
        Obx(() => _buildTitle()),
        Expanded(
          child: Obx(
            () => SmartRefresher(
              controller: controller.refreshController,
              scrollController: scrollController,
              onRefresh: controller.onRefresh,
              enablePullUp: true,
              onLoading: () {
                controller.refreshController.loadNoData();
              },
              child: controller.metas == null
                  ? controller.loadFail.value
                      ? const EmptyUnSettledList()
                      : const PlaceholderLoading(
                          alignment: Alignment.topCenter,
                        )
                  : controller.metas!.isEmpty
                      ? const EmptyUnSettledList()
                      : ListView.builder(
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.zero,
                          itemCount: controller.metas!.length,
                          itemBuilder: (ctx, index) {
                            return BetListTile(controller.metas![index], false);
                          },
                        ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      color: ColorName.colorBlack4,
      height: 42.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text.rich(TextSpan(
              text: 'bet_notes_amount_label'.tr,
              style: const TextStyle(color: textColor, fontSize: 12),
              children: [
                TextSpan(
                  text:
                      '${AppCurrencyUtils.dealBalance(controller.summary.value.betAmountTotal.toString())}',
                  style: const TextStyle(
                    color: textColor,
                    fontFamily: FontFamily.dINMedium,
                    package: BaseX.pkg2,
                    fontSize: 14,
                  ),
                )
              ])),
          Row(
            children: [
              Container(
                width: 1.w,
                height: 12.w,
                color: Colors.white.withOpacity(0.1),
                margin: EdgeInsets.only(right: 16.w),
              ),
              Text.rich(
                TextSpan(
                  text: 'bet_notes_overall_label'.tr,
                  style: const TextStyle(color: textColor, fontSize: 12),
                  children: [
                    TextSpan(
                      text: ' '+'${controller.summary.value.countTotal}'
                          .split('.')
                          .first+' ',
                      style: const TextStyle(
                        color: textColor,
                        fontFamily: FontFamily.dINMedium,
                        package: BaseX.pkg2,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    if((Get.locale?.languageCode??"")!="en")
                    TextSpan(
                      text: 'bet_notes_unlined_label'.tr,
                      style: const TextStyle(color: textColor, fontSize: 12),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

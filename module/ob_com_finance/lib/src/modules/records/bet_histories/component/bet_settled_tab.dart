import 'package:flutter/material.dart' hide TabBarView;

import 'package:ob_com_finance/src/modules/records/bet_histories/bet_settled_controller.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_settled_tab_view_item.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_settled_tab_view_item_custom.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';

import 'tabbar_choose_date.dart';

class BetSettledTab extends GetView<BetSettledController> {
  const BetSettledTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarChooseDate(
          controller:controller,
        ),
        Divider(
          key: controller.dateAnchorKey,
          height: 8.w,
          thickness: 8.w,
          color: ColorName.colorSplitWhite10,
        ),
        Expanded(
          child: TabBarView(
            controller: controller.tabController,
            physics: const ClampingScrollPhysics(),
            children:
            [
              BetSettledTabViewItem(index: 0,controller: controller.innerControllers[0]),
              BetSettledTabViewItem(index: 1,controller: controller.innerControllers[1]),
              BetSettledTabViewItem(index: 2,controller: controller.innerControllers[2]),
              BetSettledTabViewItem(index: 3,controller: controller.innerControllers[3]),
              BetSettledTabViewItemCustom(index: 4,controller: controller.innerControllers[4]),
            ],
          ),
        )
      ],
    );
  }
}

import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/records/access_record/componet/empty_deposit.dart';
import 'package:ob_com_finance/src/modules/records/access_record/componet/empty_withdraw.dart';
import 'package:ob_com_finance/src/modules/records/access_record/componet/tab_view_item.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/tabbar_choose_date.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'access_record_controller.dart';

class AccessRecordPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AccessRecordPageState();
  }
}

class _AccessRecordPageState extends State<AccessRecordPage>
    with TickerProviderStateMixin {
  final _tabs = [
    _DepositTab(),
    _WithdrawTab(),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AccessRecordController>(
        global: true,
        init: AccessRecordController(),
        builder: (controller) {
          return ObTheme(
              child: Scaffold(
            body: SafeArea(
              child: Stack(children: [
                Column(children: [
                  SizedBox(
                      width: 220,
                      child: ObTabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        indicator: const BoxDecoration(),
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                        labelColor: Colors.white,
                        unselectedLabelStyle: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                        controller: controller.tabController,
                        onTap: (index) {
                          // controller.onChoseTab(index);
                          eventBus.fire(GlobalBackTopEvent());
                        },
                        tabs: [
                          Tab(child: Text('access_record_deposit'.tr)),
                          Tab(child: Text('access_record_withdraw_money'.tr)),
                        ],
                      )),
                  Expanded(
                    child: NestedTabBarView(
                      controller: controller.tabController,
                      children: _tabs,
                    ),
                  ),
                ]),
                Positioned(
                  left: 0,
                  child: ObBackButton(),
                ),
              ]),
            ),
          ));
        });
  }
}

class _DepositTab extends GetView<AccessRecordController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarChooseDate2(
          controller: controller.depositTabController,
        ),
        Divider(
          key: controller.depositTabController.filterAnchorKey,
          height: 8.w,
          thickness: 8.w,
          color: const Color(0xff0E1519),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.depositTabController.tabController,
            physics: const ClampingScrollPhysics(),
            children: [
              for (int i = 0; i < 5; i++)
                TabViewItem(
                  key: ValueKey('Deposit$i'),
                  parentController: controller,
                  controller: controller
                      .depositTabController.depositRecordControllers[i],
                  emptyWidget: const EmptyDeposit(),
                ),
            ],
          ),
        )
      ],
    );
  }
}

class _WithdrawTab extends GetView<AccessRecordController> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBarChooseDate2(
          controller: controller.withdrawTabController,
        ),
        Divider(
          key: controller.withdrawTabController.filterAnchorKey,
          height: 8.w,
          thickness: 8.w,
          color: Color(0xff0E1519),
        ),
        Expanded(
          child: TabBarView(
            controller: controller.withdrawTabController.tabController,
            children: [
              for (int i = 0; i < 5; i++)
                TabViewItem(
                  key: ValueKey('Withdraw$i'),
                  parentController: controller,
                  controller: controller
                      .withdrawTabController.withdrawRecordControllers[i],
                  emptyWidget: EmptyWithdraw(),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

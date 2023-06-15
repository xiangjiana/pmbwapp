import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_un_settled_tab.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'component/bet_settled_tab.dart';

class BetHistoriesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BetHistoriesPageState();
  }
}

class _BetHistoriesPageState extends State<BetHistoriesPage>
    with TickerProviderStateMixin {
  final tabs = [
    const BetUnSettledTab(),
    const BetSettledTab(),
  ];

  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
    _tabController.index = 0;
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      width: 260,
                      child: ObTabBar(
                        controller: _tabController,
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.white,
                        labelStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        indicatorPadding:const EdgeInsets.only(bottom: 5),
                        unselectedLabelColor: Colors.white.withOpacity(0.6),
                        unselectedLabelStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                        onTap: (index) {
                          // controller.onChoseTab(index);
                          eventBus.fire(GlobalBackTopEvent());
                        },
                        tabs: [
                          Tab(child: Text('un_bet'.tr,style: TextStyle(fontSize: 14),)),
                          Tab(child: Text('belted'.tr,style: TextStyle(fontSize: 14),)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: NestedTabBarView(
                        controller: _tabController,
                        children: tabs,
                      ),
                    ),
                  ],
                ),
                Positioned(left: 0, child: ObBackButton()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

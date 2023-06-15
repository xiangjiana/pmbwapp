import 'package:flutter/material.dart' hide TabBarView;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level_detail/components/tab_bar_view_item.dart';

import '../vip_level_detail_controller.dart';

class LevelTable extends StatefulWidget {
  const LevelTable({Key? key}) : super(key: key);

  @override
  _LevelTableState createState() => _LevelTableState();
}

class _LevelTableState extends State<LevelTable>
    with SingleTickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  VipLevelDetailController vipLevelDetailController =
      Get.find<VipLevelDetailController>();

  TabController? _tabController;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    vipLevelDetailController.tabController = _tabController;
    _tabController?.addListener(() {
      vipLevelDetailController.reloadFooter();
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    double labelFontSize = 14;
    //解决多语言文字排版异常
    if (Get.locale?.languageCode == "vi" || Get.locale?.languageCode == "en") {
      labelFontSize = 12;
    }
    return Obx(() => vipLevelDetailController.tabView1Data.length == 0
        ? Container()
        : Column(
            children: [
              AnimatedContainer(
                key: UniqueKey(),
                height: vipLevelDetailController.pageHeight(
                    vipLevelDetailController.tabView1Data), // any item data
                duration: Duration(milliseconds: 100),
                child: Column(
                  children: [
                    Container(
                      height: 49,
                      child: ObTabBar(
                        controller: _tabController,
                        indicatorWeight: 0,
                        indicator: const TabFixedSizedIndicator(
                          Size(24, 3),
                          Colors.green,
                          radius: Radius.circular(3),
                        ),
                        indicatorSize: TabBarIndicatorSize.label,
                        labelColor: Colors.green,
                        labelStyle: TextStyle(
                          fontSize: labelFontSize,
                          fontWeight: FontWeight.w500,
                        ),
                        unselectedLabelColor: Colors.white.withOpacity(0.6),
                        unselectedLabelStyle: TextStyle(
                          fontSize: labelFontSize,
                        ),
                        tabs: [
                          Tab(
                              child: Text('level_table_tab1'.tr,
                                  textAlign: TextAlign.center)),
                          Tab(
                              child: Text('level_table_tab2'.tr,
                                  textAlign: TextAlign.center)),
                          Tab(
                              child: Text('level_table_tab3'.tr,
                                  textAlign: TextAlign.center)),
                        ],
                      ),
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          TabBarViewItem(
                            width: (1.sw - 28 - 80) / 2.0,
                            height: 40,
                            wrapTitle: false,
                            tabIndex: 0,
                            columns: vipLevelDetailController.tabView1Data,
                          ),
                          TabBarViewItem(
                            width: 80,
                            height: 40,
                            wrapTitle: true,
                            tabIndex: 1,
                            columns: vipLevelDetailController.tabView2Data,
                          ),
                          TabBarViewItem(
                            width: (1.sw - 28 - 80) / 2.0,
                            height: 40,
                            wrapTitle: false,
                            tabIndex: 2,
                            columns: vipLevelDetailController.tabView3Data,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                key: const ValueKey("value"),
                child: _buildFooter(),
              ),
              const SizedBox(height: 8),
            ],
          ));
  }

  Widget _buildFooter() {
    return Obx(() {
      switch (vipLevelDetailController.selectedIndex.value) {
        case 0:
          return Footer(
            text: '',
            unit: AppCurrencyUtils.getAppCurrencySymbolIsVND()
                ? 'rmb_d'.tr
                : AppCurrencyUtils.getAppCurrencySymbolIsTHB()
                    ? 'rmb_t'.tr
                    : 'rmb'.tr,
          );
        case 1:
          return Footer(
            text: Get.locale?.languageCode == "en"
                ? 'level_table_text5'.tr
                : 'level_table_text5'.tr.breakWordOnWeb,
            unit: '',
          );
        case 2:
          return Footer(
            text: '',
            unit: AppCurrencyUtils.getAppCurrencySymbolIsVND()
                ? 'rmb_d'.tr
                : AppCurrencyUtils.getAppCurrencySymbolIsTHB()
                    ? 'rmb_t'.tr
                    : 'rmb'.tr,
          );
        default:
          return Footer(text: "", unit: "");
      }
    });
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.text,
    required this.unit,
  }) : super(key: key);

  final String text;
  final String unit;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: text != '',
          child: Container(
            padding: const EdgeInsets.only(left: 16),
            alignment: Alignment.centerLeft,
            margin: const EdgeInsets.only(bottom: 12),
            child: Text(
              '$text',
              style: TextStyle(
                fontSize: 12,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
        ),
        Visibility(
          visible: unit != '',
          child: Container(
            margin: const EdgeInsets.only(right: 18),
            height: 22,
            alignment: Alignment.centerRight,
            // child: Text('单位：$unit', style: TextStyle(fontSize: 12)),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                RichText(
                  text: TextSpan(children: [
                    TextSpan(
                      text: '${'unit'.tr}: ',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    TextSpan(
                      text: '$unit',
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

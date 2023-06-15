import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level_detail/components/level_rule.dart';
import 'package:ob_package/modules/vip/vip_level_detail/components/level_table.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_level_detail_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';

class VipLevelDetailPage extends GetView<VipLevelDetailController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('vip_rule'.tr),
          leading: ObBackButton(),
          bottom: const PreferredSize(
            preferredSize: Size.fromHeight(8),
            child: Divider(
              height: 8,
              thickness: 8,
              color: Color(0xFF0E1519),
            ),
          ),
        ),
        body: CustomScrollView(
          physics: ClampingScrollPhysics(),
          slivers: [
            Obx(
              () => controller.tabView1Data.length == 0
                  ? SliverList(delegate: SliverChildListDelegate([Container()]))
                  : SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          Column(
                            children: [
                              const LevelTable(),

                              /// 规则
                              const Divider(
                                height: 8,
                                thickness: 8,
                                color: Color(0xFF0E1519),
                              ),
                              LevelRule(controller),

                              /// 没有更多了
                              Container(
                                padding: const EdgeInsets.symmetric(vertical: 24),
                                alignment: Alignment.center,
                                child: Text(
                                  '',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.white.withOpacity(0.4),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

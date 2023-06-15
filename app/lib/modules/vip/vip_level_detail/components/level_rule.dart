import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level_detail/components/rule_tile.dart';
import 'package:ob_package/modules/vip/vip_level_detail/components/vip_list_dialog_widget.dart';
import 'package:ob_package/modules/vip/vip_level_detail/vip_level_detail_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';

class LevelRule extends StatelessWidget {
  VipLevelDetailController controller;

  LevelRule(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            width: 230,
            constraints: const BoxConstraints(minHeight: 35),
            padding: const EdgeInsets.symmetric(vertical: 6),
            decoration: const BoxDecoration(
              color: Color(0xDF0B2B04),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(17.5),
                bottomRight: Radius.circular(17.5),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'level_rule_caption'.tr,
                style: TextStyle(
                    color: Colors.green.withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            ),
          ),
          RuleTile(
            rankNo: 1,
            title: 'level_rule_title1'.tr,
            describe: 'level_rule_text1'.tr,
          ),
          RuleTile(
            rankNo: 2,
            title: 'level_rule_title2'.tr,
            describe: 'level_rule_text2'.tr,
          ),
          RuleTile(
            rankNo: 3,
            title: 'level_rule_title3'.tr,
            describe: 'level_rule_text3'.tr,
          ),
          RuleTile(
            rankNo: 4,
            title: 'level_rule_title4'.tr,
            describe: 'level_rule_text4'.tr,
          ),
          RuleTile(
            rankNo: 5,
            title: 'level_rule_title5'.tr,
            describe: 'level_rule_text5'.tr,
          ),
          RuleTile(
            rankNo: 6,
            title: 'level_rule_title6'.tr,
            describe: 'level_rule_text6'.tr,
          ),
          RuleTile(
            rankNo: 7,
            widgetSpans: [
              TextSpan(
                text: 'member_reach_min_charge_requirements'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
              ),
              WidgetSpan(
                child: GestureDetector(
                  onTap: () {
                    showDialog();
                  },
                  child: ObImage.asset(
                    Assets.vip.comWenhao.path,
                    width: 16,
                    height: 16,
                  ),
                ),
              ),
              TextSpan(
                text: 'level_rule_text10'.tr,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.white60,
                ),
              ),
            ],
            title: 'level_rule_title7'.tr,
            describe: 'level_rule_text7'.tr,
          ),
          RuleTile(
            rankNo: 8,
            title: 'level_rule_title8'.tr,
            describe: 'level_rule_text8'.tr,
          ),
          RuleTile(
            rankNo: 9,
            title: 'level_rule_title9'.tr,
            describe: 'level_rule_text9'.tr,
          ),
          // RuleTile(
          //   rankNo: 10,
          //   title: 'level_rule_title_10'.tr,
          //   describe: 'level_rule_text_for_10'.tr,
          // ),
        ],
      ),
    );
  }

  void showDialog() {
    OBDialogUtil.show(
      VipListDilaogWidget(controller.limitBeans),
    );
  }
}

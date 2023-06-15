import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart';
import 'package:ob_component/ob_component.dart' hide SizeExtension;
import 'package:sprintf/sprintf.dart';

class VipLevelActivityTitle extends StatelessWidget {
  final listPromotion;
  final String level;
  final String minActivity;

  VipLevelActivityTitle({
    required this.listPromotion,
    required this.level,
    required this.minActivity,
  });

  String _participateNum(int participateNum) {
    if (participateNum == 0) {
      return "vip_level_once".tr;
    } else if (participateNum == 1) {
      return "vip_level_week".tr;
    } else if (participateNum == 2) {
      return "vip_level_month".tr;
    } else {
      return "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF151E25),
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Container(
        width: 343.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  alignment: Alignment.bottomLeft,
                  margin: EdgeInsets.only(right: 8.w),
                  child: Text(
                    listPromotion.vipGradeName + " " + "vip_level_active".tr,
                    style: const TextStyle(
                      height: 1,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () => _showTipDialog(),
                    child: Container(
                        alignment: Alignment.bottomLeft,
                        width: 16.w,
                        height: 16.w,
                        child: ObImage.asset(
                          Assets.images.icon.comWenhao.path,
                          alignment: Alignment.bottomLeft,
                          width: 16.w,
                          height: 16.w,
                        ))),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 8.w),
                alignment: Alignment.centerLeft,
                child: RichText(
                    text: TextSpan(
                  text: 'vip_low_trans'.tr.breakWordOnWeb,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text:
                          ' ${AppCurrencyUtils.dealBalance('${listPromotion.lowestTransferQuota}')} ',
                      style: TextStyle(
                        color: Color(0xFFFF5722),
                        fontWeight: FontWeight.w500,
                        fontFamily: FontFamily.dINMedium,
                        package: BaseX.pkg2,
                        fontSize: 14,
                      ),
                    ),
                    TextSpan(
                        text: AppCurrencyUtils.getAppCurrencySymbolIsVND()
                            ? ('vip_level_reward'
                                    .tr
                                    .replaceAll("元，", '')
                                    .breakWordOnWeb +
                                _participateNum(listPromotion.participateNum))
                            : 'vip_level_reward'.tr.breakWordOnWeb +
                                _participateNum(listPromotion.participateNum),
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.6),
                          fontSize: 14,
                        )),
                  ],
                ))),
          ],
        ),
      ),
    );
  }

  _showTipDialog() {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'vip_level_active_alert_title'.tr,
        content: AppCurrencyUtils.getAppCurrencySymbolIsVND()
            ? sprintf('vip_level_active_tip_d'.tr.breakWordOnWeb,
                [(double.parse(minActivity) / 1000).toString() + 'K'])
            : AppCurrencyUtils.getAppCurrencySymbolIsTHB()
                ? 'vip_level_active_tip_t'.tr
                : sprintf(
                    'vip_level_active_tip'.tr.breakWordOnWeb, [minActivity]),
        confirmText: 'vip_level_active_alert_know'.tr,
        onConfirmListener: () {
          Get.back();
        },
      ),
    );
  }
}

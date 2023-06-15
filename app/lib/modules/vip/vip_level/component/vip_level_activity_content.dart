import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class VipLevelActivityContent extends StatelessWidget {
  final listPromotion;

  VipLevelActivityContent({required this.listPromotion});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF151E25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Container(
              constraints:BoxConstraints(
                minHeight: 120,
              ) ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ObImage.asset(
                    Assets.vip.vipAwardHongli.path,
                    height: 56.w,
                    width: 56.w,
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    listPromotion.bonusRatio <= 0
                        ? "-"
                        : "${numberFormat(listPromotion.bonusRatio * 100, point: 0)}%",
                    style: TextStyle(
                        color: Color(0xFFDFC28C),
                        fontFamily: FontFamily.dINMedium,
                        package: BaseX.pkg2,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    "vip_bonus_ratio".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints:BoxConstraints(
                minHeight: 120,
              ) ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ObImage.asset(
                    Assets.vip.vipAwardJiangli.path,
                    height: 56.w,
                    width: 56.w,
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    listPromotion.highestBonus <= 0
                        ? "-"
                        : "${AppCurrencyUtils.dealBalance("${listPromotion.highestBonus}")}",
                    style: TextStyle(
                        color: Color(0xFFDFC28C),
                        fontFamily: FontFamily.dINMedium,
                        package: BaseX.pkg2,
                        fontSize: 14,
                        fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    "vip_highest_bonus".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              constraints:BoxConstraints(
                minHeight: 120,
              ) ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  ObImage.asset(
                    Assets.vip.vipAwardLiushui.path,
                    height: 56.w,
                    width: 56.w,
                  ),
                  SizedBox(height: 8.w),
                  Text(
                    listPromotion.waterMultiple <= 0
                        ? "-"
                        : "${numberFormat(listPromotion.waterMultiple, point: 0)}" +
                            'vip_times'.tr,
                    style: TextStyle(
                      color: Color(0xFFDFC28C),
                      fontFamily: FontFamily.dINMedium,
                      package: BaseX.pkg2,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 4.w),
                  Text(
                    "vip_water_multiple".tr,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

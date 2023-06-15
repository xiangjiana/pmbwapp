import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_component/ob_component.dart';

class VipLevelCard extends StatelessWidget {
  final VipLevelController controller;
  final String level;
  final String userLevel;

  ///保级有效期（天）  升级条件累计存款(包含代充) 流水要求 保级流水
  final Grade itemCard;

  VipLevelCard({
    Key? key,
    required this.controller,
    required this.level,
    required this.userLevel,
    required this.itemCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color vipTextColor = int.parse(userLevel) >= int.parse(level)
        ? controller.vipTextColor[level] ?? Color(0xFFAE1E17)
        : controller.noVipTextColor[level] ?? Color(0xFFAE1E17);
    return Padding(
      padding: EdgeInsets.only(left: 16.w, right: 16.w),
      child: ClipRRect(
        clipBehavior: Clip.antiAlias,
        borderRadius: BorderRadius.circular(8.w),
        child: Container(
          width: 343.w,
          height: 168.w,
          decoration: BoxDecoration(
            gradient: level == "10" && int.parse(level) <= int.parse(userLevel)
                ? LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: [
                Color(0xFF070707),
                Color(0xFF363636),
                Color(0xFF101010),
              ],
              stops: [0, 0.41, 1],
            )
                : LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                int.parse(userLevel) >= int.parse(level)
                    ? controller.vipColorStart[level] ?? Color(0xFFEBEBEB)
                    : controller.noVipColorStart[level] ??
                    Color(0xFFEBEBEB),
                int.parse(userLevel) >= int.parse(level)
                    ? controller.vipColorEnd[level] ?? Color(0xFFF1AEAE)
                    : controller.noVipColorEnd[level] ?? Color(0xFFF1AEAE),
                //Color(0xFFF1AEAE),
              ],
              stops: [
                0,
                0.99,
              ],
            ),
          ),
          child: Stack(
            children: [
              Container(
                  width: 168.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Assets.vip.vipKapian.path,
                          package: BaseX.pkg),
                      fit: BoxFit.cover,
                    ),
                  )),
              if (level == userLevel)
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      height: 20.w,
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      decoration: BoxDecoration(
                        color: Color(0xFFE1A100),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.w),
                          bottomRight: Radius.circular(8.w),
                        ),
                      ),
                      child: Text(
                        "vip_level_current".tr,
                        style: TextStyle(
                          height: 1,
                          color: Colors.white,
                          wordSpacing: -1.5,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
              Container(
                margin: EdgeInsets.only(top: 27.w, left: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 8.w),
                      child: Text(
                        "${itemCard.vipGradeName}",
                        style: TextStyle(
                            color: vipTextColor,
                            fontFamily: FontFamily.dINMedium,
                            package: BaseX.pkg2,
                            fontSize: 28,
                            fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(
                      width: 200.w,
                      child: Wrap(
                        spacing: 2.0.w,
                        alignment: WrapAlignment.start,
                        children: [
                          Text(
                            "vip_level_relegation".tr,
                            style: TextStyle(
                              color: vipTextColor.withOpacity(0.6),
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            itemCard.relegationValidPeriod < 0
                                ? "- " + "vip_level_day".tr
                                : "${itemCard.relegationValidPeriod} " +
                                "vip_level_day".tr,
                            style: TextStyle(
                              color: vipTextColor.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                  right: 12,
                  child: Container(
                    width: 104.w,
                    height: 104.w,
                    child: ObImage.asset(int.parse(userLevel) >= int.parse(level)
                        ? controller.vipGrade[level].toString()
                        : controller.noVipGrade[level].toString()),
                  )),
              Container(
                margin: EdgeInsets.only(top: 117.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Expanded(
                      child: AmountItem(
                        label: "vip_level_total_deposit".tr,
                        value: AppCurrencyUtils.dealBalance(
                            itemCard.totalDeposit.toString()),
                        vipTextColor: vipTextColor,
                      ),
                    ),
                    Expanded(
                      child: AmountItem(
                        label: "vip_level_total_valid_water".tr,
                        value: AppCurrencyUtils.dealBalance(
                            itemCard.tatalValidWater.toString()),
                        vipTextColor: vipTextColor,
                      ),
                    ),
                    Expanded(
                      child: AmountItem(
                        label: "vip_level_relegation_water".tr,
                        value: AppCurrencyUtils.dealBalance(
                            itemCard.relegationWater.toString()),
                        vipTextColor: vipTextColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class AmountItem extends StatelessWidget {
  const AmountItem({
    Key? key,
    required this.label,
    required this.value,
    required this.vipTextColor,
  }) : super(key: key);

  final String label;
  final String value;
  final Color vipTextColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value.isEmpty ? "-" : value,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: vipTextColor,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: FontFamily.gothamMedium,
            package: BaseX.pkg2,
          ),
        ),
        Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: vipTextColor.withOpacity(0.6),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}

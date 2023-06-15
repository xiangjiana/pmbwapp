import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class VipLeveUser extends StatelessWidget {
  final VipLevelController vipController;

  VipLeveUser(this.vipController);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(Assets.vip.vipHome.path, package: BaseX.pkg),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            SizedBox(
                height: MediaQuery.of(context).padding.top + kToolbarHeight),
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: 88.w,
                  height: 88.w,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                ),
                Obx(
                  () => Container(
                    width: 82.w,
                    height: 82.w,
                    clipBehavior: Clip.hardEdge,
                    decoration: const ShapeDecoration(
                      shape: CircleBorder(),
                    ),
                    child: vipController.isAvatarHttpUrl
                        ? ObImage.network(vipController.userAvatarUrl)
                        : ObImage.asset(vipController.userAvatarUrl,package:BaseX.pkg),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  vipController.userName,
                  style: const TextStyle(
                    color: Color(0xFFE1A100),
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                ),
                SizedBox(width: 7.w),
                Text(
                  "${vipController.selectVipLevel.value.grade}",
                  style: const TextStyle(
                    color: Color(0xFFE1A100),
                    fontFamily: FontFamily.dINMedium,
                      package: BaseX.pkg2,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    height: 1.1

                  ),
                )
              ],
            ),
            SizedBox(height: 23.w),
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "vip_current_promotion_progress".tr,
                  style: const TextStyle(fontSize: 12, color: Color(0xFFFFFFFF)),
                ),
                SizedBox(width: 4.w),
                Obx(
                  () => Text(
                    vipController.vipExperience,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: FontFamily.dINMedium,
                      package: BaseX.pkg2,
                      fontSize: 20,
                      color: Color(0xFFFFFFFF),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 6.w),
            ClipRRect(
              borderRadius: BorderRadius.circular(2.w),
              child: Obx(
                () => LinearProgressIndicator(
                  value: vipController.vipExperienceNum,
                  minHeight: 4.w,
                  backgroundColor: Colors.white.withOpacity(0.1),
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                ),
              ),
            ),
            SizedBox(height: 4.w),
            Row(
              children: [
                Text(
                  vipController.selectVipLevel.value.grade,
                  style: TextStyle(
                      color: Colors.white.withOpacity(0.6),
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  vipController.vipLevel ==
                          vipController.tabBarTitle.length.toString()
                      ? ""
                      : vipController.selectVipLevel.value.nextGrade,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.6),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
            SizedBox(height: 8.w),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 9.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Colors.white.withOpacity(0.03),
              ),
              // height: 58.w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AmountRow(
                    vipController: vipController,
                    text: "vip_level_deposit_curr".tr,
                    amount1:
                        vipController.selectVipLevel.value.depositAmountCurr,
                    amount2:
                        vipController.selectVipLevel.value.depositAmountTotal,
                  ),
                  SizedBox(height: 7.w),
                  AmountRow(
                    vipController: vipController,
                    text: "vip_level_valid_Curr".tr,
                    amount1: vipController.selectVipLevel.value.validBetsCurr,
                    amount2: vipController.selectVipLevel.value.validBetsTotal,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AmountRow extends StatelessWidget {
  const AmountRow({
    Key? key,
    required this.vipController,
    required this.text,
    required this.amount1,
    required this.amount2,
  }) : super(key: key);

  final VipLevelController vipController;
  final String text;
  final String amount1;
  final String amount2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
            ),
          ),
        ),
        Spacer(),
        Text(
          amount1.isEmpty ? "-" : "${AppCurrencyUtils.dealBalance(amount1)}",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
        Text(
          amount2.isEmpty ? "/ -" : "/ ${AppCurrencyUtils.dealBalance(amount2)}",
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

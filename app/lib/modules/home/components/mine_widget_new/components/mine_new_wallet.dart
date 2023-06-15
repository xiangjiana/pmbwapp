import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import '../mine_new_controller.dart';

class MineNewWallet extends GetView<MineNewController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 38.w),
      decoration: BoxDecoration(
        //color: Color(0xff17191B),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          SizedBox(height: 40.w,),
          Container(
            //height: 112.w,
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () => Get.toNamed(AppRoutes.VIP_LEVEL),
                        child: Row(
                          children: [
                            Container(
                              constraints: BoxConstraints(minWidth: 48.w),
                              alignment: Alignment.center,
                              padding: const EdgeInsets.only(left: 4, right: 8),
                              height: 18.w,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFB1B6C9),
                                shape: StadiumBorder(),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  Container(
                                    height: 17.w,
                                    alignment: Alignment.centerLeft,
                                    child: Obx(
                                      () => Text(
                                        controller.vipLabel,
                                        style: const TextStyle(
                                          fontSize: 12,
                                          height: 1,
                                          color: Color(0xff17181B),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Spacer(),
                            Text.rich(
                              TextSpan(
                                children: [
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        right:
                                            LocaleUtils.isLocale ? 15.w : 8.w,
                                      ),
                                      child: Text(
                                        'home_card_promotion'.tr,
                                        style: TextStyle(
                                          fontSize: 10,
                                          height: 1.1,
                                          color: Colors.white.withOpacity(0.6),
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Obx(
                                      () => Text(
                                        '${controller.vipExperience}',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          height: 1.1,
                                          color: Get.theme.colorScheme.primary,
                                        ),
                                      ),
                                    ),
                                  ),
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: ObImage.asset(
                                      Assets.images.icon.homeMoreRight.path,
                                      width: 16.w,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8.w),
                      Container(
                        clipBehavior: Clip.hardEdge,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(2.w),
                        ),
                        child: Obx(
                          () => LinearProgressIndicator(
                            value: controller.vipExperienceNum,
                            minHeight: 2.w,
                            backgroundColor: Colors.white.withOpacity(0.3),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                                Color(0xFFFFFFFF)),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 50.w,),
        ],
      ),
    );
  }
}

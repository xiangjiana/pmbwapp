import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/home/components/mine_widget/gradient_icon_button.dart';
import 'package:ob_package/modules/home/components/mine_widget/mine_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_component/ob_component.dart';

class MineWallet extends GetView<MineController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Color(0xff1E262D),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          Container(
            height: 46.w,
            child: Row(
              children: [
                Text(
                  'mine_my_wallet'.tr,
                  style: TextStyle(
                    fontSize: 16,
                    height: 1.15,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => controller.toggleObscure(),
                  child: Obx(
                    () => Container(
                      width: 44.w,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      child: ObImage.asset(
                        controller.obscureAmount
                            ? Assets.images.icon.loginEyeOn.path
                            : Assets.images.icon.loginEye.path,
                        width: 24,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Get.toNamed(AppRoutes.MY_WALLET, parameters: {
                    "showDeposit":
                        AppMerchantUtils.loadCurMerchantBy(OBModules.kDeposit)
                            ? "1"
                            : "0",
                    "showWithdraw": AppMerchantUtils.loadCurMerchantBy(
                            OBModules.kWithdrawals)
                        ? "1"
                        : "0"
                  }),
                  child: Container(
                    height: 46.w,
                    child: Row(
                      children: [
                        SizedBox(width: 12.w),
                        Text(
                          'mine_enter_wallet'.tr,
                          style: TextStyle(
                            fontSize: 12,
                            height: 1.16,
                            color:
                                Get.theme.colorScheme.primary.withOpacity(.6),
                          ),
                        ),
                        Container(
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 4.w, left: 4.w, bottom: 4.w),
                            child: ObImage.asset(
                              Assets.images.icon.homeMoreRight.path,
                              width: 16.w,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Divider(
            height: 1.w,
            thickness: 1.w,
            color: Get.theme.colorScheme.primary.withOpacity(.06),
          ),
          SizedBox(height: 16.w),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.MY_WALLET),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'mine_total_balance'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Get.theme.colorScheme.primary.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 8.w),
                      Obx(() => Text(
                            controller.obscureAmount
                                ? "*****"
                                : "${BalanceManager.formatTotalBalance}",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.gothamMedium,
                              package: BaseX.pkg2,
                              color: Get.theme.colorScheme.primary,
                            ),
                          ))
                    ],
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'mine_center_wallet'.tr,
                        style: TextStyle(
                          fontSize: 12,
                          color: Get.theme.colorScheme.primary.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 8.w),
                      Obx(() => Text(
                            controller.obscureAmount
                                ? "*****"
                                : "${BalanceManager.formatCenterBalance}",
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: FontFamily.gothamMedium,
                              package: BaseX.pkg2,
                              color: Get.theme.colorScheme.primary,
                            ),
                          ))
                    ],
                  ),
                ),
                SizedBox(
                  width: 16.w,
                )
              ],
            ),
          ),
          SizedBox(height: 16.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              if (AppMerchantUtils.loadCurMerchantBy(OBModules.kDeposit))
                GradientIconButton(
                  width: (1.sw - 80.w - 2.w) / 3,
                  // 98.w,
                  height: 32.w,
                  icon: ObImage.asset(
                    Assets.images.icon.walletDepositWhite.path,
                    width: 20.w,
                  ),
                  text: 'home_icon_deposit'.tr,
                  gradient: [
                    Get.theme.buttonTheme.colorScheme!.primaryVariant,
                    Color(0xffFF9B59),
                  ],
                  onPress: () {
                    //Get.toNamed(AppRoutes.DEPOSIT);
                    GoUtils.goDeposit();
                  },
                ),
              if (AppMerchantUtils.loadCurMerchantBy(OBModules.kDeposit))
                SizedBox(
                  width: 8.w,
                ),
              if (AppMerchantUtils.loadCurMerchantBy(OBModules.kWithdrawals))
                GradientIconButton(
                  width: (1.sw - 80.w - 2.w) / 3,
                  // 98.w,
                  height: 32.w,
                  icon: ObImage.asset(
                    Assets.images.icon.walletWithdrawalWhite.path,
                    width: 20.w,
                  ),
                  text: 'home_icon_withdraw'.tr,
                  gradient: [
                    Color(0xffF8AD02).withOpacity(0.8),
                    Color(0xffFFE57C).withOpacity(0.8),
                  ],
                  onPress: () => Get.toNamed(AppRoutes.WITHDRAW),
                ),
              if (AppMerchantUtils.loadCurMerchantBy(OBModules.kWithdrawals))
                SizedBox(
                  width: 8.w,
                ),
              GradientIconButton(
                width: (1.sw - 80.w - 2.w) / 3,
                // 98.w,
                height: 32.w,
                icon: ObImage.asset(
                  Assets.images.icon.walletAccountWhite.path,
                  width: 20.w,
                ),
                text: 'home_icon_transfer'.tr,
                gradient: [
                  Color(0xff2962C6).withOpacity(0.8),
                  Color(0xff48A5FF).withOpacity(0.8),
                ],
                onPress: () => Get.toNamed(AppRoutes.TRANSFER),
              ),
            ],
          ),
          SizedBox(height: 22.w),
        ],
      ),
    );
  }
}

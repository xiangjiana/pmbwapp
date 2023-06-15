import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import '../../home/components/mine_widget/mine_controller.dart';
import 'package:ob_package/modules/home/components/mine_widget/mine_controller.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';

class NavigationComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 17.w, bottom: 1.w),
      child: Row(
        children: [
          GetBuilder<MineController>(
              init: MineController(Get.find()),
              builder: (controller) {
                return Container(
                  margin: EdgeInsets.only(left: 17.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            controller.userName,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.white60,
                            ),
                          ),
                          SizedBox(
                            width: 4.w,
                          ),
                          !AppMerchantUtils.loadCurMerchantBy(OBModules.kVIPS)?SizedBox():GestureDetector(
                            behavior: HitTestBehavior.translucent,
                            onTap: () => Get.toNamed(AppRoutes.VIP_LEVEL),
                            child: Container(
                              constraints: BoxConstraints(minWidth: 52.w),
                              alignment: Alignment.centerLeft,
                              padding: EdgeInsets.only(left: 4, right: 8),
                              height: 18.w,
                              decoration: ShapeDecoration(
                                color: Color(0xffE1A100).withOpacity(.2),
                                shape: StadiumBorder(),
                              ),
                              child: Row(
                                children: [
                                  ObImage.asset(
                                    Assets.images.icon.myHomeVip01.path,
                                    width: 16.w,
                                    height: 16.w,
                                  ),
                                  SizedBox(width: 4.w),
                                  Container(
                                    height: 17.w,
                                    alignment: Alignment.centerLeft,
                                    child: Obx(
                                      () => Text(
                                        controller.vipLabel,
                                        style: controller.vipLabel
                                                .startsWith(r'\w')
                                            ? TextStyle(
                                                fontSize: 14,
                                                fontFamily:
                                                    FontFamily.dINMedium,
                                            package: BaseX.pkg2,
                                                color: Color(0xffE1A100),
                                                height: 1)
                                            : TextStyle(
                                                fontSize: 12,
                                                height: 1,
                                                color: Color(0xffE1A100),
                                              ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 4.w,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'symbol'.tr,
                            style: TextStyle(
                              fontSize: AppCurrencyUtils.getAppCurrencySymbolIsVND()?17:14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 8.w,
                          ),
                          Obx(() => Text(
                                controller.obscureAmount
                                    ? "*****"
                                    : "${BalanceManager.formatTotalBalance}",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ))
                        ],
                      )
                    ],
                  ),
                );
              }),
          Spacer(),
          if (AppMerchantUtils.loadCurMerchantBy(OBModules.kDeposit))
            _buildHomeIcon(
              Assets.images.icon.homeWalletDeposit.path,
              "home_icon_deposit".tr,
              AppRoutes.DEPOSIT,
            ),
          _buildHomeIcon(
            Assets.images.icon.homeTransferAccounts.path,
            "home_icon_transfer".tr,
            AppRoutes.TRANSFER,
          ),
          if (AppMerchantUtils.loadCurMerchantBy(OBModules.kWithdrawals))
            _buildHomeIcon(
              Assets.images.icon.homeWalletWithdrawal.path,
              "home_icon_withdraw".tr,
              AppRoutes.WITHDRAW,
            ),
          if (AppMerchantUtils.loadCurMerchantBy(OBModules.kVIPS))
            _buildHomeIcon(
              Assets.images.icon.homeVip.path,
              "vip".tr,
              AppRoutes.VIP_LEVEL,
            ),
          SizedBox(width: 12.w),
        ],
      ),
    );
  }

  Widget _buildHomeIcon(String icon, String text, String route) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (AppRoutes.DEPOSIT == route) {
          GoUtils.goDeposit();
        } else {
          Get.toNamed(route);
        }
      },
      child: Padding(
        padding: EdgeInsets.only(left: 4.w, right: 4.w),
        child: Container(
          constraints: BoxConstraints(
            minWidth: 40.w,
            minHeight:  68.w,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ObImage.asset(
                "$icon",
                width: 38.w,
                height: 38.w,
              ),
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: LocaleUtils.isLocale ? 10 : 12,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

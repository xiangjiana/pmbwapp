import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_finance/ob_com_finance.dart';
import 'package:ob_package/modules/home/components/message_badge.dart';
import 'package:ob_package/modules/home_modules/home_user/user_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import '../../mine_widget_new/mine_new_controller.dart';

class HomeSmallTitle extends StatelessWidget {
  HomeSmallTitle(this.drawerKey);

  GlobalKey drawerKey;

  final userController = Get.find<UserController>();

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Get.theme.backgroundColor,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top.w),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  (drawerKey.currentState as ScaffoldState).openDrawer();
                },
                child: Padding(
                  padding: EdgeInsets.only(left: 8.w, right: 4.w),
                  child: pkObImage(
                    Assets.images.leftMenu.path,
                    height: 32.w,
                    width: 24.w,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              pkObImage(
                Assets.images.pmLogo.path,
                height: 30.w,
                width: 101.w,
                fit: BoxFit.fitHeight,
              ),
              const Spacer(),
              Obx(() => Row(
                children: !userController.isLogin.value
                    ? [
                  SizedBox(height: 32.w + 12.5.w * 2),
                  Padding(
                    padding: EdgeInsets.only(right: 8.w),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(1.3),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(AppRoutes.LOGIN, arguments: {});
                            },
                            child: Container(
                              width: 80.w,
                              height: 32.w,
                              alignment: Alignment.center,
                              decoration: const BoxDecoration(
                                color: Color(0xff24262B),
                              ),
                              child: Text(
                                'login_title'.tr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xff98A7B5),
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                AppRoutes.LOGIN,
                                arguments: {"isLoginPage": false},
                              );
                            },
                            child: Container(
                              width: 80.w,
                              height: 32.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    Assets.images.btnbg.path,
                                    package: BaseX.pkg,
                                  ),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Text(
                                'register_text'.tr,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ]
                    : [
                  !AppMerchantUtils.loadCurMerchantBy(
                      OBModules.kCustomerService)
                      ? const SizedBox()
                      : GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: PublicResources.jumpToMemberServicePage,
                    child: pkObImage(
                      Assets.images.icon.homeTopService.path,
                      height: 32.w,
                      width: 24.w,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 8.w),
                    child: MessageBadge(
                      color: Colors.transparent,
                      padding: EdgeInsets.symmetric(
                        vertical: 12.5.w,
                        horizontal: 0.w,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 11.w, right: 6.w),
                    width: 148.w,
                    height: 32.w,
                    decoration:
                    const BoxDecoration(color: Color(0xff151719)),
                    child: Row(
                      children: [
                        Expanded(
                          child: GetBuilder<MineNewController>(
                              init: MineNewController(Get.find()),
                              builder: (controller) {
                                return Padding(
                                  padding: EdgeInsets.only(left: 4.w),
                                  child: Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        controller.userName,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                          color: Color(0xff999999),
                                        ),
                                      ),
                                      Expanded(
                                        child: Obx(
                                              () => Text(
                                            !controller.homePageController
                                                .obscureAmount
                                                ? "*****"
                                                : "${'symbol'.tr} ${BalanceManager.formatTotalBalance}",
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                );
                              }),
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            Get.toNamed(AppRoutes.DEPOSIT_EASY);
                          },
                          child: pkObImage(Assets.images.walletHome.path,
                              height: 32.w,
                              width: 32.w,
                              fit: BoxFit.fill),
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
          Container(
            height: 1.w,
            color: Colors.white.withOpacity(.1),
          )
        ],
      ),
    );
  }

  GestureDetector _buildSummary() {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        Get.toNamed(AppRoutes.MY_WALLET);
      },
      child: Row(
        children: [
          // SizedBox(width: 16),
          // Container(
          //   width: 36,
          //   height: 36,
          //   clipBehavior: Clip.hardEdge,
          //   decoration: ShapeDecoration(
          //     shape: CircleBorder(),
          //   ),
          //   child: userController?.isAvatarHttpUrl == true
          //       ? ObImage.network(userController?.userAvatarUrl ?? '')
          //       : ObImage.asset(userController?.userAvatarUrl ?? ''),
          // ),
          const SizedBox(width: 8),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(
                () => Text(
                  "${BalanceManager.formatTotalBalance}",
                  style: TextStyle(
                    fontFamily: FontFamily.gothamMedium,
                    package: BaseX.pkg2,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ),
              Row(
                children: [
                  Text(
                    "home_profit_and_loss_today".tr,
                    overflow: TextOverflow.visible,
                    style: TextStyle(
                      fontSize: 10,
                      color: Get.theme.colorScheme.primary.withOpacity(.3),
                      height: 1.2,
                      wordSpacing: -1.5,
                      letterSpacing: kIsWeb ? -0.3 : 0,
                    ),
                  ),
                  SizedBox(width: GetPlatform.isWeb ? 10.w : 4.w),
                  Expanded(
                      child: Obx(
                    () => ConstrainedBox(
                      constraints: BoxConstraints(
                        maxWidth: 60.w,
                      ),
                      child: Text(
                        "${userController?.profitAndLoss.value}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontFamily: FontFamily.gothamMedium,
                          package: BaseX.pkg2,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Get.theme.colorScheme.primary,
                          height: 1.2,
                        ),
                      ),
                    ),
                  ))
                ],
              ),
            ],
          )),
        ],
      ),
    );
  }

  Expanded _buildButton(String route, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (route == AppRoutes.DEPOSIT) {
            GoUtils.goDeposit();
          } else {
            Get.toNamed(route);
          }
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          width: 24,
          alignment: Alignment.center,
          margin: const EdgeInsets.only(
            left: 4,
            right: 4,
          ),
          child: Text(
            text,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1,
              color: ColorName.white,
            ),
          ),
        ),
      ),
    );
  }
}

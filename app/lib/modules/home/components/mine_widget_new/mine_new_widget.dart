import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/ob_com_finance.dart';
import 'package:ob_component/ob_component.dart';

import 'components/mine_new_wallet.dart';
import 'mine_new_controller.dart';
import 'mine_new_list_tile.dart';

class MineNewWidget extends StatelessWidget {
  const MineNewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineNewController>(
      init: MineNewController(Get.find()),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF1C1E22),
        body: Column(
          children: [
            ///DownloadTip(),
            Expanded(
                child: SingleChildScrollView(
              controller: controller.scrollController,
              physics: GetPlatform.isAndroid
                  ? ClampingScrollPhysics()
                  : BouncingScrollPhysics(),
              child: Obx(
                () => Stack(
                  children: [
                    ObImage.asset(
                      Assets.images.bg.myHomeTopNew3x.path,
                      fit: BoxFit.fitHeight,
                      //width: 264.w,
                      height: 300.w,
                    ),
                    Column(
                      children: [
                        SizedBox(height: 48.w),
                        _buildSetting(),
                        SizedBox(height: 10.w),
                        _buildAvatarBar(controller),
                        SizedBox(height: 20.w),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Column(
                            children: [
                              MineNewWallet(),
                              SizedBox(
                                height: 20.w,
                              ),
                              _buildIconList(),
                              SizedBox(
                                height: 20.w,
                              ),
                              Visibility(
                                visible: controller.isActivityEntry,
                                child: SizedBox(height: 12.w),
                              ),
                              Visibility(
                                visible: controller.isActivityEntry,
                                child: _buildInviteTies(controller),
                              ),
                              SizedBox(height: 12.w),
                              _buildListTies(controller),
                            ],
                          ),
                        ),
                        SizedBox(height: 33.w),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildIconList() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.BET_HISTORY);
          },
          child: Column(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border: Border.all(color: const Color(0xff2D3035), width: 1.w),
                  color: const Color(0xFF17181B),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pkObImage(
                      Assets.images.icon.myHomeOrder.path,
                      width: 28.w,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 14.h),
              Container(
                constraints: BoxConstraints(maxWidth: 56.w),
                child: Text(
                  "bet_history_title".tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Get.locale!.languageCode=="en"?10:12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: (1.sw - 300.w) / 3),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.LEDGER_RECORD);
          },
          child: Column(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xff2D3035), width: 1.w),
                  color: const Color(0xFF17181B),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pkObImage(
                      Assets.images.icon.myHomeAccess.path,
                      width: 28.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.w,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 56.w),
                child: Text(
                  "ledger_detail_quota_record".tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Get.locale!.languageCode=="en"?10:12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: (1.sw - 300.w) / 3),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.ACCESS_RECORD);
          },
          child: Column(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xff2D3035), width: 1.w),
                  color: const Color(0xFF17181B),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pkObImage(
                      Assets.images.icon.myHomeDeal.path,
                      width: 28.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.w,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 56.w),
                child: Text(
                  "mine_deposit_and_withdrawal_records".tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Get.locale!.languageCode=="en"?10:12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(width: (1.sw - 300.w) / 3),
        GestureDetector(
          onTap: () {
            Get.toNamed(AppRoutes.ACCOUNT);
          },
          child: Column(
            children: [
              Container(
                width: 56.w,
                height: 56.w,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: const Color(0xff2D3035), width: 1.w),
                  color: const Color(0xFF17181B),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pkObImage(
                      Assets.images.icon.myHomeAccount.path,
                      width: 28.w,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 14.w,
              ),
              Container(
                constraints: BoxConstraints(maxWidth: 56.w),
                child: Text(
                  "my_account".tr,
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: Get.locale!.languageCode=="en"?10:12,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  //邀请活动入口
  Widget _buildInviteTies(MineNewController controller) {
    if (!controller.disabledAnimate) {
      return AnimationLimiter(
        child: Column(
          children: [
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 450),
              delay: const Duration(milliseconds: 40),
              child: SlideAnimation(
                verticalOffset: 20.0,
                curve: Curves.easeInOutBack,
                child: GestureDetector(
                  onTap: controller.jumpToInviteActivity,
                  child: ObImage.asset(Assets.images.bg.bannerYqhy.path),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return GestureDetector(
      onTap: controller.jumpToInviteActivity,
      child: ObImage.asset(Assets.images.bg.bannerYqhy.path),
    );
  }

  Widget _buildListTies(MineNewController controller) {
    if (!controller.disabledAnimate) {
      return Container(
        decoration: BoxDecoration(
          color: const Color(0xff24262B),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: AnimationLimiter(
          child: Column(
            children: [
              for (int i = 0; i < controller.listTies.length; i++)
                AnimationConfiguration.staggeredList(
                  position: i,
                  duration: const Duration(milliseconds: 450),
                  delay: const Duration(milliseconds: 40),
                  child: SlideAnimation(
                    verticalOffset: 20.0,
                    curve: Curves.easeInOutBack,
                    child: _buildMineListTile(i, controller),
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return Container(
      decoration: BoxDecoration(
        //color: Color(0xff1E262D),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          for (int i = 0; i < controller.listTies.length; i++)
            _buildMineListTile(i, controller)
        ],
      ),
    );
  }

  Widget _buildMineListTile(int i, MineNewController controller) {
    bool? isEdgeEffect;
    BorderRadiusGeometry? bgRadiusGeometry;

    if (i == 3) {
      if (kIsWeb) {
        return const SizedBox();
      }
      return Obx(
        () => MineNewListTile(
          newMark: Visibility(
            visible: controller.versioNewMark.value,
            child: Container(
              margin: EdgeInsets.only(right: 10.w),
              alignment: const Alignment(0, 0),
              height: 20.w,
              width: 36.w,
              decoration: BoxDecoration(
                color: ColorName.green,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Text(
                'NEW',
                style: TextStyle(
                  color: ColorName.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
          description: 'setting_current_version'.tr + 'V${controller.version}',
          isEdgeEffect: isEdgeEffect,
          padding: EdgeInsets.only(
            top: i == 3 ? 4.w : 0,
            bottom: 4.w,
          ),
          margin: EdgeInsets.only(top: i >= 3 ? 10.w : 0),
          borderRadius: bgRadiusGeometry,
          iconAssetUrl: controller.listTies[i]['icon'],
          title: controller.listTies[i]['title'].toString().tr,
          onPress: controller.listTies[i]['onPress'],
          hasRight: i !=4,
        ),
      );
    }
    if (i == 0) {
      return Obx(
        () => MineNewListTile(
          description: controller.currentLan.value,
          isEdgeEffect: isEdgeEffect,
          padding: EdgeInsets.only(
            top: i == 3 ? 4.w : 0,
            bottom: 4.w,
          ),
          margin: EdgeInsets.only(top: i >= 3 ? 10.w : 0),
          borderRadius: bgRadiusGeometry,
          iconAssetUrl: controller.listTies[i]['icon'],
          title: controller.listTies[i]['title'].toString().tr,
          onPress: controller.listTies[i]['onPress'],
          hasRight: i !=4,
        ),
      );
    }
    return MineNewListTile(
      description: '',
      isEdgeEffect: isEdgeEffect,
      padding: EdgeInsets.only(
        top: i == 0 || i == 5 ? 4.w : 0,
        bottom: i == 3 || (kIsWeb ? i == 6 : i == 7) ? 4.w : 0,
      ),
      margin: EdgeInsets.only(top: i >= 3 ? 10.w : 0),
      borderRadius: bgRadiusGeometry,
      iconAssetUrl: controller.listTies[i]['icon'],
      title: controller.listTies[i]['title'].toString().tr,
      onPress: i == 4 ? controller.logout : controller.listTies[i]['onPress'],
      hasRight: i !=4,
    );
  }

  BorderRadiusGeometry? _bgRadiusGeometry(BorderRadiusType radiusType) {
    switch (radiusType) {
      case BorderRadiusType.AboveLeftandRight:
        return BorderRadius.only(
          topLeft: Radius.circular(8.w),
          topRight: Radius.circular(8.w),
        );
      case BorderRadiusType.BelowLeftandRight:
        return BorderRadius.only(
          bottomLeft: Radius.circular(8.w),
          bottomRight: Radius.circular(8.w),
        );
      default:
        return BorderRadius.zero;
    }
  }

  ///设置
  Widget _buildSetting() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            PublicResources.jumpToMemberServicePage();
          },
          child: pkObImage(
            Assets.images.mineKf.path,
            width: 24.w,
            height: 24.w,
          ),
        ),
        SizedBox(
          width: 16.w,
        ),
      ],
    );
  }

  ///头像
  Widget _buildAvatarBar(MineNewController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => controller.jumpToUserProfile(),
            child: Avatar(
              backgroundColor: Colors.white,
              radius: 32.w,
              child: Obx(
                () => Avatar(
                  radius: 30.w,
                  child: controller.isAvatarHttpUrl
                      ? ClipRRect(
                          borderRadius: BorderRadius.circular(30.w),
                          child: ObImage.network(
                            controller.userAvatarUrl,
                            fit: BoxFit.fill,
                            loadingBuilder: (
                              BuildContext context,
                              Widget child,
                              ImageChunkEvent? loadingProgress,
                            ) {
                              if (loadingProgress == null) return child;
                              return ObImage.asset(
                                Assets.images.avatar.squareNormal.path,
                                width: 60.w,
                                package: BaseX.pkg,
                              );
                            },
                          ),
                        )
                      : ClipRRect(
                          borderRadius: BorderRadius.circular(30.w),
                          child: ObImage.asset(controller.userAvatarUrl),
                        ),
                  backgroundColor: ColorName.colorBackground,
                ),
              ),
            ),
          ),
          SizedBox(width: 14.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () => controller.jumpToUserProfile(),
                  child: Row(
                    children: [
                      Text(
                        controller.userName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Container(
                        alignment: Alignment.center,
                        constraints: BoxConstraints(
                          minWidth: 40.w,
                        ),
                        height: 20,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        child: Text(
                          'edit'.tr,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.white.withOpacity(0.6),
                          ),
                        ),
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.white.withOpacity(0.2),
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white.withOpacity(0.04),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 8.w),
                GestureDetector(
                  onTap: () {
                    controller.homePageController.onTap(2);
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "account_balance".tr,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                        textHeightBehavior: const TextHeightBehavior(
                          applyHeightToFirstAscent: false,
                          applyHeightToLastDescent: false,
                        ),
                        strutStyle: const StrutStyle(
                          fontSize: 12,
                          forceStrutHeight: true,
                        ),
                      ),
                      SizedBox(width: 4.w),
                      Obx(
                        () => !controller.homePageController.obscureAmount
                            ? Align(
                                alignment: const Alignment(0, 0.9),
                                child: Text(
                                  "*****",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Get.theme.colorScheme.primary,
                                  ),
                                ),
                              )
                            : Text(
                                "${'symbol'.tr}${BalanceManager.formatTotalBalance}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: FontFamily.gothamMedium,
                                  package: BaseX.pkg2,
                                  height: kIsWeb ? 1.1 : 1,
                                  fontSize: 16,
                                  color: Get.theme.colorScheme.primary,
                                ),
                                textHeightBehavior: const TextHeightBehavior(
                                  applyHeightToFirstAscent: false,
                                  applyHeightToLastDescent: false,
                                ),
                                strutStyle: const StrutStyle(
                                  fontSize: 16,
                                  forceStrutHeight: true,
                                ),
                              ),
                      ),
                      SizedBox(width: 4.w),
                      ObImage.asset(
                        Assets.images.icon.homeMoreRight.path,
                        width: 16.w,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

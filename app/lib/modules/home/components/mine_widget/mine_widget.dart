import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/home/components/mine_widget/components/mine_title.dart';
import 'package:ob_package/modules/home/components/mine_widget/components/mine_wallet.dart';
import 'package:ob_package/modules/home/components/mine_widget/mine_list_tile.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import '../message_badge.dart';
import 'mine_controller.dart';

class MineWidget extends StatelessWidget {
  const MineWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(Get.find()),
      builder: (controller) => Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Get.theme.backgroundColor,
        body: Column(
          children: [
            ///DownloadTip(),
            Expanded(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    controller: controller.scrollController,
                    physics: GetPlatform.isAndroid
                        ? ClampingScrollPhysics()
                        : BouncingScrollPhysics(),
                    child: Obx(
                      () => Stack(
                        children: [
                          // if (!controller.disabledAnimate)
                          //   AnimationLimiter(
                          //     child: AnimationConfiguration.synchronized(
                          //       duration: Duration(milliseconds: 300),
                          //       child: ScaleAnimation(
                          //         scale: 1.4,
                          //         child: ObImage.asset(
                          //           Assets.images.bg.myHomeTop.path,
                          //           fit: BoxFit.cover,
                          //         ),
                          //       ),
                          //     ),
                          //   )
                          // else
                          ObImage.asset(
                            Assets.images.bg.myHomeTop.path,
                            fit: BoxFit.cover,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                  height: MediaQuery.of(context).padding.top.w),
                              if (!controller.disabledAnimate)
                                AnimationLimiter(
                                  child: AnimationConfiguration.synchronized(
                                    duration: Duration(milliseconds: 300),
                                    child: FadeInAnimation(
                                      delay: Duration(milliseconds: 100),
                                      child: _buildSetting(),
                                    ),
                                  ),
                                )
                              else
                                _buildSetting(),
                              SizedBox(height: 25.w),
                              if (!controller.disabledAnimate)
                                AnimationLimiter(
                                  child: AnimationConfiguration.synchronized(
                                    duration: Duration(milliseconds: 300),
                                    child: SlideAnimation(
                                      verticalOffset: -10.0,
                                      curve: Curves.decelerate,
                                      child: _buildAvatarBar(controller),
                                    ),
                                  ),
                                )
                              else
                                _buildAvatarBar(controller),
                              SizedBox(height: 12.w),
                              if (!controller.disabledAnimate)
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: AnimationLimiter(
                                    child: Column(
                                      children: AnimationConfiguration
                                          .toStaggeredList(
                                        duration: Duration(milliseconds: 300),
                                        delay: Duration(milliseconds: 40),
                                        childAnimationBuilder: (Widget child) {
                                          return SlideAnimation(
                                            verticalOffset: 20.0,
                                            curve: Curves.easeInOutBack,
                                            child: child,
                                          );
                                        },
                                        children: [
                                          MineWallet(),
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
                                  ),
                                )
                              else
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 16.w),
                                  child: Column(
                                    children: [
                                      MineWallet(),
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
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isShowToolbar.value,
                      child: MineTitle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //邀请活动入口
  Widget _buildInviteTies(MineController controller) {
    if (!controller.disabledAnimate)
      return AnimationLimiter(
        child: Column(
          children: [
            AnimationConfiguration.staggeredList(
              position: 0,
              duration: const Duration(milliseconds: 450),
              delay: Duration(milliseconds: 40),
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
    return GestureDetector(
      onTap: controller.jumpToInviteActivity,
      child: ObImage.asset(Assets.images.bg.bannerYqhy.path),
    );
  }

  Widget _buildListTies(MineController controller) {
    if (!controller.disabledAnimate)
      return Container(
        decoration: BoxDecoration(
          color: Color(0xff1E262D),
          borderRadius: BorderRadius.circular(8.w),
        ),
        child: AnimationLimiter(
          child: Column(
            children: [
              for (int i = 0; i < controller.listTies.length; i++)
                AnimationConfiguration.staggeredList(
                  position: i,
                  duration: const Duration(milliseconds: 450),
                  delay: Duration(milliseconds: 40),
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
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1E262D),
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

  Widget _buildMineListTile(int i, MineController controller) {
    bool? isEdgeEffect;
    BorderRadiusGeometry? bgRadiusGeometry;
    if (i == 0 || i == 5) {
      isEdgeEffect = true;
      bgRadiusGeometry = _bgRadiusGeometry(BorderRadiusType.AboveLeftandRight);
    } else if (i == 3 || (kIsWeb ? i == 6 : i == 7)) {
      isEdgeEffect = false;
      bgRadiusGeometry = _bgRadiusGeometry(BorderRadiusType.BelowLeftandRight);
    }

    if (i == 4) {
      return Obx(
        () => MineListTile(
          isEdgeEffect: isEdgeEffect,
          padding: EdgeInsets.only(
            top: i == 0 || i == 5 ? 4.w : 0,
            bottom: i == 3 || (kIsWeb ? i == 6 : i == 7) ? 4.w : 0,
          ),
          borderRadius: bgRadiusGeometry,
          iconAssetUrl: controller.listTies[i]['icon'],
          title: controller.isAgent.value
              ? 'agent_center'.tr
              : 'apply_to_be_agent'.tr,
          onPress: controller.listTies[i]['onPress'],
        ),
      );
    }
    return MineListTile(
      isEdgeEffect: isEdgeEffect,
      padding: EdgeInsets.only(
        top: i == 0 || i == 5 ? 4.w : 0,
        bottom: i == 3 || (kIsWeb ? i == 6 : i == 7) ? 4.w : 0,
      ),
      borderRadius: bgRadiusGeometry,
      iconAssetUrl: controller.listTies[i]['icon'],
      title: controller.listTies[i]['title'].toString().tr,
      onPress: controller.listTies[i]['onPress'],
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
    return SizedBox(
      height: 49.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          AnimatedGestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => Get.toNamed(AppRoutes.SETTING),
            child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(
                left: 12.w,
                top: 12.w,
                bottom: 12.w,
                right: 6.w,
              ),
              child: ObImage.asset(
                Assets.images.icon.myHomeSet.path,
                width: 24.w,
              ),
            ),
          ),
          Container(
            width: 48.w,
            height: 48.w,
            child: MessageBadge(),
          )
        ],
      ),
    );
  }

  ///头像
  Widget _buildAvatarBar(MineController controller) {
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
                        "Hi~," + controller.userName,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Get.theme.colorScheme.primary,
                        ),
                      ),
                      SizedBox(width: 12),
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
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Color(0xFFFFFFFF)),
                    ),
                  ),
                ),
                SizedBox(height: 8.w),
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: () => Get.toNamed(AppRoutes.VIP_LEVEL),
                  child: Row(
                    children: [
                      Container(
                        constraints: BoxConstraints(minWidth: 62.w),
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(left: 4, right: 8),
                        height: 18.w,
                        decoration: ShapeDecoration(
                          color: Get.theme.colorScheme.primary.withOpacity(.8),
                          shape: StadiumBorder(),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                  style: controller.vipLabel.startsWith(r'\w')
                                      ? TextStyle(
                                          fontSize: 14,
                                          fontFamily: FontFamily.dINMedium,
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
                      Spacer(),
                      Text.rich(
                        TextSpan(
                          children: [
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Padding(
                                padding: EdgeInsets.only(
                                  right: LocaleUtils.isLocale ? 15.w : 8.w,
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
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

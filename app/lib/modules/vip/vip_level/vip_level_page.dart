import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart' hide TabBarView;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_user.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';

class VipLevelPage extends GetView<VipLevelController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        body: NestedScrollView(
          controller: controller.scrollController,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: Obx(
                  () => SliverAppBar(
                    leading: ObBackButton(),
                    title: controller.visible.value
                        ? ObNavigationBarTitle(
                            'vip_title_user_center'.tr,
                          )
                        : SizedBox.shrink(),
                    pinned: true,
                    stretch: true,
                    centerTitle: true,
                    expandedHeight: MediaQuery.of(context).padding.top +
                        kToolbarHeight +
                        312.w,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Column(
                        children: [
                          VipLeveUser(controller),
                          SizedBox(
                            height: 16.w,
                          ),
                          Container(
                            height: 8.w,
                            color: ColorName.colorSplitWhite10,
                          ),
                        ],
                      ),
                    ),
                    actions: [
                      GestureDetector(
                        onTap: () {
                          if (controller.routeArguments["listIn"] != null &&
                              controller.routeArguments["listRebate"] != null) {
                            Get.toNamed(
                              AppRoutes.VIP_LEVEL_DETAIL,
                              arguments: controller.routeArguments,
                            );
                          }
                        },
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          child: Text(
                            'vip_rule'.tr,
                            style: TextStyle(
                              fontSize: 14,
                              height: 1,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ),
                      )
                    ],
                    bottom: PreferredSize(
                      preferredSize: Size.fromHeight(44.w),
                      child: Obx(
                        () => Column(
                          children: [
                            if (kIsWeb)
                              SizedBox(
                                height: 16.w,
                              ),
                            if (kIsWeb)
                              Container(
                                height: 8.w,
                                color: ColorName.colorSplitWhite10,
                              ),
                            Container(
                              color: ColorName.colorBackground,
                              height: 44.w,
                              child: ObTabBar(
                                indicator: RoundUnderlineTabIndicator(
                                  borderSide: BorderSide(
                                    width: 3,
                                    color: Colors.green,
                                  ),
                                  width: 20.0,
                                  widthEqualTitle: false,
                                ),
                                indicatorWeight: 3.w,
                                controller: controller.tabController,
                                labelPadding:
                                    EdgeInsets.only(left: 16.w, right: 16.w),
                                isScrollable: true,
                                labelStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.dINMedium,
                                  package: BaseX.pkg2,
                                  fontWeight: FontWeight.w500,
                                ),
                                unselectedLabelStyle: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontFamily.dINMedium,
                                  package: BaseX.pkg2,
                                  fontWeight: FontWeight.w500,
                                ),
                                labelColor: Colors.green,
                                unselectedLabelColor:
                                    Color(0xFFFFFFFF).withOpacity(0.6),
                                tabs: controller.tabBarTitle.toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ];
          },
          body: Obx(
            () => (controller.firstLoad.value == true &&
                    controller.tabBarViews.isEmpty)
                ? PlaceholderLoading(
                    alignment: Alignment.topCenter,
                  )
                : TabBarView(
                    controller: controller.tabController,
                    children: controller.tabBarViews.value.toList(),
                  ),
          ),
        ),
      ),
    );
  }
}

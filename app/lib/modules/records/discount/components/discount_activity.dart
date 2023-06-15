import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/discount/discount_activity_controller.dart';
import 'package:ob_component/ob_component.dart';

class DiscountActivity extends StatefulWidget {
  const DiscountActivity({Key? key}) : super(key: key);

  @override
  _DiscountActivityState createState() => _DiscountActivityState();
}

class _DiscountActivityState extends State<DiscountActivity>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<DiscountActivityController>(
      init: DiscountActivityController(),
      builder: (controller) {
        if (controller.enabledSkeleton) {
          return SkeletonCreator(
            future: controller.discountDiscountActivityPostFuture,
            origin: _buildOrigin(controller),
            skeleton: _buildSkeleton(),
          );
        }
        return _buildOrigin(controller);
      },
    );
  }

  Widget _buildOrigin(DiscountActivityController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTabBar(controller),
        Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
        Expanded(
          child: Obx(
                () =>
                PageView(
                  onPageChanged: (index) {
                    controller.onPageChange(index);
                  },
                  controller: controller.pageController,
                  children: controller.tabBarViews.toList(),
                ),
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }

  Widget _buildSkeleton() {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          Container(
            height: 48.w,
            padding: EdgeInsets.only(left: 16.w),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  for (int i = 0; i < 2; i++)
                    Container(
                      margin: EdgeInsets.only(right: 12.w),
                      child: ObImage.asset(
                        Assets.skeleton.tab.path,
                        height: 28.w,
                      ),
                    ),
                ],
              ),
            ),
          ),
          Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
          ListView(
            shrinkWrap: true,
            children: [
              for (int i = 0; i < 4; i++)
                Card(
                  margin: EdgeInsets.only(left: 15.w, right: 15.w, top: 16.w),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8.w)),
                  ),
                  color: Colors.white.withOpacity(0.04),
                  clipBehavior: Clip.hardEdge,
                  child: AspectRatio(
                    aspectRatio: 750 / 320,
                    child: ObImage.asset(
                      Assets.skeleton.discount.path,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTabBar(DiscountActivityController controller) {
    return Container(
      height: 44.w,
      padding: EdgeInsets.only(left: 15.w),
      child: Obx(() {
        return ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: [
            for (int i = 0; i < controller.tabBarTitle.length; i++)
              GestureDetector(
                onTap: () => controller.onTabBarTap(i),
                child: Obx(
                      () =>
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 12.w),
                        margin: EdgeInsets.only(
                            right: 12.w, top: 8.w, bottom: 8.w),
                        height: 44.w,
                        alignment: Alignment.center,
                        child: Text(
                          controller
                              .tabBarTitle[i],
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: controller.currentIndex.value == i
                                ? Color(0xff3BC117)
                                : Get.theme.colorScheme.primary.withOpacity(
                                0.6),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: Get.theme.colorScheme.primary.withOpacity(
                              0.04),
                          borderRadius: BorderRadius.circular(16.w),
                          border: Border.all(
                              width: 1.w,
                              color: controller.currentIndex.value == i
                                  ? Color(0xff3BC117)
                                  : Colors.transparent),
                        ),
                      ),
                ),
              ),
          ],
        );
      }),
    );
  }
}

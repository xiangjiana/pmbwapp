import 'package:flutter/material.dart' hide TabBarView;
import 'package:get/get.dart';
import 'package:ob_package/modules/records/discount/discount_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class Promotion extends StatelessWidget {
  const Promotion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PromotionController>(
      init: PromotionController(),
      builder: (controller) {
        return ObTheme(
          child: Scaffold(
            backgroundColor: const Color(0xff151E25),
            body: Obx(
              () => SafeArea(
                child: Column(
                  children: [
                    ///DownloadTip(),
                    ObTabBar(
                      controller: controller.tabController,
                      labelPadding: EdgeInsets.symmetric(horizontal: 14.w),
                      isScrollable: true,
                      labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      unselectedLabelStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white60,
                      indicatorPadding: EdgeInsets.only(bottom: 6.w),
                      indicator: TabFixedSizedIndicator(
                        Size(20.w, 3.w),
                        const Color(0xff3BC117),
                        radius: Radius.circular(3.w),
                      ),
                      tabs: controller.tabBarTitle.value,
                    ),
                    Expanded(
                      child: TabBarView(
                        controller: controller.tabController,
                        children: controller.tabBarViews.value,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

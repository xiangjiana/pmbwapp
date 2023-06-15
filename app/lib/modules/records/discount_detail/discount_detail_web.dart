import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/discount_detail/discount_detail_web_controller.dart';

class DiscountDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscountDetailWebController>(
      init: DiscountDetailWebController(Get.find()),
      builder: (controller) => ObTheme(
        child: Scaffold(
          appBar: AppBar(
            title: ObNavigationBarTitle(controller.title),
            leading: ObBackButton(),
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: controller.showPoster,
                child: Container(
                  width: 48.w,
                  height: 49.w,
                  alignment: Alignment.center,
                  child: ObImage.asset(
                    Assets.images.icon.homeShare.path,
                    width: 24,
                    height: 24,
                  ),
                ),
              ),
            ],
          ),
          body: HtmlElementView(viewType: controller.viewId),
        ),
      ),
    );
  }
}

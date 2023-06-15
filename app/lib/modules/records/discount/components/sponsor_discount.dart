import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/records/discount/repository/discount.dart';
import 'package:ob_package/modules/records/discount/sponsor_discount_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class SponsorDiscount extends StatefulWidget {
  const SponsorDiscount({Key? key}) : super(key: key);

  @override
  _SponsorDiscountState createState() => _SponsorDiscountState();
}

class _SponsorDiscountState extends State<SponsorDiscount> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return GetBuilder<SponsorDiscountController>(
      init: SponsorDiscountController(),
      builder: (controller) {
        return Obx(
          () => SmartRefresher(
            enablePullUp: true,
            controller: controller.refreshController,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: _buildDiscountTiles(controller),
          ),
        );
      },
    );
  }

  Widget _buildDiscountTiles(SponsorDiscountController controller) {
    if (controller.dataSource == null) {
      return PlaceholderLoading(margin: EdgeInsets.zero);
    }
    if (controller.dataSource!.isEmpty) {
      return EmptyView();
    }
    if (Store.isActivityManualRefresh) {
      return AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: GetPlatform.isAndroid ? ClampingScrollPhysics() : BouncingScrollPhysics(),
          itemCount: controller.dataSource!.length,
          itemBuilder: (ctx, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              delay: Duration(milliseconds: 60),
              child: SlideAnimation(
                verticalOffset: 20.0,
                curve: Curves.easeInOutBack,
                child: AnimatedGestureDetector(
                  onTap: () => navigateDetail(controller.dataSource![index]),
                  child: Container(),
                ),
              ),
            );
          },
        ),
      );
    }
    return ListView.builder(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: GetPlatform.isAndroid ? ClampingScrollPhysics() : BouncingScrollPhysics(),
      itemCount: controller.dataSource!.length,
      itemBuilder: (ctx, index) {
        return AnimatedGestureDetector(
          onTap: () => navigateDetail(controller.dataSource![index]),
          child: Container(),
        );
      },
    );
  }

  void navigateDetail(ActivityConfig discount) {
    if ((discount.activityStatus ?? 0) >= 4) {
      return;
    }
    if (GetPlatform.isWeb) {
      WebUtil.jumpToOffice();
    } else {
      Get.toNamed(AppRoutes.DISCOUNT_DETAIL, arguments: discount);
    }
  }
}

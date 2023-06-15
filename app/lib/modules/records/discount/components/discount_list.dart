import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/records/discount/components/discount_tile.dart';
import 'package:ob_package/modules/records/discount/discount_activity_controller.dart';
import 'package:ob_package/utils/tool_kit.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountList extends StatefulWidget {
  final List<ActivityConfig> dataSource;

  const DiscountList(this.dataSource, {Key? key}) : super(key: key);

  @override
  _DiscountListState createState() => _DiscountListState();
}

class _DiscountListState extends State<DiscountList> {
  final RefreshController refreshController = RefreshController();
  final DiscountActivityController controller =
      Get.find<DiscountActivityController>();

  @override
  void dispose() {
    refreshController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
      enablePullUp: true,
      controller: refreshController,
      onRefresh: () => controller.onRefresh(refreshController),
      onLoading: () => controller.onLoading(refreshController),
      child: _buildDiscountTiles(),
    );
  }

  Widget _buildDiscountTiles() {
    final dataSource = widget.dataSource;
    if (dataSource.isEmpty) {
      return EmptyView();
    }
    if (Store.isActivityManualRefresh) {
      return AnimationLimiter(
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: GetPlatform.isAndroid
              ? ClampingScrollPhysics()
              : BouncingScrollPhysics(),
          itemCount: dataSource.length,
          itemBuilder: (ctx, index) {
            return AnimationConfiguration.staggeredList(
              position: index,
              duration: const Duration(milliseconds: 300),
              delay: Duration(milliseconds: 60),
              child: SlideAnimation(
                verticalOffset: 20.0,
                curve: Curves.easeInOutBack,
                child: AnimatedGestureDetector(
                  onTap: () => navigateDetail(dataSource[index]),
                  child: DiscountTile(discount: dataSource[index]),
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
      physics: GetPlatform.isAndroid
          ? ClampingScrollPhysics()
          : BouncingScrollPhysics(),
      itemCount: dataSource.length,
      itemBuilder: (ctx, index) {
        return AnimatedGestureDetector(
          onTap: () => navigateDetail(dataSource[index]),
          child: DiscountTile(discount: dataSource[index]),
        );
      },
    );
  }

  void navigateDetail(ActivityConfig discount) {
    if ((discount.activityStatus) >= 4) {
      return;
    }
    if (GetPlatform.isWeb) {
      Get.toNamed(
        AppRoutes.DISCOUNT_DETAIL,
        arguments: discount,
        parameters: {
          "url": ToolKit.instance.addSignatureForActivityUrl(
            link: discount.pageRouteAddr ,
            type: DiscountEnum.discount,
            id: discount.id,
          ),
          'title': discount.title ,
        },
      );
    } else {
      Get.toNamed(AppRoutes.DISCOUNT_DETAIL, arguments: discount);
    }
  }
}

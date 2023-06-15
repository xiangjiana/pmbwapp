import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/deposit_way_tile.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/component/dicount_amount_text.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/deposit_views.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'deposit_easy_controller.dart';

class DepositEasyPage extends StatelessWidget {
  final logic = Get.find<DepositEasyController>();
  final state = Get.find<DepositEasyController>().state;
  final Widget? topWidget;
  final bool needAppbar;
  final GestureTapCallback? serviceTap;
  final GestureTapCallback? refresh;
  final Color? titleColor;
  final int chargeType;

  DepositEasyPage({
    Key? key,
    this.topWidget,
    this.needAppbar = true,
    this.chargeType = 0,
    this.serviceTap,
    this.titleColor,
    this.refresh,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DepositEasyController>(
      builder: (controller) {
        controller.chargeType = chargeType;
        if (chargeType > 0) return _body(context, controller);
        return KeyboardMediaQuery(
          child: _body(context, controller),
        );
      },
    );
  }

  Widget _body(BuildContext context, DepositEasyController controller) {
    return ObTheme(
      child: Scaffold(
        appBar: needAppbar
            ? AppBar(
                title: ObNavigationBarTitle('deposit_label'.tr),
                leading: ObBackButton(),
                // actions: [_buildAppBarAction()],
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(8.w),
                  child: Divider(
                    height: 8.w,
                    thickness: 8.w,
                    color: const Color(0xff0E1519),
                  ),
                ),
              )
            : null,
        body: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: Obx(
                    () => SmartRefresher(
                      scrollController: controller.state.scrollController,
                      controller: controller.state.refreshController,
                      onRefresh: () async {
                        if (refresh != null) {
                          refresh!();
                        }
                        controller.onRefresh();
                      },
                      enablePullDown: true,
                      child: SingleChildScrollView(
                        child: controller.payTypes != null &&
                                controller.payTypes!.isEmpty
                            ? const DepositEmptyView()
                            : _buildNormalView(context, controller, serviceTap),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Positioned(
                top: 74.w,
                right: 0,
                child: Obx(() {
                  return controller.selectedPayType != null &&
                          controller.selectedPayType!.id == "2160"
                      ? _buildCustomerService()
                      : const SizedBox();
                }))
          ],
        ),
      ),
    );
  }

  _buildCustomerService() {
    return Container(
      margin: EdgeInsets.only(top: 1.sh / 3),
      child: InkWell(
        onTap: () {
          if (serviceTap != null) {
            serviceTap!();
          } else {
            PublicResources.jumpToMemberServicePage();
          }
        },
        child: Container(
          width: 40.w,
          padding: EdgeInsets.only(
            top: 17.w,
            bottom: GetPlatform.isWeb ? 5.w : 15.w,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(45),
            color: ColorName.colorMain.withOpacity(0.18),
            border: Border.all(
                color: ColorName.colorMain.withOpacity(0.6), width: 1),
          ),
          child: Column(
            children: [
              pkObImage(
                Assets.images.icon.customerServiceIcon.path,
                width: 30.w,
                height: 30.w,
              ),
              SizedBox(
                height: 8.w,
              ),
              Text(
                "${"service_vertical_text".tr}${GetPlatform.isWeb ? '\n' : ''}",
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNormalView(BuildContext context,
      DepositEasyController controller, GestureTapCallback? serviceTap) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 16.w, right: 16.w),
          child: Column(
            children: [
              topWidget ?? const SizedBox(),
              _buildTopRow(controller, titleColor),
              _buildPayWayTiles(controller),
              SizedBox(height: 12.w),
            ],
          ),
        ),
        Obx(
          () => AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            child: controller.getDepositInput(
              controller,
              controller.selectedPayType,
              serviceTap,
              titleColor,
            ),
          ),
        ),
        SizedBox(height: MediaQuery.of(context).padding.bottom + 30.h),
      ],
    );
  }

  Widget _buildTopRow(DepositEasyController controller, Color? titleColor) {
    return Container(
      constraints: BoxConstraints(minHeight: 48.w),
      child: Row(
        children: [
          Text(
            'deposit_pay_money_mode'.tr,
            style: TextStyle(
              color: titleColor ?? Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
          Expanded(
            child: Obx(
                () => DiscountAmountText(payType: controller.selectedPayType)),
          )
        ],
      ),
    );
  }

  GridView _buildPayWayTiles(DepositEasyController controller) {
    return GridView.count(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 106 / 56,
      mainAxisSpacing: 12.w,
      crossAxisSpacing: 12.w,
      children: _payWayList(controller),
    );
  }

  List<Widget> _payWayList(DepositEasyController controller) {
    if (controller.payTypes == null) return <Widget>[];

    return List.generate(
      controller.payTypes!.length,
      (index) => GestureDetector(
        onTap: () {
          controller.selectPayType(
            controller.payTypes![index],
          );
        },
        child: _item(controller, index),
      ),
    );
  }

  Widget _item(DepositEasyController controller, int index) {
    var data = controller.payTypes![index];
    if (data.isExpand) {
      return ExpandView(data.id == '-1');
    }
    return DepositWayTile(
      payType: data,
      selected: data == controller.selectedPayType,
    );
  }
}

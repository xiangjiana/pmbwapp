import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme,PrimaryButton;
import 'Invite_apply_controller.dart';
import 'components/amount_input.dart';

class InviteApplyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<InviteApplyController>(
      init: InviteApplyController(Get.find()),
      builder: (controller) => ObTheme(
          child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('activity_title'.tr),
          leading: ObBackButton(),
        ),
        body: Container(
          height: 428.w,
          margin: EdgeInsets.all(16.w),
          padding: EdgeInsets.all(16.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.w),
            color: Colors.white.withOpacity(0.04),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              _walletWidget(),
              SizedBox(height: 24.w),
              Align(
                alignment: Alignment.centerLeft,
                child: ObText(
                  'bouns_gift'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorName.white,
                  ),
                ),
              ),
              SizedBox(height: 4.w),
              Align(
                alignment: Alignment.centerLeft,
                child: ObText(
                  'charge_100_gift'.tr,
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 14,
                    color: ColorName.colorTextWhite60,
                  ),
                ),
              ),
              SizedBox(height: 16.w),
              _chooseVenueWidget(controller),
              SizedBox(height: 12.w),
              AmountInput(
                controller: controller.editAmountController,
                onChanged: controller.onAmountChanged,
                maxLimit: controller.maxLimit,
              ),
              SizedBox(height: 24.w),
              Row(
                children: [
                  ObText(
                    'get_gift'.tr,
                    style: TextStyle(
                      color: ColorName.colorTextWhite60,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  ObText(
                    '${'symbol'.tr} 0.00',
                    style: TextStyle(
                      color: ColorName.colorEmbellish,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 8.w),
              Row(
                children: [
                  ObText(
                    'flow_requirements'.tr,
                    style: TextStyle(
                      color: ColorName.colorTextWhite60,
                      fontSize: 14,
                    ),
                  ),
                  Spacer(),
                  ObText(
                    '${'symbol'.tr} 0.00',
                    style: TextStyle(
                      color: ColorName.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.w),
              Container(
                width: double.infinity,
                height: 40.w,
                child: OBasePrimaryButton(
                  size: ButtonSize.large,
                  disabled: true,
                  image: DecorationImage(
                    image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                    fit: BoxFit.fill,
                  ),
                  onPressed: () {},
                  child: Text(
                    "join_now".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              SizedBox(height: 12.w),
              ObText(
                'could_only_join_now_only_once'.tr,
                style: TextStyle(
                  color: ColorName.colorTextWhite60,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }

  ///钱包
  Widget _walletWidget() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(255, 255, 255, 0.05),
            Color.fromRGBO(0, 0, 0, 0.00),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          tileMode: TileMode.decal,
        ),
        border: Border.all(color: Colors.black12, width: 0.5),
        borderRadius: BorderRadius.circular(4.w),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      ObText(
                        "vip_level_trans_content".tr,
                        style: TextStyle(
                          fontSize: 12.w,
                          color: Get.theme.colorScheme.primary.withOpacity(0.6),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(8.w),
                        child: RefreshLottie(
                          width: 16.w,
                          height: 16.h,
                        ),
                      ),
                    ],
                  ),
                  Obx(
                    () => ObText(
                      BalanceManager.formatCenterBalance,
                      style: TextStyle(
                        fontSize: 16.w,
                        color: Get.theme.colorScheme.primary,
                        fontFamily: "Gotham-Medium",
                      ),
                    ),
                  ),
                  SizedBox(height: 12.w),
                ],
              ),
            ),
            Container(
              height: 28.w,
              width: 64.w,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.transparent, width: 0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(14.w),
                    bottomLeft: Radius.circular(14.w),
                  ),
                  // 边色与边宽度
                  // 线性渐变
                  color: ColorName.colorBgGold20),
              child: Text('one_key_recycling'.tr),
            ),
          ],
        ),
      ),
    );
  }

  ///选择场馆
  Widget _chooseVenueWidget(InviteApplyController controller) {
    return Container(
      width: double.infinity,
      height: 48.w,
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.w),
        color: Colors.white.withOpacity(0.04),
      ),
      child: Obx(
        () => Row(
          children: [
            ObText(
              'vip_level_chose_venue'.tr,
              style: TextStyle(
                fontSize: 14,
                color: ColorName.colorTextWhite60,
              ),
            ),
            Spacer(),
            ObText(
              "${controller.selectedVenueName.value}",
              style: TextStyle(
                  height: 1,
                  color: controller.selectedVenueName.value == "please_choose".tr
                      ? Colors.white.withOpacity(0.3)
                      : Colors.white,
                  fontSize: 14),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.w),
              child: Center(
                child: pkObImage(
                  Assets.images.icon.homeMoreDown.path,
                  alignment: Alignment.topCenter,
                  width: 16.w,
                  height: 16.w,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

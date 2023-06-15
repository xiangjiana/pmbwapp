import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/vip/vip_level/component/transfer_dialog.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_activity_table.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_activity_content.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_activity_title.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_card.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_enjoy.dart';
import 'package:ob_package/modules/vip/vip_level/component/vip_level_venue.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class VipLevelWidget extends GetView<VipLevelController> {
  final String level;
  final String userLevel;
  final Grade grade;
  final In rights;
  final Promotion promotion;
  final List<String> venueList;

  VipLevelWidget({
    Key? key,
    required this.level,
    required this.userLevel,
    required this.rights,
    required this.promotion,
    required this.venueList,
    required this.grade,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) => Stack(
        children: [
          CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    SizedBox(height: 16.w),
                    VipLevelCard(
                      controller: controller,
                      level: level,
                      userLevel: userLevel,
                      itemCard: grade,
                    ),
                    SizedBox(height: 24.w),
                    VipLevelEnjoy(listIn: rights),
                    SizedBox(height: 24.w),
                    if (controller.vipPromotionState.value)
                      VipLevelActivityTitle(
                        level: level,
                        listPromotion: promotion,
                        minActivity: controller.minActivity.value,
                      ),
                    SizedBox(height: 24.w),
                    if (controller.vipPromotionState.value)
                      VipLevelActivityContent(listPromotion: promotion),
                    SizedBox(height: 24.w),
                    if (controller.vipPromotionState.value)
                      Container(
                        margin: EdgeInsets.only(left: 16.w, right: 16.w),
                        height: 1.w,
                        color: Colors.white.withOpacity(0.06),
                      ),
                    if (controller.vipPromotionState.value)
                      Obx(
                        () => Visibility(
                          visible: controller.userVipActivityInfo.value
                                      .activityStatus ==
                                  0 &&
                              (controller.selectedLevel.value + 1) ==
                                  int.parse(userLevel),
                          child: VipLevelVenue(
                            venueList: venueList,
                          ),
                        ),
                      ),
                    SizedBox(height: 16.w),
                    if (controller.vipPromotionState.value)
                      Container(
                        padding: EdgeInsets.only(left: 16.w, right: 16.w),
                        child: DefaultTextStyle(
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                          child: Obx(() => _buildSubmitButton()),
                        ),
                      ),
                    SizedBox(height: 16.w),
                    if (controller.vipPromotionState.value)
                      VipLevelActivityTable(),
                    SizedBox(height: 16.w),
                    if (controller.vipPromotionState.value)
                      GestureDetector(
                        onTap: () => Get.toNamed(
                          AppRoutes.VIP_LEVEL_DETAIL,
                          arguments: controller.routeArguments,
                        ),
                        child: Container(
                          padding: EdgeInsets.only(top: 16.w, bottom: 58.w),
                          alignment: Alignment.center,
                          child: Text(
                            "vip_rule_to".tr,
                            style: const TextStyle(
                              height: 1,
                              color: Colors.green,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
          Obx(
            () => Visibility(
              visible: controller.isLoadingStatus.value,
              child: Container(
                color: Colors.black.withOpacity(.10),
                height: double.infinity,
                width: double.infinity,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSubmitButton() {
    final selectedLevel = controller.selectedLevel.value;
    var userVipActivityInfo = controller.userVipActivityInfo.value;
    if (userVipActivityInfo.activityStatus == 0) {
      if (selectedLevel + 1 == int.parse(userLevel)) {
        return Obx(
          () => OBasePrimaryButton(
            block: true,
            size: ButtonSize.large,
            disabled: controller.selectedVenueName.value == "please_choose".tr,
            loadingStatus: controller.isLoadingStatus.value,
            image: DecorationImage(
              image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
              fit: BoxFit.fill,
            ),
            onPressed: () => _showTransferDialog(),
            child: Text("vip_level_submit_active".tr),
          ),
        );
      }
      return OBasePrimaryButton(
        block: true,
        size: ButtonSize.large,
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        ),
        child: Text("vip_level_submit_inactive".tr),
      );
    } else if (userVipActivityInfo.activityStatus == 1) {
      return OBasePrimaryButton(
        block: true,
        disabled: true,
        size: ButtonSize.large,
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        ),
        child: Text("vip_level_submit_going".tr),
      );
    } else if (userVipActivityInfo.activityStatus == 2) {
      return OBasePrimaryButton(
        block: true,
        size: ButtonSize.large,
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        ),
        child: Text("vip_level_submit_already".tr),
      );
    } else {
      return SizedBox.shrink();
    }
  }

  Future<void> _showTransferDialog() async {
    final result = await OBDialogUtil.show(
      TransferDialog(),
      barrierDismissible: false,
    );
    if (result == true) {
      controller.postFirstDepositActivityDeposit(
        controller.curIsVND
            ? (int.parse(controller.textController.text.replaceAll(',', '')) *
                    1000)
                .toString()
            : controller.textController.text.replaceAll(',', ''),
        controller.gameCodeMap[controller.selectedVenueName.value]!,
        int.parse(level),
      );
    }
    controller.textController.clear();
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_component/ob_component.dart';
class VipLevelVenue extends StatelessWidget {
  final List<String> venueList;

  const VipLevelVenue({
    Key? key,
    required this.venueList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<VipLevelController>(
        init: VipLevelController(Get.find(), Get.find()),
        builder: (controller) {
          return GestureDetector(
              onTap: () => _choseVenue(controller),
              child: Container(
                width: 1.sw,
                margin: EdgeInsets.only(top: 16.w),
                padding: EdgeInsets.only(left: 16.w, right: 16.w),
                color: Color(0xFF151E25),
                child: Container(
                    width: 343.w,
                    height: 40.w,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20.w)),
                        color: Colors.white.withOpacity(0.04)),
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 24.w),
                          child: Text(
                            "vip_level_chose_venue".tr,
                            style: TextStyle(
                                height: 1,
                                color: Colors.white.withOpacity(0.6),
                                fontSize: 14),
                          ),
                        ),
                        Expanded(child: Container()),
                        Container(
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(right: 8.w),
                          child: Obx(() => Text(
                                "${controller.selectedVenueName.value}",
                                style: TextStyle(
                                    height: 1,
                                    color: controller.selectedVenueName.value ==
                                            "please_choose".tr
                                        ? Colors.white.withOpacity(0.3)
                                        : Colors.white,
                                    fontSize: 14),
                              )),
                        ),
                        Container(
                          alignment: Alignment.topCenter,
                          margin: EdgeInsets.only(right: 24.w),
                          width: 16.w,
                          height: 16.w,
                          child: ObImage.asset(
                            Assets.images.icon.homeMoreDown.path,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ],
                    )),
              ));
        });
  }

  _choseVenue(controller) {
    Get.bottomSheet(
      ObBottomSheet.list(
        title: 'vip_level_chose_venue'.tr,
        titleFontSize: 14,
        cancelFontSize: 14,
        onCancelListener: Get.back,
        children: [
          Container(
            margin: EdgeInsets.only(
              bottom: !GetPlatform.isWeb?MediaQuery.of(Get.context!).padding.bottom:0
            ),
            height: 350.h,
            child: ListView(
              shrinkWrap: true,
              physics: ClampingScrollPhysics(),
              children: [
                for (int i = 0; i < venueList.length; i++)
                  GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      controller.selectedVenueName.value = venueList[i];
                      Get.back(result: venueList[i]);
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 16.w, right: 16.w),
                          height: 48.w,
                          child: Row(
                            children: [
                              Container(
                                child: Text(
                                  venueList[i],
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.white.withOpacity(0.6),
                                  ),
                                ),
                                //onTap: () => Get.back(),
                              ),
                              Spacer(),
                              if (controller.selectedVenueName.value ==
                                  venueList[i])
                                Container(
                                  child: const Icon(
                                    Icons.check,
                                    color: Colors.green,
                                    size: 24,
                                  ),
                                )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 16.w, right: 16.w),
                          child: Divider(
                            height: 1.w,
                            thickness: 1.w,
                            color:
                            Get.theme.colorScheme.primary.withOpacity(.06),
                          ),
                        ),
                      ],
                    ),
                  )
              ],
            ),
          )
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(16.w),
        ),
      ),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
      clipBehavior: Clip.hardEdge,
    );
  }
}

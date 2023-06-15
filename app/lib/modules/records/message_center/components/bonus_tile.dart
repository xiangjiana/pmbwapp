import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:ob_package/widget/web_gradient_button.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/message_center/bonus_list_controller.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_bonus.dart';
import 'package:ob_component/ob_component.dart';

class BonusTile extends StatelessWidget {
  final UiBonus message;
  final BonusListController controller;

  const BonusTile({Key? key, required this.message, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity:
            message.status == 1 || !controller.showOrHideButton(message.type)
                ? 0.3
                : 1,
        child: Container(
            margin: EdgeInsets.symmetric(horizontal: 8.w),
            width: double.infinity,
            color: Colors.transparent,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(bottom: 6.w),
            child: Stack(
              children: [
                Positioned(
                  top: 50.w,
                  right: 16.w,
                  child: Badge(
                    color: ColorName.colorMain1,
                    dot: message.status == 0,
                    showZero: false,
                    count: message.status == 0 ? 1 : 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: message.status == 0 &&
                          message.mode == Mode.EDITABLE &&
                          controller.showOrHideButton(message.type),
                      child: Container(
                        width: 32.w,
                        height: 100.w,
                        alignment: Alignment.center,
                        color: Colors.transparent,
                        child: IgnorePointer(
                          child: ObRadio(value: message.selected),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 16.w, right: 8.w),
                          child: ObImage.asset(message.iconUrl, width: 48.w),
                        ),
                      ],
                    ),
                    Expanded(
                      child: GestureDetector(
                          onTap: () {
                            if (message.status == 0) {
                              controller.markColletedSingle(message);
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          right: 16.w, top: 16.w),
                                      child: Text(
                                        message.type == 8
                                            ? message.remark + message.title
                                            : message.title,
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Get.theme.colorScheme.primary,
                                          height: 1.1,
                                        ),
                                      ),
                                    ),
                                  ),
                                  WebGradientButton(
                                    width: LocaleUtils.isLocale ? 75.w : 48.w,
                                    height: 24.w,
                                    text: message.status == 1
                                        ? "message_center_received".tr
                                        : (message.status == 0
                                            ? (controller.showOrHideButton(
                                                    message.type)
                                                ? "message_center_receive".tr
                                                : "message_center_received".tr)
                                            : (message.status == 2
                                                ? "rebates_expired".tr
                                                : "")),
                                    margin: EdgeInsets.only(top: 15.w),
                                    textStyle: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                      color: Get.theme.colorScheme.primary,
                                      height: 1.1,
                                    ),
                                    beginColor: message.status == 0
                                        ? controller
                                                .showOrHideButton(message.type)
                                            ? Color(0xffFF9047)
                                            : Colors.white.withOpacity(0.06)
                                        : Colors.white.withOpacity(0.06),
                                    endColor: message.status == 0
                                        ? controller
                                                .showOrHideButton(message.type)
                                            ? Color(0xffFF5722)
                                            : Colors.white.withOpacity(0.06)
                                        : Colors.white.withOpacity(0.06),
                                    onPressed: () {
                                      if (message.status == 0 &&
                                          controller
                                              .showOrHideButton(message.type)) {
                                        controller.markColletedSingle(message);
                                      }
                                    },
                                  ),
                                ],
                              ),
                              Flex(
                                direction: Axis.horizontal,
                                children: [
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(
                                          top: 8.w, bottom: 8.w, right: 30.w),
                                      child: Text(
                                        message.content,
                                        style: TextStyle(
                                          fontSize: 12,
                                          height: 1.1,
                                          color: Color(0x99ffffff),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Flex(direction: Axis.horizontal, children: [
                                Text(
                                  /*message.status == 1 ? message.businessTime :*/
                                  message.createdAt,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    height: 1.1,
                                    fontSize: 10,
                                    color: Color(0x99ffffff),
                                  ),
                                )
                              ])
                            ],
                          )),
                    )
                  ],
                ),
              ],
            )));
  }
}

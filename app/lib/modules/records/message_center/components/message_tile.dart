import 'package:flutter/material.dart' hide Badge;
import 'package:get/get.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/message_list_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_message.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class MessageTile extends StatelessWidget {
  final UiMessage message;
  final MessageListController controller;
  final VoidCallback? onTap;
  const MessageTile(
      {Key? key, required this.message, required this.controller, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100.w,
      child: LivedGestureDetector(
        onTap: onTap,
        child: OverflowBox(
          maxWidth: 407.w,
          child: Transform.translate(
            offset: Offset(message.mode == Mode.EDITABLE ? 16.w : -16.w, 0),
            child: Stack(
              children: [
                Positioned(
                  top: 50.w,
                  right: 16.w,
                  child: Badge(
                    color: ColorName.colorMain1,
                    dot: !message.isRead,
                    showZero: false,
                    count: !message.isRead ? 1 : 0,
                  ),
                ),
                Row(
                  children: [
                    Opacity(
                      opacity: message.mode == Mode.EDITABLE ? 1 : 0,
                      child: Container(
                        width: 32.w,
                        height: 100.w,
                        alignment: Alignment.center,
                        child: IgnorePointer(
                          child: ObRadio(value: message.selected),
                        ),
                      ),
                    ),
                    SizedBox(width: 16.w),
                    SizedBox(
                      width: 343.w,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Opacity(
                                opacity: message.isRead ? 0.3 : 1,
                                child: ObImage.asset(
                                  message.iconUrl,
                                  width: 48.w,
                                ),
                              ),
                              SizedBox(width: 8.w),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 16.w),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: message.isRead ? .3 : 1,
                                        child: Container(
                                          color: Colors.transparent,
                                          width: 262.w,
                                          height: 17.w,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            message.title.trimLeft(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              height: 1.1,
                                              fontSize: 14,
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.w),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Opacity(
                                        opacity: message.isRead ? .3 : 0.6,
                                        child: Container(
                                          color: Colors.transparent,
                                          width: 262.w,
                                          height: 17.w,
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            message.content.trimLeft(),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: TextStyle(
                                              height: 1.1,
                                              fontSize: 12,
                                              color:
                                                  Get.theme.colorScheme.primary,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 8.w),
                                  Opacity(
                                    opacity: message.isRead ? 0.3 : 0.4,
                                    child: Container(
                                      // height: 14.w,
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        message.createdAt,
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: Get.theme.colorScheme.primary,
                                          height: 1.1,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

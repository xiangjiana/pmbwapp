import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/records/message_center/repository/ui_message.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class MessageDetail extends StatelessWidget {
  final UiMessage message;
  final Function? deleteClick;
  final bool flag;

  const MessageDetail(
      {Key? key,
      required this.message,
      required this.deleteClick,
      required this.flag})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('message_info'.tr),
          leading: ObBackButton(),
          actions: [
            Visibility(
              visible: flag,
              child: GestureDetector(
                onTap: () {
                  deleteClick!(message);
                },
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 12.w),
                    child: Text(
                      'message_delete'.tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: Get.theme.colorScheme.primary.withOpacity(0.6),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 16.w),
                    Text(
                      message.title,
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Get.theme.colorScheme.primary),
                    ),
                    SizedBox(height: 8.w),
                    Text(
                      message.createdAt,
                      style: TextStyle(
                        fontSize: 12,
                        color: Get.theme.colorScheme.primary.withOpacity(0.4),
                      ),
                    ),
                    SizedBox(height: 16.w),
                    Divider(),
                    SizedBox(height: 16.w),
                    Text(
                      message.content,
                      softWrap: true,
                      style: TextStyle(
                        fontSize: 14,
                        color: Get.theme.colorScheme.primary.withOpacity(0.6),
                      ),
                    ),
                    SizedBox(height: 16.w),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

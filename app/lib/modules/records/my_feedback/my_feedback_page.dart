import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/settings/feedback/feedback_controller.dart';
import 'package:ob_package/modules/records/my_feedback/components/my_feedback_item.dart';
import 'package:ob_package/modules/records/my_feedback/my_feedback_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyFeedbackPage extends GetView<MyFeedbackController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        backgroundColor: Get.theme.backgroundColor,
        appBar: AppBar(
          title: ObNavigationBarTitle('feedback_my'.tr),
          leading: ObBackButton(),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(8.w),
            child: Divider(
              height: 8.w,
              thickness: 8.w,
              color: Get.theme.scaffoldBackgroundColor,
            ),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              child: Obx(
                () => SmartRefresher(
                  enablePullUp: true,
                  enablePullDown: true,
                  onRefresh: controller.onRefresh,
                  onLoading: controller.onLoading,
                  controller: controller.smartRefreshCtrl,
                  child: (controller.data == null ||
                          controller.data!.record.isEmpty)
                      ? Offstage(
                          offstage: controller.firstRefresh,
                          child: EmptyView(),
                        )
                      : ListView.builder(
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                MyFeedbackItem(
                                  type: problemTypes[controller
                                          .data!.record[index].problemType] ??
                                      "",
                                  desc: controller
                                      .data!.record[index].problemDescribe,
                                  date: controller.data!.record[index].createDt,
                                  imageList:
                                      controller.data!.record[index].url == ""
                                          ? []
                                          : controller.data!.record[index].url
                                              .split(","),
                                ),
                              ],
                            );
                          },
                          itemCount: controller.data!.record.length,
                        ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

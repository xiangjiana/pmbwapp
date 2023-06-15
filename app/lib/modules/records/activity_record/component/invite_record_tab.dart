import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../invite_record_controller.dart';
import 'activity_empty.dart';
import 'invite_tile.dart';

class InviteRecordTab extends GetView<InviteRecordController> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Obx(
          () => SmartRefresher(
            enablePullUp: true,
            controller: controller.smartRefreshCtrl,
            onRefresh: controller.onRefresh,
            onLoading: controller.onLoading,
            child: SingleChildScrollView(
              child: controller.data == null
                  ? controller.systemLoadingFail.value
                      ? ActivityEmpty()
                      : SizedBox()
                  : controller.data!.record.isNotEmpty
                      ? Padding(
                          padding: EdgeInsets.only(
                              top: 12.w, left: 16.w, right: 16.w),
                          child: ListView.separated(
                            padding: EdgeInsets.zero,
                            shrinkWrap: true,
                            physics: ClampingScrollPhysics(),
                            itemCount: controller.data!.record.length,
                            itemBuilder: (ctx, index) {
                              return InviteTile(
                                  uiInviteRecord:
                                      controller.data!.record[index]);
                            },
                            separatorBuilder: (BuildContext context, index) {
                              return SizedBox(height: 16.w);
                            },
                          ),
                        )
                      : ActivityEmpty(),
            ),
          ),
        ),
        Obx(
          () => Offstage(
            offstage: !controller.systemLoadingShow.value,
            child: Container(
              color: ColorName.white.withOpacity(0.0),
              width: 1.sw,
              height: 1.sh,
              child: PlaceholderLoading(
                alignment: Alignment.topCenter,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

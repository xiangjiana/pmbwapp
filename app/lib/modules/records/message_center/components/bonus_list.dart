import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/message_center/bonus_list_controller.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'bonus_tile.dart';
import 'empty_message_list.dart';

class BonusList extends StatefulWidget {
  final MessageCenterMsgRepository repository;
  final String tag;

  const BonusList(this.repository, this.tag, {Key? key}) : super(key: key);

  @override
  _BonusListState createState() => _BonusListState();
}

class _BonusListState extends State<BonusList> with BackTopMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BonusListController>(
      global: false,
      init: BonusListController(widget.repository, widget.tag, context),
      builder: (controller) {
        return Scaffold(
          bottomNavigationBar: Visibility(
            visible: controller.modeCurrent == Mode.EDITABLE,
            child: controller.showBottomSheet(),
          ),
          body: Stack(
            children: [
              Obx(
                () => SmartRefresher(
                    enablePullUp: true,
                    controller: controller.listSmartRefreshCtrl,
                    scrollController: scrollController,
                    onRefresh: controller.onRefresh,
                    onLoading: controller.onLoading,
                    child: SingleChildScrollView(
                      child: controller.data == null
                          ? controller.systemLoadingFail.value
                              ? EmptyMessageList()
                              : SizedBox()
                          : controller.data!.record.isNotEmpty
                              ? ListView.separated(
                                  shrinkWrap: true,
                                  physics: ClampingScrollPhysics(),
                                  itemCount:
                                      controller.data?.record.length ?? 0,
                                  itemBuilder: (ctx, index) {
                                    return GestureDetector(
                                        onTap: () =>
                                            controller.onItemClick(index),
                                        child: BonusTile(
                                          message:
                                              controller.data!.record[index],
                                          controller: controller,
                                        ));
                                  },
                                  separatorBuilder:
                                      (BuildContext context, index) {
                                    return Divider(
                                      height: 1,
                                      indent: 16.w,
                                      color: Color(0xfffffff), // 分隔线颜色
                                    );
                                  })
                              : EmptyMessageList(),
                    )),
              ),
              Obx(() {
                return Offstage(
                  offstage: !controller.systemLoadingShow.value,
                  child: Container(
                    color: ColorName.white.withOpacity(0.0),
                    width: 1.sw,
                    height: 1.sh,
                    child: PlaceholderLoading(
                      alignment: Alignment.topCenter,
                    ),
                  ),
                );
              }),
            ],
          ),
        );
      },
    );
  }
}

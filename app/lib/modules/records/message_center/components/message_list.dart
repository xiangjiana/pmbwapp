import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/message_center/components/empty_message_list.dart';
import 'package:ob_package/modules/records/message_center/components/message_tile.dart';
import 'package:ob_package/modules/records/message_center/member_message_controller.dart';
import 'package:ob_package/modules/records/message_center/message_list_controller.dart';
import 'package:ob_package/modules/records/message_center/repository/message_center_msg_repository.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class MessageList extends StatefulWidget {
  final MessageCenterMsgRepository repository;
  final String msgType, msgIcon, tag;

  const MessageList(this.repository, this.msgType, this.msgIcon, this.tag,
      {Key? key})
      : super(key: key);

  @override
  _MessageListState createState() => _MessageListState();
}

class _MessageListState extends State<MessageList> with BackTopMixin {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MessageListController>(
      global: false,
      init: MessageListController(
        widget.repository,
        widget.msgType,
        widget.msgIcon,
        widget.tag,
        context,
      ),
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
                                padding: EdgeInsets.zero,
                                shrinkWrap: true,
                                physics: ClampingScrollPhysics(),
                                itemCount: controller.data!.record.length,
                                itemBuilder: (ctx, index) {
                                  return MessageTile(
                                    message: controller.data!.record[index],
                                    controller: controller,
                                    onTap: () => controller.onItemClick(index),
                                  );
                                },
                                separatorBuilder:
                                    (BuildContext context, index) {
                                  return Divider(
                                    height: 1,
                                    indent: 16.w,
                                    color: Color(0xfffffff), // 分隔线颜色
                                  );
                                },
                              )
                            : EmptyMessageList(),
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
          ),
        );
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';

import 'package:ob_com_login/src/modules/user/user_toggle/repository/ui_toggle_item_user.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'component/user_toggle_state.dart';
import 'component/user_toggle_tile.dart';
import 'component/user_add_tile.dart';
import 'slidable_controller_sender.dart';
import 'user_toggle_controller.dart';

class UserTogglePage extends GetView<UserToggleController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle("user_toggle_title".tr),
          leading: ObBackButton(),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                controller.changeEditor();
              },
              child: Obx(
                () => Text(
                  controller.isEditor.value
                      ? "message_center_success".tr
                      : "edit".tr,
                  style: TextStyle(
                    color: ColorName.colorTextWhite60,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ],
          bottom: TitleDividerLine(),
        ),
        body: UserToggleState(
          direction: Axis.horizontal,
          child: SingleChildScrollView(
            child: Obx(
              () => Column(
                children: [
                  _buildListView(),
                  Visibility(
                    visible: !controller.isEditor.value,
                    child: UserAddTile(
                      isDisabled: controller.userLists.length < 6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListView() {
    return SlidableAutoCloseBehavior(
      child: SlidablePlayer(
        animation: controller.animaController,
        child: ListView.separated(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: controller.userLists.length,
          itemBuilder: (context, index) {
            final item = controller.userLists[index];
            return _buildItemDetail(context, index, item);
          },
          separatorBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Divider(
                height: 1.w,
                color: Colors.white.withOpacity(0.04),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildItemDetail(
      BuildContext context, int index, UIToggleItemUser item) {
    final direction = UserToggleState.of(context)!.direction;
    return SizedBox(
      width: double.infinity,
      height: 72.w,
      child: Obx(
        () => Slidable(
          key: ValueKey(index),
          groupTag: '0',
          direction: direction,
          child: SlidableControllerSender(
            child: UserToggleTile(
              userTile: item,
              isChangeEditor: controller.isEditor.value,
              onToggleTap: () {
                controller.toggleUser(index);
              },
            ),
          ),
          endActionPane: ActionPane(
            extentRatio: 0.2,
            motion: const BehindMotion(),
            children: [
              SlidableAction(
                onPressed: (context) {
                  controller.removeUser(index);
                },
                backgroundColor: ColorName.colorMain,
                foregroundColor: Colors.white,
                label: 'user_toggle_remove'.tr,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

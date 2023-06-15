import 'package:flutter/material.dart' hide TabBarView,Badge;
import 'package:get/get.dart';
import 'package:ob_package/modules/records/message_center/components/keep_alive_wrapper.dart';
import 'package:ob_package/modules/records/message_center/components/read_only_tabbar.dart';
import 'package:ob_com_base/ob_com_base.dart'
    hide ReadOnlyTabBar, KeepAliveWrapper;
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'member_message_controller.dart';

class MessagePage extends StatelessWidget {
  MessagePage({Key? key}) : super(key: key);

  final MemberMessageController controller =
      Get.find<MemberMessageController>();

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Obx(
        () => Scaffold(
          appBar: AppBar(
            leading: ObBackButton(
              onPressed: () {
                controller.callBack();
                Get.back();
              },
            ),
            title: ObNavigationBarTitle('message_center_title'.tr),
            actions: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: controller.toggleMode,
                child: Container(
                  width: 100.w,
                  margin: EdgeInsets.only(right: 16.w),
                  alignment: Alignment.centerRight,
                  color: Colors.transparent,
                  child: Text(
                    controller.mode == Mode.DISPLAY
                        ? 'message_center_edit'.tr
                        : 'message_center_success'.tr,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.colorScheme.primary.withOpacity(0.6),
                    ),
                  ),
                ),
              ),
            ],
            bottom: ReadOnlyTabBar(
              readOnly: controller.mode == Mode.EDITABLE ? true : false,
              child: ObTabBar(
                controller: controller.tabController,
                isScrollable: true,
                onTap: (index) => controller.onTapTabBar(index),
                indicatorWeight: 2,
                indicatorPadding: EdgeInsets.only(bottom: 2.w),
                tabs: controller.tabWidget
                    .map(
                      (item, {index}) => Tab(
                        child: Badge(
                          count: int.parse(item.numNo!),
                          overflowCount: 99,
                          showZero: item.show!,
                          color: ColorName.colorMain1,
                          style: TextStyle(
                            fontSize: 9,
                            //fontWeight: FontWeight.w500,
                            color: ColorName.white,
                            fontFamily: FontFamily.dINMedium,
                            package: BaseX.pkg2,
                          ),
                          countConstraints: BoxConstraints(
                              minWidth: 18, maxHeight: 14, minHeight: 14),
                          child: Container(
                            margin: EdgeInsets.only(right: 10.w, left: 10.w),
                            child: Text(item.title!,
                                style: TextStyle(fontSize: 14.0)),
                          ),
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
          ),
          body: Column(
            children: [
              Divider(height: 8.w, thickness: 8.w, color: Color(0xff0e1519)),
              Expanded(
                child: TabBarView(
                  controller: controller.tabController,
                  physics: controller.mode == Mode.EDITABLE
                      ? NeverScrollableScrollPhysics()
                      : ClampingScrollPhysics(),
                  children: controller.tabBarViews
                      .map((element) => KeepAliveWrapper(child: element))
                      .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

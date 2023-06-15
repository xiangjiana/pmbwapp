import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/widget/ob_popup.dart';
import 'package:ob_com_base/ob_com_base.dart' hide TabBarView;
import 'package:ob_package/modules/records/activity_record/activity_record_controler.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'component/activity_text.dart';
import 'component/bonus_record_tab.dart';
import 'component/filter_tags.dart';
import 'component/invite_record_tab.dart';

class ActivityRecordPage extends StatelessWidget {
  final tabs = [
    InviteRecordTab(),
    BonusRecordTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ActivityRecordControler>(
      init: ActivityRecordControler(),
      builder: (controller) {
        return ObTheme(
          tabFixedSizedIndicator: TabFixedSizedIndicator(
            Size(24.w, 3.w),
            Colors.white,
            radius: Radius.circular(3.w),
          ),
          child: DefaultTabController(
            length: tabs.length,
            child: Obx(
              () => Scaffold(
                appBar: AppBar(
                  title: Container(
                    margin: EdgeInsets.only(bottom: 5.w),
                    constraints: BoxConstraints(
                      minWidth: 200.w,
                      minHeight: 49.w,
                    ),
                    alignment: Alignment.center,
                    child: ObTabBar(
                      labelColor: Colors.white,
                      labelStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                      unselectedLabelColor: Colors.white.withOpacity(0.6),
                      unselectedLabelStyle: TextStyle(
                        fontSize: 16,
                      ),
                      onTap: controller.changeTabIndex,
                      tabs: [
                        Tab(child: Text('activity_tab_invite'.tr)),
                        Tab(child: Text('activity_tab_bonus'.tr)),
                      ],
                    ),
                  ),
                  leading: ObBackButton(),
                  actions: [
                    _popupWidget(controller),
                  ],
                  bottom: CustomizeSizeWidget(
                    visible: controller.isHintShowOrHide.value &&
                        controller.hintClose,
                    height: controller.isHintShowOrHide.value &&
                            controller.hintClose
                        ? 40.w
                        : 0,
                    child: TitleNotifyHint(
                      backdropColor: controller.isWalletType.value
                          ? ColorName.colorEmbellish.withOpacity(0.06)
                          : ColorName.colorMain.withOpacity(0.10),
                      showType: controller.isWalletType.value
                          ? ShowType.normal
                          : ShowType.hint,
                      txtColor: controller.isWalletType.value
                          ? ColorName.colorEmbellish
                          : ColorName.colorMain,
                      hint: controller.noticeMsg.value,
                      icon: controller.getHintIcon(),
                      onPressed: controller.onJumpPage,
                      onClosePressed: controller.onCloseTitle,
                    ),
                  ),
                ),
                body: TabBarView(
                  physics: NeverScrollableScrollPhysics(),
                  children: tabs,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  ///筛选下拉弹窗
  Widget _popupWidget(ActivityRecordControler controller) {
    return PopupButton(
      offset: Offset(0, 205.w),
      bgBarrier: true,
      buttonBuilder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(right: 16.w),
          child: ObImage.asset(
            Assets.images.icon.comShalou.path,
            width: 24.w,
            height: 24.w,
          ),
        );
      },
      windowBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        return FadeTransition(
          opacity: animation,
          child: SizeTransition(
            sizeFactor: animation,
            child: Obx(
              () => FilterTags(
                controller.uiFilters,
                tagIndex: controller.curTagIndex,
                onTap: controller.changeTagIndex,
              ),
            ),
          ),
        );
      },
    );
  }
}

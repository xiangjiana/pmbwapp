import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/home_modules/home_marquee/marquee_controller.dart';
import 'package:ob_component/ob_component.dart';

import '../../../widget/blur_rect_widget.dart';

class MarqueeComponent extends StatelessWidget {
  MarqueeComponent({Key? key}) : super(key: key);

  final MarqueeController controller = Get.find<MarqueeController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: controller.isMarqueeShow,
        child: Container(
          height: 32.w,
          width: 375.w,
          child:Row(
            children: [
              Padding(
                padding:  EdgeInsets.only(
                  left: 9.w,
                  right: 8.w
                ),
                child: pkObImage(Assets.images.icon.noticeIcon.path,
                    height: 16.w, width: 16.w, fit: BoxFit.fill),
              ),

              // Padding(padding: EdgeInsets.only(
              //   left: 17.w,
              //   right: 8.w
              // ),child: Text("${"message_tab3".tr} ",style: TextStyle(
              //     fontSize: 12,
              //     fontWeight: FontWeight.w400,
              //     color: Color(0xff61C91C)
              // ),),),
              Expanded(
                flex: 258 + 63,
                child: GestureDetector(
                  onTap: () {
                    eventBus.fire(FloatBonusEvent(show: false));
                    Get.toNamed(
                      AppRoutes.MESSAGE,
                      arguments: {"index": 2},
                    )?.then((value) {
                      eventBus.fire(MessageStartEvent());
                    });
                  },
                  child: controller.announcementList.value.isEmpty
                      ? SizedBox()
                      : _buildMarquee(),
                ),
              ),

              Padding(
                padding:  EdgeInsets.only(
                  right: 17.w,
                  left: 8.w
                ),
                child: GestureDetector(
                  onTap: controller.onHandleClose,
                  child: ObImage.asset(
                    Assets.images.closeDrawer.path,
                    width: 16.w,
                    height: 16.w,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMarquee() {
    List<MarqueeItem> list = [];
    for (int i = 0; i < controller.announcementList.length; i++) {
      ObConfigAnnouncement content =
          controller.announcementList.value[i];
      list.add(
        MarqueeItem(
          text: content.announcementContent,
          icon: _buildMarqueeIcon(content),
        ),
      );
    }
    return RepaintBoundary(
      child: CustomerMarquee(
        itemList: list,
        interval: kIsWeb ? -2 : 3, //web端两条间距太大衔接出现断开，设置小一点
        onIndexChanged: (int index) {
          controller.marqueeIndex = index;
        },
      ),
    );
  }

  /// 构建Icon图标
  Widget _buildMarqueeIcon(
      ObConfigAnnouncement content) {
    return Offstage(
      offstage: content.tagText.isNotEmpty == false,
      child:  Padding(
        padding:  EdgeInsets.only(
            left: 15.w
        ),
        child: pkObImage(Assets.images.icon.importantMsgIcon.path,
            height: 16.w, width: 26.w, fit: BoxFit.fill),
      ),
    );
  }

  /// 获取图标宽度
  double _iconWidth(
      {required ObConfigAnnouncement content,
      required double width}) {
    return content.tagText.isNotEmpty == true ? width : 0;
  }
}

extension on ObConfigAnnouncement {
  String get tagText {
    if (tag == 0) {
      return "";
    }
    if (tag == 1) {
      return 'home_important'.tr;
    }
    return "";
  }
}

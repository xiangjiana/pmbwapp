import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/home/components/message_badge.dart';
import 'package:ob_component/ob_component.dart';

import '../mine_new_controller.dart';

class MineNewTitle extends GetView<MineNewController> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      alignment: Alignment.center,
      height: 48.w + MediaQuery.of(context).padding.top,
      width: 1.sw,
      color: Color(0xff151E25),
      child: Row(
        children: [
          SizedBox(width: 16.w),
          Row(
            children: [
              Avatar(
                backgroundColor: Colors.white,
                radius: 11.w,
                child: Obx(
                  () => Avatar(
                    radius: 10.w,
                    backgroundImage: controller.isAvatarHttpUrl
                        ? NetworkImage(controller.userAvatarUrl)
                        : AssetImage(controller.userAvatarUrl, package: BaseX.pkg) as ImageProvider,
                  ),
                ),
              ),
              SizedBox(width: 8.w),
              Text(
                "Hi~," + controller.userName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Get.theme.colorScheme.primary,
                ),
              )
            ],
          ),
          Spacer(),
          Row(
            children: [
              AnimatedGestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => Get.toNamed(AppRoutes.SETTING),
                child: Container(
                  width: 40.w,
                  color: Colors.transparent,
                  alignment: Alignment.center,
                  child: ObImage.asset(
                    Assets.images.icon.myHomeSet.path,
                    width: 24.w,
                  ),
                ),
              ),
              Container(
                width: 40.w,
                color: Colors.transparent,
                child: MessageBadge(),
              ),

            ],
          ),
          SizedBox(width: 8.w),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/login_pages.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class UserAddTile extends StatelessWidget {
  UserAddTile({
    Key? key,
    this.isDisabled = true,
  }) : super(key: key);

  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        if (isDisabled) {
          Get.toNamed(AppRoutes.USER_ADD);
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: Column(
          children: [
            Divider(
              height: 1.w,
              color: Colors.white.withOpacity(0.04),
            ),
            SizedBox(height: 8.w),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Avatar(
                  radius: 30.w,
                  backgroundColor: ColorName.white.withOpacity(.04),
                  child: pkObImage(
                    isDisabled
                        ? Assets.images.icon.courseAdd.path
                        : Assets.images.icon.courseWufatianjia.path,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      isDisabled
                          ? 'user_toggle_add_main_label_enable'.tr
                          : 'user_toggle_add_main_label_disabled'.tr,
                      style: TextStyle(
                        color: ColorName.white,
                        fontSize: 14,
                      ),
                    ),
                    Text(
                      'user_toggle_add_subtitle'.tr,
                      style: TextStyle(
                        color: ColorName.colorTextWhite30,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                Spacer(),
                Visibility(
                  visible: isDisabled,
                  child: pkObImage(
                    Assets.images.icon.homeMoreRight.path,
                    width: 24.w,
                    height: 24.w,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

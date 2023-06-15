import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_gesture_password.dart';
import 'package:ob_com_login/src/modules/user/setup_gesture_password/component/lock_preview.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sp_util/sp_util.dart';

class ConfirmGesturePasswordPage extends StatelessWidget {
  final _tip = Tip.NORMAL.obs;

  List<int> get selectPoints => Get.arguments['result'];

  String get tipMessage {
    return _tip.value == Tip.NORMAL
        ? 'user_again_to_confirm_the_same'.tr
        : 'user_the_drawing_gesture_password_is_inconsistent_with_the_first_time'
            .tr;
  }

  Color get messageColor {
    return _tip.value == Tip.NORMAL ? ColorName.white : ColorName.redFF5722;
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('user_set_gesture_password'.tr),
          leading: ObBackButton(),
        ),
        body: Column(
          children: [
            SizedBox(height: 64.w),
            SizedBox(
              width: 60.w,
              child: LockPreview(selectPoints: selectPoints),
            ),
            SizedBox(height: 32.w),
            Obx(
              () => Text(
                tipMessage,
                style: TextStyle(
                  fontSize: 14,
                  color: messageColor,
                ),
              ),
            ),
            Container(
              width: 1.sw,
              alignment: Alignment.center,
              padding: EdgeInsets.all(26.w),
              child: _buildGesturePassword(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGesturePassword() {
    return GesturePasswordWidget(
      lineColor: ColorName.colorMain,
      errorLineColor: ColorName.colorMain,
      singleLineCount: 3,
      identifySize: 90.0,
      minLength: 4,
      errorItem: Container(
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
        child: pkObImage(
          Assets.images.icon.error.path,
          color: ColorName.colorMain,
        ),
      ),
      normalItem: Container(
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
        child: pkObImage(
          Assets.images.icon.normal.path,
          color: Colors.white.withOpacity(0.2),
        ),
      ),
      selectedItem: Container(
        padding: EdgeInsets.symmetric(vertical: 5.w, horizontal: 5.w),
        child: pkObImage(
          Assets.images.icon.error.path,
          color: ColorName.colorMain,
        ),
      ),
      arrowItem: SizedBox(),
      errorArrowItem: SizedBox(),
      color: ColorName.colorBackground,
      answer: selectPoints,
      onComplete: (List<int?> data) => onConfirmGesturePassword(data),
    );
  }

  void onConfirmGesturePassword(List<int?> data) {
    final result = data.join(',').split(',');
    final confirm = result.map((e) => int.parse(e)).toList();
    if (listEquals(selectPoints, confirm)) {
      showToast('user_gesture_password_is_successfully_set'.tr);
      SpUtil.putString(
        "userPassword",
        Store.userPassword,
      );
      CacheUtil.save('gesture_password', {
        'value': confirm,
        'status': true,
      });
      Get.close(2);
      Get.toNamed(AppRoutes.LOCK_SETTING);
    } else {
      _tip.value = Tip.ERROR;
    }
  }
}

enum Tip {
  ERROR,
  NORMAL,
}

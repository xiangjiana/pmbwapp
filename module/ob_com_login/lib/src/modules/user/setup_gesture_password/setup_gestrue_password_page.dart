import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_gesture_password.dart';
import 'package:ob_com_login/src/modules/user/setup_gesture_password/component/lock_preview.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class SetupGesturePasswordPage extends StatelessWidget {
  final _selectPoints = <int>[].obs;
  final _tip = Tip.NORMAL.obs;

  SetupGesturePasswordPage({Key? key}) : super(key: key);

  String get tipMessage {
    return _tip.value == Tip.NORMAL
        ? 'user_draw_gesture_password_at_least4_dots'.tr
        : 'user_please_draw_gesture_password_at_least4_dots'.tr;
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
              child: Obx(
                () => LockPreview(selectPoints: _selectPoints.value),
              ),
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
      onComplete: (List<int?> data) => onSetupGesturePassword(data),
    );
  }

  void onSetupGesturePassword(List<int?> data) {
    final result = data.join(',').split(',');
    _selectPoints.value = result.map((e) => int.parse(e)).toList();
    _tip.value = result.length >= 4 ? Tip.NORMAL : Tip.ERROR;
    if (result.length >= 4) {
      Get.toNamed(
        AppRoutes.CONFIRM_GESTURE_PASSWORD,
        arguments: {
          'result': _selectPoints.value,
        },
      );
    }
  }
}

enum Tip {
  ERROR,
  NORMAL,
}

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/login_pages.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_text.dart';
import 'package:ob_com_login/src/modules/user/login/login_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_gesture_password.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'package:sp_util/sp_util.dart';


class GestureLoginBody extends StatefulWidget {
  @override
  _GestureLoginBodyState createState() => _GestureLoginBodyState();
}

class _GestureLoginBodyState extends State<GestureLoginBody> {
  final controller = Get.find<LoginController>();
  RxString _tip = 'login_please_draw_your_gesture_password'.tr.obs;
  int errorCount = 0;
  late List<int> gesturePassword;

  @override
  void initState() {
    super.initState();
    try {
      gesturePassword = CacheUtil.get('gesture_password')['value'].cast<int>();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          MainTitleRow(title: "login_to_get_more_exciting".tr),
          SizedBox(height: 60.w),
          Obx(
            () => Text(
              _tip.value,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white.withOpacity(0.6),
              ),
            ),
          ),
          SizedBox(height: 40.w),
          _gesturePassword(),
          Spacer(),
          GestureDetector(
            onTap: () => Get.toNamed(AppRoutes.LOGIN),
            child: Center(
              child: Text(
                'login_with_account_and_password'.tr,
                style: TextStyle(
                  color: Color(0XFFE1A100),
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          SizedBox(height: 58.w),
        ],
      ),
    );
  }

  Widget _gesturePassword() {
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
      color: Colors.transparent,
      answer: gesturePassword,
      onComplete: (data) {
        var result = data.join(',').split(',');
        var confirm = result.map((e) => int.parse(e)).toList();
        setState(() {
          _login(confirm);
        });
      },
    );
  }

  void _login(List<int> input) {
    try {
      if (listEquals(gesturePassword, input)) {
        errorCount = 0;
        _tip.value = 'login_the_gesture_password_is_correct'.tr;
        String passwordSp = SpUtil.getString("gesture_user_password") ?? '';
        if (Tools.isBase64Encrypted(passwordSp)) {
          controller.postUserLogin(
            SpUtil.getString("userName") ?? '',
            Tools.base64Decode(passwordSp),
          );
        } else {
          controller.postUserLogin(
            SpUtil.getString("userName") ?? '',
            passwordSp,
          );
        }
      } else {
        errorCount++;
        _tip.value = 'login_gesture_password_is_correct'.tr;
        if (errorCount >= 20) {
          showToast('login_wrong_gesture_password_reaches20_times'.tr);
          //Get.close(1) 与 Get.offAllNamed 会造成首页 tab出错选中为 4
          Get.toNamed(AppRoutes.LOGIN);
          SpUtil.remove("token");
          SpUtil.remove("gesture_user_password");
          CacheUtil.remove('gesture_password');
        }
      }
    } catch (e) {
      showToast(e.toString());
    }
  }
}

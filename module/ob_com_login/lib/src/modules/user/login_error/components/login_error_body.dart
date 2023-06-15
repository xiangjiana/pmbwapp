import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/login_error/login_error_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'login_error_button.dart';
import 'login_error_text.dart';

class LoginErrorBody extends GetView<LoginErrorController> {
  const LoginErrorBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: Get.height,
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      decoration: BoxDecoration(
        color: Get.theme.backgroundColor,
      ),
      child: Obx(
        () => Column(
          children: <Widget>[
            const LoginErrorIcon(),
            LoginErrorTitle(),
            SizedBox(height: 4.w),
            LoginErrorText(),
            SizedBox(height: 48.w),
            InputPhone(
              controller: controller.textPhoneController,
              txtAreaCode: controller.areaCode.value,
              enabled: false,
              onAreaCodeChoose: (val) {
                controller.areaCode.value = val;
              },
            ),
            SizedBox(height: 24.w),
            InputVerifyCode(
              controller: controller.textCodeController,
              onChanged: controller.changeTextCode,
              sendCode: controller.sendCode,
              timerUtil: controller.timerUtil,
              focusNode: controller.codeFocusNode,
            ),
            LoginErrorButton(
              onPressed: controller.sendVaildate,
              disabled: !controller.buttonIsOk.value,
            ),
            const Spacer(),
            LoginErrorHelp(
              goBackLoginPage: controller.goBackLoginPage,
            ),
            SizedBox(height: 48.w + MediaQuery.of(context).padding.bottom)
          ],
        ),
      ),
    );
  }
}

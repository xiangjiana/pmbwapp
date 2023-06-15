import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_button.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/widget/input/input_username.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_login/src/modules/user/find_password/find_email_controller.dart';

import 'find_password_text.dart';


class FindEmailPanel extends GetView<FindEmailController> {
  const FindEmailPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
          () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FindPasswordText(
            title: controller.title.value,
            step: controller.pageEmailInt.value,
          ),
          FindErrorHintText(
            errorText: controller.findPasswordErrorText.value,
          ),
          SizedBox(height: 10.w),
          SizedBox(
            width: 1.sw,
            height: 180.h,
            child: PageView(
              controller: controller.pageEmailController,
              physics: const NeverScrollableScrollPhysics(),
              onPageChanged: (index) {
                controller.currentPage = index;
              },
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      InputUserName(
                        onChanged: controller.inputCheck,
                        controller: controller.textUsernameController,
                        enableClean: controller.isUsernameEnableClean.value,
                        onCleanTap: controller.cleanUsername,
                        focusNode: controller.textUsernameFocus,
                        hint: "login_tips_username".tr,
                      ),
                      SizedBox(height: 24.w),
                      InputEmail(
                        focusNode: controller.textEmailFocus,
                        enabled: controller.enabled.value,
                        onChanged: controller.inputCheck,
                        controller: controller.textEmailController,
                        enableClean: controller.isEmailEnableClean.value,
                        onCleanTap: controller.cleanEmail,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      InputEmail(
                        autofocus: false,
                        enabled: controller.enabled.value,
                        onChanged: controller.inputCheck,
                        controller: controller.textEmailController,
                      ),
                      SizedBox(height: 24.w),
                      InputVerifyCode(
                        onChanged: controller.inputCheck,
                        controller: controller.textCodeController,
                        focusNode: controller.textCodeFocus,
                        sendCode: controller.sendCode,
                        timerUtil: controller.timerUtil,
                        onErrorText: () {
                          controller.findPasswordErrorText.value = "";
                        },
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      InputPassword(
                        onChanged: controller.inputCheck,
                        obscureText: controller.isShowPassword.value,
                        controller: controller.textPasswordController,
                        onBlindmanTap: controller.changePassword,
                        isBlindmanMode: false,
                        hint: "login_tips_password_new".tr,
                      ),
                      SizedBox(height: 24.w),
                      InputPassword(
                        obscureText: controller.isShowRepeatPassword.value,
                        onChanged: controller.inputCheck,
                        controller: controller.textPasswordRepeatController,
                        onBlindmanTap: controller.changeRepeatPassword,
                        isBlindmanMode: false,
                        hint: "login_tips_password_repeat".tr,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Center(
            child: FindButton(
              margin: EdgeInsets.only(left: 32.w,right: 32.w,top: 32.w),
              isNext: controller.isNext.value,
              nextPage: controller.findNextPage,
            ),
          ),
        ],
      ),
    );
  }
}

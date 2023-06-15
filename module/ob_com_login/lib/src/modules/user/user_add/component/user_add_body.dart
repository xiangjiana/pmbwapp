import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/user_add/user_add_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'passwrod_input.dart';
import 'username_input.dart';

class UserAddBody extends StatelessWidget {
  const UserAddBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserAddController>(
      init: UserAddController(Get.find()),
      builder: (controller) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Obx(
            () => Column(
              children: [
                SizedBox(height: 16.w),
                UserNameInput(
                  isEditEnable: !controller.argumentsUserName.isNotNullOrEmpty,
                  controller: controller.usernameController,
                  onChanged: controller.onUsernameChanged,
                  isEnableClean: controller.isUsernameEnableClean.value,
                  onCleanTap: controller.cleanUsername,
                  error: controller.usernameErrorText.value,
                ),
                PasswordInput(
                  controller: controller.passwordController,
                  onChanged: controller.onPasswordChanged,
                  isEnableClean: controller.isPasswordEnableClean.value,
                  isBlind: controller.isBlind.value,
                  onBlindTap: controller.toggleBlind,
                  onCleanTap: controller.cleanPassword,
                  error: controller.passwordErrorText.value,
                ),
                SizedBox(height: 25.w),
                PrimaryButton(
                  size: ButtonSize.large,
                  block: true,
                  disabled: !controller.buttonIsOk.value,
                  onPressed: controller.sendLogin,
                  child: Text(
                    controller.argumentsUserName.isNotNullOrEmpty
                        ? "login_text".tr
                        : "confirm".tr,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                Spacer(),
              ],
            ),
          ),
        );
      },
    );
  }
}

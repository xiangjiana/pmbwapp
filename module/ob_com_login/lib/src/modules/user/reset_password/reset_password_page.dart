import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'reset_password_controller.dart';

class ResetPasswordPage extends GetView<ResetPasswordController> {
  const ResetPasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle("find_password_update".tr),
          leading: ObBackButton(),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 8.w,
              color: const Color(0xff0E1519),
            ),
            Container(
              height: 40.h,
              padding: EdgeInsets.only(left: 16.w, right: 16.w),
              alignment: Alignment.centerLeft,
              child: Obx(
                () => Visibility(
                  visible: controller.errorText.isNotEmpty,
                  child: Text(
                    controller.errorText.value,
                    style: const TextStyle(fontSize: 12, color: ColorName.red),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Obx(
                () => InputPassword(
                  controller: controller.inputPassWordController,
                  onChanged: controller.inputPassWord,
                  focusNode: controller.focusNodePassword,
                  onBlindmanTap: controller.changePassword,
                  obscureText: controller.newPasswordEyeOn.value,
                  hint: "new_password".tr,
                  isBlindmanMode: false,
                  onCleanTap: controller.onCleanPassword,
                  enableClean: controller.isPasswordEnableClean.value,
                ),
              ),
            ),
            SizedBox(height: 24.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Obx(
                () => InputPassword(
                  controller: controller.inputConfirmPassWordController,
                  onChanged: controller.inputConfirmPassword,
                  focusNode: controller.focusNodeConfirmPassword,
                  onBlindmanTap: controller.changeRegPassword,
                  obscureText: controller.confirmPasswordEyeOn.value,
                  hint: "confirm_password".tr,
                  isBlindmanMode: false,
                  onCleanTap: controller.onCleanConfirmPassword,
                  enableClean: controller.isConfirmPasswordEnableClean.value,
                ),
              ),
            ),
            SizedBox(height: 32.h),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: SizedBox(
                height: 40.h,
                child: Row(
                  children: [
                    Expanded(
                      child: Obx(
                        () => OBasePrimaryButton(
                          size: ButtonSize.large,
                          disabled: !controller.submitOk.value,
                          onPressed: controller.onSubmitted,
                          image: DecorationImage(
                            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                            fit: BoxFit.fill,
                          ),
                          child: Text(
                            "submit".tr,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 16.w),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                "for_your_account_security_please_set_a_new_password".tr,
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.white.withOpacity(0.6)),
              ),
            )
          ],
        ),
      ),
    );
  }
}

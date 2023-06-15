import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme,PrimaryButton;
import 'update_password_controller.dart';

class UpdatePasswordPage extends StatelessWidget {
  const UpdatePasswordPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UpdatePasswordController>(
      global: false,
      init: UpdatePasswordController(Get.find(), Get.find()),
      builder: (UpdatePasswordController controller) {
        return ObTheme(
          child: Scaffold(
            appBar: AppBar(
              title: ObNavigationBarTitle('find_password_update'.tr),
              leading: ObBackButton(),
              bottom: PreferredSize(
                child: Divider(
                    height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
                preferredSize: Size.fromHeight(8.w),
              ),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Obx(
                  () => Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(height: 12.w),
                      InputLabel(
                        labelText: 'update_password_old_password'.tr,
                        hint: 'user_please_enter_original_password'.tr,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('^[a-z0-9A-Z]+'))
                        ],
                        maxLength: 12,
                        onChanged: controller.changeOldTextPassword,
                        obscureText: controller.isOldPassword.value,
                        errorText: controller.errorOldText.value,
                        isError: controller.errorOldText.value.isNotEmpty,
                        controller: controller.oldPasswordCtrl,
                        keyboardType: TextInputType.streetAddress,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.oldChangePassword();
                          },
                          child: _buildSuffixWidget(controller.isOldPassword),
                        ),
                      ),
                      SizedBox(height: 12.w),
                      InputLabel(
                        labelText: 'update_password_new_password'.tr,
                        hint: 'update_password_enter_a_combination_password_new'.tr,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('^[a-z0-9A-Z]+'))
                        ],
                        maxLength: 12,
                        onChanged: controller.changeNewTextPassword,
                        obscureText: controller.isNewPassword.value,
                        errorText: controller.errorNewText.value,
                        isError: controller.errorNewText.value.isNotEmpty,
                        controller: controller.newPasswordCtrl,
                        keyboardType: TextInputType.streetAddress,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.newChangePassword();
                          },
                          child: _buildSuffixWidget(controller.isNewPassword),
                        ),
                      ),
                      SizedBox(height: 12.w),
                      InputLabel(
                        labelText: 'confirm_password'.tr,
                        hint: 'update_password_enter_a_combination_password_confirm'.tr,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp('^[a-z0-9A-Z]+'))
                        ],
                        maxLength: 12,
                        onChanged: controller.changeConfirmTextPassword,
                        obscureText: controller.isConfirmPassword.value,
                        errorText: controller.errorConfirmText.value,
                        isError: controller.errorConfirmText.value.isNotEmpty,
                        controller: controller.confirmPasswordCtrl,
                        keyboardType: TextInputType.streetAddress,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            controller.confirmChangePassword();
                          },
                          child:
                              _buildSuffixWidget(controller.isConfirmPassword),
                        ),
                      ),
                      SizedBox(height: 33.w),
                      Obx(
                        () => OBasePrimaryButton(
                          child: Text(
                            'submit'.tr,
                            style: TextStyle(fontSize: 16),
                          ),
                          image: DecorationImage(
                            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                            fit: BoxFit.fill,
                          ),
                          size: ButtonSize.large,
                          disabled: !controller.validate.value,
                          onPressed: controller.updatePassword,
                          block: true,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildSuffixWidget(RxBool isPassword) {
    return Obx(
      () => Container(
        width: 36.w,
        alignment: Alignment.centerRight,
        child: isPassword.value
            ? pkObImage(
                Assets.images.icon.loginEyeOn.path,
                width: 24.w,
                height: 24.w,
              )
            : pkObImage(
                Assets.images.icon.loginEye.path,
                width: 24.w,
                height: 24.w,
              ),
      ),
    );
  }
}

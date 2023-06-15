import 'package:ob_com_base/ob_com_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart';
import '../email_verify_identity_controller.dart';

class VerifyEmailTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GetBuilder<EmailVerifyIdentityController>(
      init: EmailVerifyIdentityController(Get.find(), Get.find()),
      builder: (EmailVerifyIdentityController controller) {
        return Obx(
          () => Container(
            width: 1.sw,
            margin: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                SizedBox(height: 24.w),
                InputLabel(
                  enabled: false,
                  controller: controller.emailCtrl,
                  hint: 'verify_identity_please_input_your_email'.tr,
                  labelText: 'email'.tr,
                ),
                SizedBox(height: 12.w),
                InputLabel(
                  controller: controller.codeCtrl,
                  keyboardType: CustomNumberKeyboard.inputIntNumberPad,
                  onChanged: controller.changeTextCode,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  maxLength: 6,
                  hint: 'verify_identity_enter_email_verification_code'.tr,
                  labelText: 'verify_identity_e_mail_verification_code'.tr,
                  suffixIcon: _buildVerifyCode(controller),
                  errorText: controller.errorVerifyCodeText.value,
                  isError:controller.errorVerifyCodeText.isNotEmpty,
                ),
                SizedBox(height: 32.w),
                PrimaryButton(
                  child: Text(
                    'submit'.tr,
                    style: TextStyle(fontSize: 16),
                  ),
                  size: ButtonSize.large,
                  disabled: !controller.buttonIsOk.value,
                  onPressed: controller.apply,
                  block: true,
                ),
                SizedBox(height: 16.w),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildVerifyCode(EmailVerifyIdentityController controller) {
    return  GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
            controller.sendCode();
        },
        child:Container(
          width: 80.w,
          height: 36.w,
          alignment: Alignment.centerRight,
          child: Obx(() => Text(
          controller.autoCodeText.value,
          style: TextStyle(
            color: Get.theme.selectedRowColor,
            fontFamily: "PingFangSC-Regular",
            fontSize: 12,
            wordSpacing: -2,
            fontWeight: FontWeight.w400,
          ),
          textAlign: TextAlign.end,
        )),
      ),
    );
  }
}

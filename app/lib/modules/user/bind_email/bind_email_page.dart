import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'bind_email_controller.dart';

class BindEmailPage extends StatelessWidget {
  const BindEmailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(
        child: GetBuilder<BindEmailController>(
      global: false,
      init: BindEmailController(Get.find()),
      builder: (BindEmailController controller) {
        return ObTheme(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: ObNavigationBarTitle('bind_email'.tr),
              leading: ObBackButton(),
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(8.w),
                child: Divider(
                  height: 8.w,
                  thickness: 8.w,
                  color: Color(0xff0E1519),
                ),
              ),
            ),
            body: SafeArea(
              bottom: true,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Obx(
                      () => Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: 12.w),
                          InputLabel(
                            controller: controller.emailCtrl,
                            onChanged: controller.changeEmailValidator,
                            keyboardType: TextInputType.emailAddress,
                            autofocus: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(32),
                            ],
                            focusNode: controller.emailFocus,
                            hint: 'please_enter'.tr,
                            labelText: 'email_address'.tr,
                            errorText: controller.emailErr.value,
                            isError: controller.emailErr.isNotEmpty,
                          ),
                          SizedBox(height: 12.w),
                          InputLabel(
                            controller: controller.verifyCodeCtrl,
                            onChanged: controller.changeCodeValidator,
                            keyboardType: CustomNumberKeyboard.inputIntNumberPad,
                            maxLength: 6,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(6),
                            ],
                            hint: 'please_enter'.tr,
                            labelText: 'verify_identity_e_mail_verification_code'.tr,
                            focusNode: controller.codeFocus,
                            suffixIcon: _buildVerifyCode(controller),
                            errorText: controller.codeErr.value,
                            isError: controller.codeErr.isNotEmpty,
                          ),
                          SizedBox(height: 32.w),
                          OBasePrimaryButton(
                            block: true,
                            size: ButtonSize.large,
                            disabled: !controller.buttonIsOk.value,
                            loadingStatus: controller.isLoadingStatus.value,
                            image: DecorationImage(
                              image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                              fit: BoxFit.fill,
                            ),
                            onPressed: () => controller.apply(),
                            child: Text(
                              'submit'.tr,
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                          SizedBox(height: 16.w),
                          Text(
                            'user_cannot_be_modified_after_confirmation'.tr,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                          SizedBox(height: 16.w),
                          Spacer(),
                          ContactCustomerService()
                        ],
                      ),
                    ),
                  ),
                  Obx(
                    () => Visibility(
                      visible: controller.isLoadingStatus.value,
                      child: Container(
                        color: Colors.black.withOpacity(.10),
                        height: double.infinity,
                        width: double.infinity,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    ));
  }

  Widget _buildVerifyCode(BindEmailController controller) {
    return Obx(
      () => GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (controller.isEnableEmailCodeSend.value) {
            controller.sendCode();
          }
        },
        child: Container(
            width: 110.w,
            height: 36.w,
            alignment: Alignment.centerRight,
            child: Text(
              controller.autoCodeText.value,
              style: TextStyle(
                color: controller.isEnableEmailCodeSend.value
                    ? Get.theme.selectedRowColor
                    : Get.theme.colorScheme.primary.withOpacity(.60),
                fontFamily: "PingFangSC-Regular",
                wordSpacing: -2,
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.end,
            )),
      ),
    );
  }
}

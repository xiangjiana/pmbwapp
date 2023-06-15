import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gt3_captcha/gt3_captcha.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/modules/user/login/components/gt_web_captcha.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_body.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_body_wrapper.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_text.dart';
import 'package:ob_com_login/src/widget/input/input_agent_code.dart';
import 'package:ob_component/ob_component.dart';

import 'third_bind_controller.dart';

class ThirdPartyRegister extends StatelessWidget {
  const ThirdPartyRegister({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Scaffold(
      //Gata 要求键盘激活后页面上页面上移
      resizeToAvoidBottomInset: false,
      body: LoginBodyWrapper(
        child: SingleChildScrollView(
          child: SizedBox(
            height: Get.height,
            width: double.infinity,
            child: _buildBindAccount(context),
          ),
        ),
      ),
    );
    final themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
        platform: TargetPlatform.android,
      ),
      child: child,
    );
  }

  Widget _buildBindAccount(BuildContext context) {
    return GetBuilder<ThirdBindController>(
      global: false,
      init: ThirdBindController(),
      initState: (_) {},
      builder: (controller) {
        return Stack(
          children: [
            SizedBox(
              height: 60.w,
            ),
            SafeArea(
              child: GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.LANG_SETTING);
                },
                child: Row(
                  children: [
                    const Spacer(),
                    Padding(
                      padding: const EdgeInsets.all(6),
                      child: pkObImage(
                        Assets.images.icon.loginLanguage.path,
                        width: 24.w,
                        height: 24.h,
                      ),
                    ),
                    SizedBox(
                      width: 16.w,
                    ),
                  ],
                ),
              ),
            ),
            Obx(() {
              return _buildRegister(controller, context);
            }),
            _buildGt3CaptchaView(controller),
          ],
        );
      },
    );
  }

  Widget _buildGt3CaptchaView(ThirdBindController controller) {
    if (GetPlatform.isWeb) {
      return Obx(() {
        if (controller.isCaptchaVisible.value) {
          showGaLoading();
          return GtWebCaptcha(
            onSuccess: () {
              controller.hideCaptcha();
              controller.signUpStepFinalRegister();
            },
            onClose: () {
              dismissLoading();
              controller.hideCaptcha();
            },
            onReady: () {
              dismissLoading();
            },
            onError: () async {
              dismissLoading();
              controller.hideCaptcha();
            },
          );
        }
        return const SizedBox.shrink();
      });
    }
    return Obx(() {
      if (controller.isCaptchaVisible.value) {
        return Gt3CaptchaView(
          onRegister: controller.getCaptcha,
          onValidation: (String params) =>
              controller.signUpStepThreeVerifyCaptcha(params),
          onGt3CaptchaViewCreated: (Gt3CaptchaViewController controller) {
            controller.start();
          },
          onCancel: () async {
            controller.hideCaptcha();
          },
          onGtViewShow: () async {},
          onError: () async {
            controller.hideCaptcha();
          },
        );
      }
      return const SizedBox.shrink();
    });
  }

  Widget _buildRegister(ThirdBindController controller, BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 32.w),
      child: Column(
        children: [
          const Spacer(flex: 3),
          if (controller.platform == "2")
            pkObImage(
              Assets.images.icon.zalo.path,
              width: 82.w,
              height: 82.h,
            ),
          if (controller.platform == "1")
            pkObImage(
              Assets.images.icon.facebook.path,
              width: 82.w,
              height: 82.h,
            ),
          ErrorTextRow(
            controller.errorText.value,
          ),
          InputUserName(
            // key: ValueKey('SignUpUserNameInput'),
            controller: controller.signUpUsernameController,
            autofocus: false,
            focusNode: controller.focusNodeSingUpUsername,
            onChanged: controller.changeTextUsernameAndPassword,
            enableClean: controller.isRegUsernameEnableClean.value,
            onCleanTap: controller.cleanRegUsername,
            hint: "reg_tips_username".tr,
          ),
          SizedBox(height: 24.w),
          InputPassword(
            // key: ValueKey('SignUpPasswordInput'),
            controller: controller.signUpPasswordController,
            onChanged: controller.changeTextUsernameAndPassword,
            focusNode: controller.focusNodeSingUpPassword,
            onBlindmanTap: controller.changeRegPassword,
            obscureText: controller.isRegPassword.value,
            hint: "reg_tips_password".tr,
            isBlindmanMode: false,
            onCleanTap: controller.cleanRegPassword,
            enableClean: controller.isRegPasswordEnableClean.value,
          ),
          SizedBox(height: 24.w),
          InputPassword(
            // key: ValueKey('SignUpPasswordInputRepeat'),
            controller: controller.signUpPasswordRepeatController,
            onChanged: controller.changeTextUsernameAndPassword,
            focusNode: controller.focusNodeSingUpRptPassword,
            onBlindmanTap: controller.changeRegRepeatPassword,
            obscureText: controller.isRegRepeatPassword.value,
            isBlindmanMode: false,
            hint: "login_tips_password_repeat".tr,
            onCleanTap: controller.cleanRegRptPassword,
            enableClean: controller.isRegRptPasswordEnableClean.value,
          ),
          Obx(
            () => Visibility(
              visible:
                  !Invitation.isGoodInvitationCode(Store.invitationCode.value),
              child: Column(
                children: [
                  SizedBox(height: 24.w),
                  InputAgentCode(
                    onChanged: controller.changeTextUsernameAndPassword,
                    focusNode: controller.focusNodeAgentCode,
                    controller: controller.agentCodeController,
                    enableClean: controller.isAgentCodeEnableClean.value,
                    onCleanTap: controller.cleanAgentCode,
                  ),
                  SizedBox(height: 16.w),
                  const ObtainCodeText(),
                ],
              ),
            ),
          ),
          SizedBox(height: 16.w),
          Opacity(
            opacity: controller.buttonIsOk.value ? 1 : 0.5,
            child: OBasePrimaryButton(
              child: Text(
                "register_text".tr,
                textAlign: TextAlign.center,
              ),
              image: DecorationImage(
                image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
                fit: BoxFit.fill,
              ),
              size: ButtonSize.large,
              block: true,
              onPressed: () {
                hideKeyboard(context);
                if (controller.buttonIsOk.value) {
                  controller.signUpStepOneCheck();
                }
              },
            ),
          ),
          const Spacer(
            flex: 2,
          ),
          BottomTextRow(
            text1: "already_have_an_account".tr,
            text2: "login_directly".tr,
            onClick: controller.changeIsLoginPage,
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}

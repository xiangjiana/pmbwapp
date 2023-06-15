import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gt3_captcha/gt3_captcha.dart';

import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/login/components/gt_web_captcha.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_text.dart';
import 'package:ob_com_login/src/modules/user/login/login_controller.dart';
import 'package:ob_com_login/src/widget/input/input_agent_code.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

double viewportMaxHeight = -1;

class LoginBody extends StatelessWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      global: false,
      init: LoginController(),
      initState: (_) {
        if (GetPlatform.isAndroid) {
          Gt3CaptchaView.platform = SurfaceAndroidGt3CaptchaView();
        }
      },
      builder: (LoginController controller) {
        return Stack(
          children: [
            Positioned.fill(
              child: Padding(
                padding: EdgeInsets.zero,
                child: LayoutBuilder(
                  builder: (context, viewport) {
                    if (viewportMaxHeight == -1) {
                      viewportMaxHeight = viewport.maxHeight;
                    }
                    return SingleChildScrollView(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          minHeight: viewportMaxHeight,
                        ),
                        child: IntrinsicHeight(
                          child: Obx(() {
                            if (controller.isLoginPage.value) {
                              return _buildLogin(controller, context);
                            }
                            return _buildRegister(controller, context);
                          }),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // if (controller.supportLang.length > 1)
            //   Positioned(
            //     top: 30,
            //     right: 32,
            //     child: GestureDetector(
            //       onTap: () {
            //         Get.toNamed(AppRoutes.LANG_SETTING);
            //       },
            //       child: Padding(
            //         padding: const EdgeInsets.all(6),
            //         child: pkObImage(
            //           Assets.images.icon.loginLanguage.path,
            //           width: 24.w,
            //           height: 24.h,
            //         ),
            //       ),
            //     ),
            //   ),
            _buildGt3CaptchaView(controller),
          ],
        );
      },
    );
  }

  Widget _buildGt3CaptchaView(LoginController controller) {
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
            controller.start(Get.locale?.languageCode ?? "en");
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

  Widget _buildLogin(LoginController controller, BuildContext context) {
    return Column(
      children: <Widget>[
        MainTitleRow(title: "login_to_get_more_exciting".tr),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              ErrorTextRow(
                controller.errorTextUsername.value,
              ),
              InputUserName(
                // key: ValueKey('SignInUserNameInput'),
                controller: controller.singInUsernameController,
                autofocus: false,
                focusNode: controller.focusNodeSingInUsername,
                onChanged: controller.changeTextUsernameAndPassword,
                enableClean: controller.isUsernameEnableClean.value,
                onCleanTap: controller.cleanUsername,
                enableDropDown:
                    kIsWeb ? false : controller.userLists.length > 1,
                onUserChoose: controller.chooseUser,
                onUserRemove: controller.removeUser,
                hint: "login_tips_username".tr,
              ),
              ErrorTextRow(
                controller.errorTextPassword.value,
              ),
              InputPassword(
                // key: ValueKey('SignInPasswordInput'),
                controller: controller.signInPasswordController,
                onChanged: controller.changeTextUsernameAndPassword,
                onBlindmanTap: controller.changePassword,
                obscureText: controller.isPassword.value,
                isBlindmanMode: controller.isBlindmanMode.value,
                onCleanTap: controller.cleanPassword,
                enableClean: controller.isPasswordEnableClean.value,
                focusNode: controller.focusNodeSingInPassword,
                hint: "login_tips_password".tr,
              ),
              RememberPwdRow(
                isChecked: controller.isRememberPassword.value,
                onChanged: (bool value) {
                  controller.changeRememberPassword(value);
                },
              ),
              Row(
                children: [
                  // if (Store.clientId != Store.clientIdFYB &&
                  //     Store.clientId != Store.clientIdPG)
                  //   LoginTryPlayButton(
                  //     onPressed: controller.sendTryPlayLogin,
                  //   ),
                  // if (Store.clientId != Store.clientIdFYB &&
                  //     Store.clientId != Store.clientIdPG)
                  //   SizedBox(width: 12.w),
                  Expanded(
                    child: OBasePrimaryButton(
                      size: ButtonSize.large,
                      disabled: !controller.buttonIsOk.value,
                      onPressed: controller.sendLogin,
                      image: DecorationImage(
                        image: AssetImage(Assets.images.btnbg.path,
                            package: BaseX.pkg),
                        fit: BoxFit.fill,
                      ),
                      child: Text(
                        "login_text".tr,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
              LoginDivider(),
              // if (Store.clientId == Store.clientIdPG &&
              //     AppMerchantUtils.loadCurMerchantBy(OBModules.kThirdPartyLogin))
              const ThirdPartyLogin(),
              SizedBox(height: 20.h),
              BottomTextRow(
                text1: "not_have_an_account_yet".tr,
                text2: " ${"login_immediately_register".tr}",
                onClick: controller.changeIsLoginPage,
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _buildRegister(LoginController controller, BuildContext context) {
    return Column(
      children: [
        MainTitleRow(title: "login_immediately_register".tr),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(children: [
            ErrorTextRow(
              controller.errorTextUsername.value,
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
            ErrorTextRow(
              controller.errorTextPassword.value,
            ),
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
            // ErrorTextRow(
            //   controller.errorTextPassword2.value,
            // ),
            // InputPassword(
            //   // key: ValueKey('SignUpPasswordInputRepeat'),
            //   controller: controller.signUpPasswordRepeatController,
            //   onChanged: controller.changeTextUsernameAndPassword,
            //   focusNode: controller.focusNodeSingUpRptPassword,
            //   onBlindmanTap: controller.changeRegRepeatPassword,
            //   obscureText: controller.isRegRepeatPassword.value,
            //   isBlindmanMode: false,
            //   hint: "login_tips_password_repeat".tr,
            //   onCleanTap: controller.cleanRegRptPassword,
            //   enableClean: controller.isRegRptPasswordEnableClean.value,
            // ),
            Obx(
              () => Visibility(
                visible: !Invitation.isGoodInvitationCode(
                    Store.invitationCode.value),
                child: Column(
                  children: [
                    ErrorTextRow(
                      controller.errorTextAgentcode.value,
                    ),
                    InputAgentCode(
                      onChanged: controller.changeTextUsernameAndPassword,
                      focusNode: controller.focusNodeAgentCode,
                      controller: controller.agentCodeController,
                      enableClean: controller.isAgentCodeEnableClean.value,
                      onCleanTap: controller.cleanAgentCode,
                      onInfoTap: () {},
                    ),
                    // SizedBox(height: 16.w),
                    // const AgentCodeTextRow(),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8.w),
            ProtocolRow(
              onChanged: controller.changeRegisterProtocol,
              isChecked: controller.isRegisterProtocol.value,
            ),
            SizedBox(height: 8.w),
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
            LoginDivider(),
            const ThirdPartyLogin(),
            SizedBox(height: 16.w),
            BottomTextRow(
              text1: "already_have_an_account".tr,
              text2: "login_directly".tr,
              onClick: controller.changeIsLoginPage,
            ),
            SizedBox(height: 16.h),
          ]),
        )
      ],
    );
  }
}

void hideKeyboard(context) {
  FocusScopeNode currentFocus = FocusScope.of(context);
  if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
    FocusManager.instance.primaryFocus!.unfocus();
  }
}

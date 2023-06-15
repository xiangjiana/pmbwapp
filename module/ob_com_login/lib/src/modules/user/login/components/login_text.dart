import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/login/login_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';

class MainTitleRow extends StatelessWidget {
  const MainTitleRow({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(top: 10.w),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.images.loginbg.path, package: BaseX.pkg),
              fit: BoxFit.fill)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        SizedBox(
          height: 20.w,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Row(
            children: [
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  Get.back();
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: pkObImage(
                    Assets.images.back.path,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
              Expanded(
                  child: Center(
                      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "WELCOME TO ",
                    style: TextStyle(color: Colors.white, fontSize: 18.w),
                  ),
                  pkObImage(Assets.images.pmLogo.path,
                      height: 20.h, fit: BoxFit.fitHeight),
                ],
              ))),
              GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () {
                  PublicResources.jumpToMemberServicePage();
                },
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: pkObImage(
                    Assets.images.kf.path,
                    width: 24.w,
                    height: 24.h,
                  ),
                ),
              ),
            ],
          ),
        ),
        Stack(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: .1.sw),
              child: pkObImage(Assets.images.loginbg2.path,
                  width: 1.sw, fit: BoxFit.fitWidth),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  width: 1.sw,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 5.w,
                      ),
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 18.w),
                      ),
                      Text(
                        "experience_the_professional_platform".tr,
                        style: TextStyle(
                            color: Colors.white.withOpacity(.5),
                            fontSize: 12.w),
                      ),
                      SizedBox(
                        height: 5.w,
                      ),
                    ],
                  ),
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                        Color.fromARGB(255, 32, 35, 39).withOpacity(0.8),
                        Color.fromARGB(255, 32, 35, 39).withOpacity(0.85),
                        Color.fromARGB(255, 32, 35, 39).withOpacity(0.99),
                      ])),
                )),
          ],
        )
      ]),
    );
  }
}

class LoginDivider extends StatelessWidget {
  const LoginDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.w, bottom: 5.w),
      alignment: Alignment.center,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50.w,
            height: 1,
            color: Color.fromARGB(255, 103, 112, 123),
            margin: EdgeInsets.only(right: 10.w),
          ),
          Text(
            "or_use".tr,
            style:
                TextStyle(color: Colors.white.withOpacity(.4), fontSize: 12.w),
          ),
          Container(
            width: 50.w,
            height: 1,
            margin: EdgeInsets.only(left: 10.w),
            color: Color.fromARGB(255, 103, 112, 123),
          )
        ],
      ),
    );
  }
}

//登录提示文字
class ErrorTextRow extends StatelessWidget {
  final String text;

  const ErrorTextRow(this.text);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(height: 4.w),
        SizedBox(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.red,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}

//记住密码与忘记密码
class RememberPwdRow extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  RememberPwdRow({
    required this.isChecked,
    required this.onChanged,
  });

  bool _checked = false;

  @override
  Widget build(BuildContext context) {
    _checked = isChecked;
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            _checked = !_checked;
            onChanged(_checked);
          },
          child: SizedBox(
            height: 41.w,
            child: Row(
              children: [
                SizedBox(
                  width: 18.w,
                  child: Checkbox(
                    value: _checked,
                    onChanged: (v) {
                      _checked = v!;
                      onChanged(_checked);
                    },
                    fillColor: MaterialStateProperty.resolveWith<Color>(
                        (Set<MaterialState> states) {
                      return const Color.fromARGB(255, 42, 45, 50);
                    }),
                    checkColor: const Color.fromARGB(255, 58, 184, 24),
                  ),
                ),
                SizedBox(width: 8.w),
                Text(
                  "login_remember_password".tr,
                  style: TextStyle(
                    fontFamily: "PingFangSC-Regular",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Get.theme.colorScheme.primary.withOpacity(0.6),
                  ),
                ),
              ],
            ),
          ),
        ),
        const Spacer(),
        if (Store.clientId != Store.clientIdFYB &&
            AppMerchantUtils.loadCurMerchantBy(OBModules.kSMSVerification))
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.toNamed(AppRoutes.FIND_PASSWORD);
            },
            child: SizedBox(
              height: 41.w,
              child: Center(
                child: Text(
                  "login_forget_password".tr,
                  style: TextStyle(
                    fontFamily: "PingFangSC-Regular",
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Get.theme.colorScheme.primary.withOpacity(0.6),
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}

//协议+同意按钮
class ProtocolRow extends StatelessWidget {
  final VoidCallback onChanged;
  final bool isChecked;

  const ProtocolRow({
    required this.onChanged,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onChanged,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Transform.translate(
            offset: Offset(0, 1.w),
            child: AbsorbPointer(
              child: ObaseRadio(
                value: isChecked,
              ),
            ),
          ),
          SizedBox(width: 8.w),
          Expanded(
            child: RichText(
              text: TextSpan(
                children: [
                  TextSpan(
                      children: [
                        TextSpan(
                          children: [
                            TextSpan(
                                children: [],
                                text: "  " + "register_text3".tr,
                                style: TextStyle(
                                  fontFamily: "PingFangSC-Regular",
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(
                                      AppRoutes.REGISTER_TEXT,
                                      parameters: {
                                        "title": "login_privacy_policy".tr,
                                        "textType": "1"
                                      },
                                    );
                                  })
                          ],
                          text: "register_text4".tr,
                          style: TextStyle(
                            fontFamily: "PingFangSC-Regular",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color:
                                Get.theme.colorScheme.primary.withOpacity(0.3),
                          ),
                        )
                      ],
                      text: "  " + "register_text2".tr + "  ",
                      style: TextStyle(
                        fontFamily: "PingFangSC-Regular",
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Colors.white,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(
                            AppRoutes.REGISTER_TEXT,
                            parameters: {
                              "title": "login_related_terms".tr,
                              "textType": "0"
                            },
                          );
                        })
                ],
                text: "register_text1".tr,
                style: TextStyle(
                  fontFamily: "PingFangSC-Regular",
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Get.theme.colorScheme.primary.withOpacity(0.3),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//联系客服与返回登录
class BottomTextRow extends StatelessWidget {
  const BottomTextRow(
      {required this.text1, required this.text2, required this.onClick});

  final String text1;
  final String text2;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: TextStyle(color: Colors.white.withOpacity(.4)),
        ),
        GestureDetector(
          child: Text(
            text2,
            style: TextStyle(color: Color.fromARGB(255, 69, 181, 44)),
          ),
          onTap: onClick,
        )
      ],
    );
  }
}

//第三方登陆
class ThirdPartyLogin extends StatelessWidget {
  const ThirdPartyLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.find<LoginController>().postUserThirdSdk(2);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3.w),
              child: Text(
                "Zalo",
                style: TextStyle(
                    color: Color.fromARGB(255, 241, 247, 255).withOpacity(.4),
                    fontSize: 14.w),
              ),
              decoration: BoxDecoration(color: Colors.white.withOpacity(.2)),
            ),
          ),
        ),
        SizedBox(width: 56.w),
        Expanded(
          child: GestureDetector(
            onTap: () {
              Get.find<LoginController>().postUserThirdSdk(1);
            },
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(vertical: 3.w),
              child: Text(
                "Facebook",
                style: TextStyle(
                    color: Color.fromARGB(255, 241, 247, 255).withOpacity(.4),
                    fontSize: 14.w),
              ),
              decoration: BoxDecoration(color: Colors.white.withOpacity(.2)),
            ),
          ),
        ),
      ],
    );
  }
}

class AgentCodeTextRow extends StatelessWidget {
  const AgentCodeTextRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (Store.clientId == Store.clientIdFYB) {
          PublicResources.jumpToAgentServicePage();
        } else {
          PublicResources.jumpToMemberServicePage();
        }
      },
      child: RichText(
          text: TextSpan(
              text: sprintf("download_page_get_invite_code_if_need_plz".tr,
                      ["plz_enter_invitecode".tr.toLowerCase()]) +
                  (Get.locale!.languageCode == 'zh' ? '。' : '. ') +
                  "need_any_help".tr,
              style: TextStyle(
                  color: Get.theme.colorScheme.primary.withOpacity(0.6),
                  fontSize: 12),
              children: [
            TextSpan(
              text: "  " + "contact_customer_service".tr,
              style: TextStyle(color: ColorName.colorMain, fontSize: 12),
            )
          ])),
    );
  }
}

class ObtainCodeText extends StatelessWidget {
  const ObtainCodeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        GestureDetector(
          onTap: () {
            if (Store.clientId == Store.clientIdFYB) {
              PublicResources.jumpToAgentServicePage();
            } else {
              PublicResources.jumpToMemberServicePage();
            }
          },
          child: Text(
            "get_invite_code_if_need_plz".tr,
            style: TextStyle(
              color: Get.theme.colorScheme.primary.withOpacity(0.6),
              fontSize: 12,
            ),
          ),
        ),
        const SizedBox(width: 4),
        pkObImage(
          Assets.images.icon.walletHint.path,
          width: 16.w,
          height: 16.h,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_login/src/login_x.dart';

//异常页面图标
class LoginErrorIcon extends StatelessWidget {
  const LoginErrorIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 88.w,
      ),
      width: 88.w,
      height: 88.w,
      child: pkObImage(
        Assets.images.icon.loginAbnormal.path,
        fit: BoxFit.cover,
      ),
    );
  }
}

//登录异常title
class LoginErrorTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 24.w,
      ),
      child: Text(
        "login_error_title".tr,
        style: TextStyle(
          color: Get.theme.colorScheme.primary,
          fontSize: 18,
          fontWeight: FontWeight.w500,
          fontFamily: "PingFangSC-Medium",
        ),
      ),
    );
  }
}

//登录异常 您登录的不是常用IP地址，请验证手机号码
class LoginErrorText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      "login_error_text1".tr.breakWordOnWeb,
      maxLines: 3,
      style: TextStyle(
        color: Get.theme.colorScheme.primary,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        fontFamily: "PingFangSC-Regular",
      ),
    );
  }
}

//联系客服与返回登录
class LoginErrorHelp extends StatelessWidget {
  Function()? goBackLoginPage;

  LoginErrorHelp({this.goBackLoginPage});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () {
            if (Store.clientId == Store.clientIdFYB) {
              PublicResources.jumpToAgentServicePage();
            } else {
              PublicResources.jumpToMemberServicePage();
            }
          },
          child: Container(
            width: 80.w,
            height: 44.w,
            alignment: Alignment.centerRight,
            child: Text(
              "online_service".tr.breakWordOnWeb,
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Get.theme.colorScheme.primary.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400),
            ),
          ),
        ),
        SizedBox(width: 10.w,),
        Container(
          height: 14.w,
          width: 1.w,
          color: Get.theme.colorScheme.primary.withOpacity(0.6),
        ),
        SizedBox(width: 10.w,),
        GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: () => goBackLoginPage?.call(),
          child: Container(
            width: 80.w,
            height: 44.w,
            alignment: Alignment.centerLeft,
            child: Text(
               "register_back_login".tr.breakWordOnWeb,
              style: TextStyle(
                  color: Get.theme.colorScheme.primary.withOpacity(0.6),
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400),
            ),
          ),
        )
      ],
    );
  }
}

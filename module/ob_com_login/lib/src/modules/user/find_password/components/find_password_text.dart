import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/login_x.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:sprintf/sprintf.dart';

class FindPasswordTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 49.w,
      child: Row(
        children: [
          //箭头
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(left: 16.w),
              width: 24.w,
              height: 24.w,
              child: pkObImage(Assets.images.icon.comBack.path),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 116.w),
            child: Text(
              "find_password_title".tr,
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
                fontSize: 16,
                fontFamily: "PingFangSC-Medium",
                fontWeight: FontWeight.w400,
              ),
            ),
          )
        ],
      ),
    );
  }
}

//步骤提示
class FindPasswordText extends StatelessWidget {
  final String title;
  final int step;

  FindPasswordText({
    Key? key,
    this.title = "",
    this.step = 1,
  }) : super(key: key);

  // String title;
  // String nextStr;
  // FindPasswordText({required this.title, required this.nextStr});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.w),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(
              left: 32.w,
            ),
            child: Text(
              title,
              style: TextStyle(
                  fontFamily: "PingFangSC-Medium",
                  fontSize: 18,
                  color: Get.theme.colorScheme.primary),
            ),
          ),
          Opacity(
            opacity: .3,
            child: Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.only(
                left: 10.w,
              ),
              child: Text(
                Get.locale!.languageCode=='en'?'step'.tr + " $step/3":"$step/3 "+'step'.tr,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

// //手机找回密码第二步
// class FindPasswordPhoneText2 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 49.w,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.baseline,
//         textBaseline: TextBaseline.alphabetic,
//         children: [
//           Container(
//             alignment: Alignment.bottomCenter,
//             margin: EdgeInsets.only(
//               left: 32.w,
//             ),
//             child: Text(
//               "find_input_phone_code".tr,
//               style: TextStyle(
//                   fontFamily: "PingFangSC-Medium",
//                   fontSize: 18,
//                   color: Get.theme.colorScheme.primary),
//             ),
//           ),
//           Opacity(
//             opacity: .3,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               margin: EdgeInsets.only(
//                 left: 10.w,
//               ),
//               child: Text(
//                 "find_password_phone_text2".tr,
//                 style: TextStyle(
//                   color: Get.theme.colorScheme.primary,
//                   fontSize: 14.w,
//                   fontFamily: "PingFangSC-Regular",
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

// //手机找回密码第三步
// class FindPasswordPhoneText3 extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 49.w,
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.baseline,
//         textBaseline: TextBaseline.alphabetic,
//         children: [
//           Container(
//             alignment: Alignment.bottomCenter,
//             margin: EdgeInsets.only(
//               left: 32.w,
//             ),
//             child: Text(
//               "find_password_update".tr,
//               style: TextStyle(
//                   fontFamily: "PingFangSC-Medium",
//                   fontSize: 18,
//                   color: Get.theme.colorScheme.primary),
//             ),
//           ),
//           Opacity(
//             opacity: .3,
//             child: Container(
//               alignment: Alignment.bottomCenter,
//               margin: EdgeInsets.only(
//                 left: 10.w,
//               ),
//               child: Text(
//                 "find_password_phone_text3".tr,
//                 style: TextStyle(
//                   color: Get.theme.colorScheme.primary,
//                   fontSize: 14.w,
//                   fontFamily: "PingFangSC-Regular",
//                 ),
//               ),
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//FindPasswordHelp 联系客服
class FindPasswordHelp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 24.w),
      child: GestureDetector(
        onTap: () {
          if (Store.clientId == Store.clientIdFYB) {
            PublicResources.jumpToAgentServicePage();
          } else {
            PublicResources.jumpToMemberServicePage();
          }
        },
        child: Container(
          child: Opacity(
            child: Text(
              "login_help".tr,
              style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 14,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400),
            ),
            opacity: 0.6,
          ),
        ),
      ),
    );
  }
}

class FindPasswordText2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 24.w, left: 12.w, right: 12.w),
      child: Column(
        children: [
          Container(
            alignment: Alignment.center,
            child: Opacity(
              opacity: .4,
              child: Text(
                sprintf(
                  "find_password_bottom_contet1".tr,
                  Store.clientId == Store.clientIdDJ
                      ? ["find_password_bottom_contet1_1".tr]
                      : ["find_password_bottom_contet1_2".tr],
                ),
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 12,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Opacity(
              opacity: .4,
              child: Text(
                "find_password_bottom_contet2".tr,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 12,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class FindPasswordText3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: 48.w + MediaQuery.of(context).padding.bottom),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(vertical: 12.w),
            child: Text(
              "user_for_help_please".tr,
              style: TextStyle(
                color: Get.theme.colorScheme.primary.withOpacity(.6),
                fontSize: 12,
                fontFamily: "PingFangSC-Regular",
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
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
              padding: EdgeInsets.only(left: 4.w, top: 12.w, bottom: 12),
              alignment: Alignment.center,
              color: Colors.transparent,
              child: Text(
                'contact_customer_service'.tr,
                style: TextStyle(
                  color: ColorName.colorMain,
                  fontSize: 12,
                  fontFamily: "PingFangSC-Regular",
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

//错误提示文字
class FindErrorHintText extends StatelessWidget {
  final String errorText;

  FindErrorHintText({
    Key? key,
    this.errorText = "",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 1.sw,
      constraints: BoxConstraints(
        minHeight: 20.w,
      ),
      margin: EdgeInsets.only(
        top: 8.w,
        left: 32.w,
        right: 32.w,
      ),
      child: Text(
        errorText,
        style: const TextStyle(
          color: Color(0xffFF4B34),
          fontSize: 12,
        ),
      ),
    );
  }
}

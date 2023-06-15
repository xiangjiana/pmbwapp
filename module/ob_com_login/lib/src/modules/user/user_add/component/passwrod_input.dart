import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    Key? key,
    this.controller,
    this.onChanged,
    this.isEnableClean = false,
    this.isBlind = false,
    required this.onBlindTap,
    required this.onCleanTap,
    this.error = "",
  }) : super(key: key);

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final GestureTapCallback onBlindTap;
  final GestureTapCallback onCleanTap;
  final bool isEnableClean;
  final bool isBlind;
  final String error;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Theme(
          data: Theme.of(context).copyWith(
            platform: TargetPlatform.android,
          ),
          child: TextField(
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^[a-z0-9A-Z]+')),
              LengthLimitingTextInputFormatter(12) //设置只允许输入字母+数字
            ],
            controller: controller,
            autofocus: false,
            obscureText: !isBlind,
            cursorColor: Get.theme.colorScheme.primary,
            keyboardType: TextInputType.streetAddress,
            textAlignVertical: TextAlignVertical.center,
            style: TextStyle(
              fontSize: 16,
              fontFamily: "PingFangSC-Regular",
              height: 1.2,
              fontWeight: FontWeight.w400,
            ),
            onChanged: onChanged,
            decoration: InputDecoration(
              isCollapsed: true,
              hintText: "user_toggle_login_password_hint".tr,
              hintStyle: TextStyle(
                color: ColorName.colorTextWhite30,
                fontSize: 16,
                fontFamily: "PingFangSC-Regular",
                height: 1.2,
                fontWeight: FontWeight.w400,
              ),
              contentPadding: EdgeInsets.only(
                top: 14.w,
                bottom: 14.w,
                left: 8.w,
              ),
              prefixIcon: Padding(
                padding: EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  "user_toggle_login_password_label".tr,
                  style: TextStyle(
                    color: ColorName.colorTextWhite60,
                    height: 1.2,
                    fontSize: 16,
                  ),
                ),
              ),
              prefixIconConstraints: BoxConstraints(minWidth: 64.w),
              suffixIcon: Container(
                constraints: BoxConstraints(minWidth: 40.w, maxWidth: 72.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: isEnableClean,
                      child: GestureDetector(
                        onTap: onCleanTap,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: pkObImage(
                            Assets.images.icon.comDelete.path,
                            width: 16.w,
                            height: 16.w,
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: onBlindTap,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.w),
                        child: pkObImage(
                          isBlind
                              ? Assets.images.icon.loginEye.path
                              : Assets.images.icon.loginEyeOn.path,
                          width: 24.w,
                          height: 24.w,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        SizedBox(height: 4.w),
        Visibility(
          visible: error.isNotNullOrEmpty,
          child: Padding(
            padding: EdgeInsets.only(left: 8.w),
            child: Text(
              '$error',
              style: TextStyle(
                color: ColorName.colorMain,
                fontSize: 12,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

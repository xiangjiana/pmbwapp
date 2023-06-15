import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_textfield.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class InputPassword extends ObInputTextField {
  InputPassword({
    Key? key,
    TextEditingController? controller,
    bool isBlindmanMode = true,
    bool obscureText = false,
    FocusNode? focusNode,
    String? hint,
    ValueChanged<String>? onChanged,
    GestureTapCallback? onBlindmanTap,
    GestureTapCallback? onCleanTap,
    bool enableClean = false,
  }) : super(
          key: key,
          rimStyle: RimStyle.customize,
          editingController: controller,
          onChanged: onChanged,
          autofocus: false,
          focusNode: focusNode,
          hintText: hint,
          obscureText: !obscureText,
          keyboardType: TextInputType.name,
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp('^[a-z0-9A-Z]+')),
            LengthLimitingTextInputFormatter(12) //设置只允许输入字母+数字
          ],
          prefixIconConstraints: BoxConstraints(
            minWidth: 24.w,
            minHeight: 24.w,
          ),
          decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(0),
                  color: Color(0xff1a1c20),
                ),
          contentPadding: EdgeInsets.only(left: 20.w),
          suffixIcon: Container(
            constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Visibility(
                  visible: enableClean,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onCleanTap?.call();
                    },
                    child: Padding(
                      padding: EdgeInsets.only(right: 8.w),
                      child: pkObImage(
                        Assets.images.icon.comDelete2.path,
                        width: 24.w,
                        height: 24.w,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: !isBlindmanMode,
                  child: GestureDetector(
                    onTap: onBlindmanTap,
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.w),
                      child: obscureText
                          ? pkObImage(
                              Assets.images.icon.loginEye.path,
                              width: 24.w,
                              height: 24.w,
                            )
                          : pkObImage(
                              Assets.images.icon.loginEyeOn.path,
                              width: 24.w,
                              height: 24.w,
                            ),
                    ),
                  ),
                ),
                SizedBox(width: 8.w),
              ],
            ),
          ),
        );
}


import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_textfield.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class InputEmail extends ObInputTextField {
  InputEmail({
    Key? key,
    bool autofocus = false,
    bool enabled = true,
    FocusNode? focusNode,
    ValueChanged<String>? onChanged,
    TextEditingController? controller,
    bool enableClean = false,
    onCleanTap,
  }):super(
    key: key,
    rimStyle:RimStyle.customize,
    editingController: controller,
    onChanged: onChanged,
    autofocus: autofocus,
    hintText: "email_address".tr,
    focusNode: focusNode,
    enabled: enabled,
    keyboardType: TextInputType.emailAddress,
    inputFormatters: [
      LengthLimitingTextInputFormatter(32),
      FilteringTextInputFormatter.allow(RegExp('^[a-z0-9A-Z@.]+')) //设置只允许输入字母+数字
    ],
    focusedBorder: InputBorder.none,
    suffixIcon: Container(
        constraints: BoxConstraints(minWidth: 40.w, maxWidth: 80.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
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

            SizedBox(width: 8.w),
          ],
        )
    ),
    prefixIcon: Container(
      width: 24.w,
      height: 24.w,
      margin: EdgeInsets.only(right: 12.w,left: 24.w),
      child: pkObImage(
        Assets.images.icon.loginMail.path,
        fit: BoxFit.cover,
      ),
    ),
    prefixIconConstraints: BoxConstraints(
      minWidth: 24.w,
      minHeight: 24.w,
    ),
  );
}

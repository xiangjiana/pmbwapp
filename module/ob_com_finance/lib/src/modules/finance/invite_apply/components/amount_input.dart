import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class AmountInput extends StatelessWidget {
  final num maxLimit;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<String> onChanged;
  final TextEditingController controller;

  const AmountInput({
    Key? key,
    this.autofocus = false,
    this.focusNode,
    required this.onChanged,
    required this.controller,
    required this.maxLimit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
      ),
      child: Container(
        width: double.infinity,
        height: 48.w,
        alignment: Alignment.center,
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.w),
          color: Get.theme.colorScheme.primary.withOpacity(0.04),
        ),
        child: TextField(
          inputFormatters: [
            FilteringTextInputFormatter.digitsOnly,
            TextNumberLimitFormatter(
              maxLimit,
              selectionOffsetToLast: true,
            )
          ],
          textAlignVertical: TextAlignVertical.center,
          textAlign:TextAlign.end,
          onChanged: onChanged,
          controller: controller,
          cursorColor: Get.theme.colorScheme.primary,
          keyboardType: CustomNumberKeyboard.inputFloatNumberPad,
          autofocus: autofocus,
          focusNode: focusNode,
          decoration: InputDecoration(
            hintText: "invite_activity_input_hint".tr,
            hintStyle: TextStyle(
              color: Get.theme.textSelectionTheme.selectionColor,
              fontSize: 14,
              fontFamily: "PingFangSC-Regular",
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
            counterText: '',
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            contentPadding: EdgeInsets.zero,
            prefixIcon: Container(
              width: 60.w,
              height: 48.w,
              alignment: Alignment.center,
              margin: EdgeInsets.only(right: 12.w),
              child: ObText(
                'invite_activity_input_lable'.tr,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorName.colorTextWhite60,
                ),
              ),
            ),
            prefixIconConstraints: BoxConstraints(
              minWidth: 60.w,
            ),
          ),
        ),
      ),
    );
  }
}

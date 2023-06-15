import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'input_below_border.dart';
import 'package:get/get.dart';

class InputAmount extends InputBelowBorder {
  InputAmount({
    Key? key,
    String? hint,
    TextEditingController? controller,
    FormFieldValidator<String>? validator,
    List<TextInputFormatter>? inputFormatters,
    bool showSuffix = false,
    bool autofocus = false,
    String? suffixTxt,
    Function()? onTapSuffix,
    FocusNode? focusNode,
    TextStyle? hintStyle,
    bool? enabled,
    bool showSuffixIcon = false,
    Widget? suffixIcon,
    EdgeInsetsGeometry? contentPadding,
    TextInputType keyboardType = CustomNumberKeyboard.inputIntNumberPad,
  }) : super(
          key: key,
          height: 45.w,
          enabled: enabled,
          maxLength: 15,
          autofocus: autofocus,
          focusNode: focusNode,
          validator: validator ?? noEmptyValidator,
          inputFormatters: inputFormatters,
          controller: controller,
          hintStyle: hintStyle ?? TextStyle(wordSpacing: -1.5,
              fontFamily: "PingFangSC-Regular",
              fontSize: LocaleUtils.isLocale?12:14,
              color: Colors.white.withOpacity(0.3)),
          keyboardType: keyboardType,
          hintText: hint,
          contentPadding: contentPadding,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontFamily: FontFamily.gothamMedium,
            package: BaseX.pkg2,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: Container(
            width: 16.w,
            alignment: Alignment.center,
            margin: EdgeInsets.only(right: 8.w, top: 5.w),
            child: Text(
              'symbol'.tr,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          prefixIconConstraints: BoxConstraints(
            minWidth: 16.w,
          ),
          suffixIconConstraints: BoxConstraints(maxWidth: 78.w),
          suffixIcon: showSuffixIcon
              ? suffixIcon
              : Visibility(
                  visible: showSuffix,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {
                      onTapSuffix?.call();
                    },
                    child: Row(
                      children: [
                        Text(
                          '$suffixTxt',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Color(0xffE1A100),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
        );
}

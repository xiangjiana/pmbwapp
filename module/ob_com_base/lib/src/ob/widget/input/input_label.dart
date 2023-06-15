import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_textfield.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class InputLabel extends StatelessWidget {
  InputLabel({
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.focusNode,
    this.keyboardType,
    this.maxLength,
    this.errorText = "",
    this.labelText = "",
    this.hint,
    this.autofocus = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.isError = false,
    this.enabled = true,
    this.obscureText = false,
    this.height,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final String errorText;
  final String labelText;
  final String? hint;
  final bool autofocus;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final bool isError;
  final bool enabled;
  final bool obscureText;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: labelText.isNotEmpty,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              labelText,
              style: const TextStyle(
                color: ColorName.colorTextWhite60,
                fontSize: 14,
              ),
            ),
          ),
        ),
        Container(
          decoration: _setBorderSide(),
          width: double.infinity,
          height: height??36.w,
          alignment: Alignment.centerLeft,
          child: ObInputTextField(
            enabled: enabled,
            editingController: controller,
            maxLength: maxLength,
            inputFormatters: inputFormatters,
            obscureText:obscureText,
            autofocus: autofocus,
            onChanged: onChanged,
            focusNode: focusNode,
            keyboardType: keyboardType,
            hintText: hint,
            style: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Get.theme.colorScheme.primary,
              fontFamily: "PingFangSC-Regular",
              fontWeight: FontWeight.w400,
            ),
            hintStyle: TextStyle(
              fontSize: 14,
              height: 1.2,
              color: Get.theme.textSelectionTheme.selectionColor,
              fontFamily: "PingFangSC-Regular",
              fontWeight: FontWeight.w400,
            ),
            prefixIcon: prefixIcon,
            prefixIconConstraints: prefixIconConstraints,
            suffixIcon: suffixIcon,
            suffixIconConstraints: suffixIconConstraints,
            contentPadding: EdgeInsets.symmetric(vertical: 8.w),
          ),
        ),
        Visibility(
          visible: isError,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              errorText,
              textAlign: TextAlign.start,
              style: TextStyle(fontSize: 12.0, color: ColorName.redFF5722), 
            ),
          ),
        ),
      ],
    );
  }

  Decoration _setBorderSide() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: isError
              ? ColorName.colorMain
              : Get.theme.colorScheme.primary.withOpacity(.06),
          width: 1.0,
        ),
      ),
    );
  }
}

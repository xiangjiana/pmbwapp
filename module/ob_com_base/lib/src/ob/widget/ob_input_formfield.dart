import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/utils/form_utils.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ObInputFormField extends StatelessWidget {
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final TextStyle? style;
  final String? hintText;
  final TextStyle? hintStyle;
  final Decoration? border;
  final FloatingLabelBehavior? floatingLabelBehavior;
  final EdgeInsetsGeometry? contentPadding;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? maxLength;
  final TextAlign textAlign;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final double? height;

  ObInputFormField({
    Key? key,
    this.height,
    this.controller,
    this.validator,
    this.inputFormatters,
    this.keyboardType,
    this.hintText,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.contentPadding,
    this.focusNode,
    this.border,
    this.autofocus = false,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.enabled,
    this.onChanged,
    TextStyle? style,
    TextStyle? hintStyle,
    FloatingLabelBehavior? floatingLabelBehavior,
  })  : this.style = style ??
            const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
        this.hintStyle = hintStyle ??
            TextStyle(
              fontFamily: "PingFangSC-Regular",
              fontSize: 14,
              color: Colors.white.withOpacity(0.3),
            ),
        this.floatingLabelBehavior =
            floatingLabelBehavior ?? FloatingLabelBehavior.never,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget child = Theme(
      data: Theme.of(context).copyWith(platform: TargetPlatform.android),
      child: TextFormField(
        maxLength: maxLength,
        validator: validator ?? noEmptyValidator,
        inputFormatters: inputFormatters,
        controller: controller,
        keyboardType: keyboardType,
        style: style,
        autofocus: autofocus,
        focusNode: focusNode,
        textAlign: textAlign,
        enabled: enabled,
        onChanged: onChanged,
        cursorColor: Get.theme.textSelectionTheme.cursorColor,
        textAlignVertical: TextAlignVertical.center,
        // enableInteractiveSelection: false,
        toolbarOptions: const ToolbarOptions(
          copy: false,
          paste: false,
          cut: false,
          selectAll: false,
        ),
        // onTap: () {
        //   controller?.selection = TextSelection.fromPosition(
        //     TextPosition(offset: controller!.text.length),
        //   );
        // },
        decoration: InputDecoration(
          counterText: '',
          errorText: '',
          isCollapsed: true,
          hintMaxLines: 2,
          contentPadding:
              contentPadding ?? EdgeInsets.only(top: 0.w, bottom: 0.w),
          hintText: hintText,
          hintStyle: hintStyle,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          errorStyle: const TextStyle(height: 0),
          floatingLabelBehavior: floatingLabelBehavior,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
        ),
      ),
    );
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        child,
        Container(
          height: 1.w,
          width: double.infinity,
          decoration: border,
        ),
      ],
    );
  }
}

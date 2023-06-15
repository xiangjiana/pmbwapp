import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'dart:html' if (dart.library.io) '../utils/html_stub.dart' as html;

enum RimStyle {
  none,
  customize,
}

class ObInputTextField extends StatelessWidget {
  final TextEditingController? editingController;
  final ValueChanged<String>? onChanged;
  final bool? enabled;
  final bool autofocus;
  final bool obscureText;
  final List<TextInputFormatter>? inputFormatters;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final TextInputType? keyboardType;
  final Decoration? decoration;
  final TextStyle? style;
  final TextStyle? hintStyle;
  final InputBorder? border;
  final InputBorder? focusedBorder;
  final InputBorder? errorBorder;
  final String? hintText;
  final FocusNode? focusNode;
  final ValueChanged<String>? onSubmitted;
  final EdgeInsetsGeometry? contentPadding;
  final int? maxLength;
  final double? width;
  final double? height;
  final RimStyle rimStyle;

  ObInputTextField({
    Key? key,
    this.width,
    this.height,
    this.editingController,
    this.onChanged,
    this.inputFormatters,
    this.enabled = true,
    this.focusNode,
    this.autofocus = false,
    this.obscureText = false,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.hintText,
    this.keyboardType = TextInputType.streetAddress,
    this.onSubmitted,
    this.contentPadding,
    this.maxLength,
    this.rimStyle = RimStyle.none,
    Decoration? decoration,
    TextStyle? style,
    TextStyle? hintStyle,
    InputBorder? border,
    InputBorder? focusedBorder,
    InputBorder? errorBorder,
  })  : this.decoration = decoration ??
            BoxDecoration(
              borderRadius: BorderRadius.circular(24.w),
            ),
        this.style = style ??
            TextStyle(
              fontSize: 16,
              height: 1.2,
              color: Get.theme.colorScheme.primary,
              fontFamily: "PingFangSC-Regular",
              fontWeight: FontWeight.w400,
            ),
        this.hintStyle = hintStyle ??
            TextStyle(
              fontSize: 16,
              height: 1.2,
              color: Get.theme.textSelectionTheme.selectionColor,
              fontFamily: "PingFangSC-Regular",
              fontWeight: FontWeight.w400,
            ),
        this.border = border ?? InputBorder.none,
        this.focusedBorder = focusedBorder,
        this.errorBorder = errorBorder ?? InputBorder.none,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    Color? fillColor;
    InputBorder? focusedBorderDefault;
    if (rimStyle == RimStyle.customize) {
      fillColor = Color(0xff1a1c20);
      focusedBorderDefault = focusedBorder ??
          OutlineInputBorder(
            borderRadius: BorderRadius.circular(0),
            borderSide: BorderSide(
              color: Color.fromARGB(255,87, 194, 0),
              width: 1.0,
            ),
          );
    } else {
      focusedBorderDefault = focusedBorder ?? InputBorder.none;
    }

    Widget child = Theme(
      data: Theme.of(context).copyWith(
        platform: TargetPlatform.android,
      ),
      child: TextField(
        enabled: enabled,
        maxLength: maxLength,
        inputFormatters: inputFormatters,
        controller: editingController,
        cursorColor: ColorName.colorMain,
        onChanged: onChanged,
        obscureText: obscureText,
        keyboardType: keyboardType,
        textAlignVertical: TextAlignVertical.center,
        focusNode: focusNode,
        autofocus: autofocus,
        style: style,
        onSubmitted: onSubmitted,
        enableInteractiveSelection: kIsWeb ? false : true,//h5这个flutter的选择文字菜单与浏览器原生的有点冲突，需要屏蔽
        decoration: InputDecoration(
          counterText: "",
          isCollapsed: true,
          filled: rimStyle == RimStyle.customize ? true : false,
          fillColor: fillColor,
          hintText: hintText,
          hintMaxLines: 1,
          hintStyle: hintStyle,
          contentPadding:
              contentPadding ?? EdgeInsets.only(top: kIsWeb?20.w:14.w, bottom: 14.w),//web上输入的文字偏上不居中
          enabledBorder: InputBorder.none,
          border: border,
          focusedBorder: focusedBorderDefault,
          disabledBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          prefixIcon: prefixIcon,
          prefixIconConstraints: prefixIconConstraints,
          suffixIcon: suffixIcon,
          suffixIconConstraints: suffixIconConstraints,
        ),
      ),
    );

    if (rimStyle == RimStyle.customize) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(0.w),
        child: Container(
          width: width ?? double.infinity,
          height: height,
          decoration: decoration,
          //夸克浏览器用BackdropFilter做毛玻璃会导致ClipRRect失效导致输入框变成矩形，判断如果是Quark浏览器那么不要BackdropFilter
          child: child,
        ),
      );
    } else {
      return child;
    }
  }
}

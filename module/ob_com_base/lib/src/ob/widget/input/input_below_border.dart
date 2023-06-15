import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_formfield.dart';

class InputBelowBorder extends StatefulWidget {
  final TextEditingController? controller;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final TextInputType? keyboardType;
  final bool autofocus;
  final FocusNode? focusNode;
  final String? hintText;
  final Widget? prefixIcon;
  final BoxConstraints? prefixIconConstraints;
  final Widget? suffixIcon;
  final BoxConstraints? suffixIconConstraints;
  final Decoration? borderSide;
  final int? maxLength;
  final TextAlign textAlign;
  final bool? enabled;
  final ValueChanged<String>? onChanged;
  final double? height;
  final TextStyle? style;
  final bool isError;
  final TextStyle? hintStyle;
  final EdgeInsetsGeometry? contentPadding;

  const InputBelowBorder({
    Key? key,
    this.controller,
    this.inputFormatters,
    this.validator,
    this.keyboardType,
    this.autofocus = false,
    this.focusNode,
    this.hintStyle,
    this.hintText,
    this.prefixIcon,
    this.prefixIconConstraints,
    this.contentPadding,
    this.suffixIcon,
    this.suffixIconConstraints,
    this.borderSide,
    this.maxLength,
    this.textAlign = TextAlign.start,
    this.enabled,
    this.onChanged,
    this.height,
    this.style,
    this.isError = false,
  });

  @override
  _InputTextFieldState createState() => _InputTextFieldState();
}

class _InputTextFieldState extends State<InputBelowBorder> {
  late Decoration borderSide;
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    borderSide = widget.borderSide ?? _setBorderSide(false);
    focusNode.addListener(() {
      setState(() {
        borderSide = _setBorderSide(focusNode.hasFocus);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return ObInputFormField(
      height: widget.height,
      enabled: widget.enabled,
      maxLength: widget.maxLength,
      validator: widget.validator,
      inputFormatters: widget.inputFormatters,
      controller: widget.controller,
      textAlign: widget.textAlign,
      autofocus: widget.autofocus,
      focusNode: widget.focusNode,
      hintStyle: widget.hintStyle,
      keyboardType: widget.keyboardType,
      border: borderSide,
      style: widget.style,
      hintText: widget.hintText,
      prefixIcon: widget.prefixIcon,
      prefixIconConstraints: widget.prefixIconConstraints,
      suffixIcon: widget.suffixIcon,
      suffixIconConstraints: widget.suffixIconConstraints,
      contentPadding: widget.contentPadding,
      onChanged: widget.onChanged,
    );
  }

  Decoration _setBorderSide(bool flag) {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: widget.isError
              ? ColorName.colorMain
              : flag
                  ? Get.theme.colorScheme.primary.withOpacity(.10)
                  : Get.theme.colorScheme.primary.withOpacity(.06),
          width: 1.0,
        ),
      ),
    );
  }
}

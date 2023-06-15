import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/utils/form_utils.dart';

class ObTextField extends StatelessWidget {
  /// 标签
  final String? labelText;

  /// 标签风格
  final TextStyle? labelStyle;

  /// 占位符
  final String? hintText;

  /// 占位符风格
  final TextStyle? hintStyle;

  /// 是否只读
  final bool readOnly;

  /// 焦点
  FocusNode? focusNode;

  /// 编辑控制器
  final TextEditingController? controller;

  /// 约束
  final List<TextInputFormatter>? inputFormatters;

  /// 改变回调
  final ValueChanged<String>? onChanged;

  /// 自动焦点
  final bool autofocus;

  /// 是否可用
  final bool enabled;

  /// 点击事件
  final VoidCallback? onTap;

  /// 输入款边距
  final EdgeInsetsGeometry inputPadding;

  /// 内容风格
  final TextStyle? contentStyle;

  /// 右边图标大小约束
  final BoxConstraints? suffixIconConstraints;

  /// 右边图标
  final Widget? suffixIcon;

  /// 是否因此右边图标
  final bool isHiddenSuffixIcon;

  /// 是否因此分割线
  final bool isHiddenSeparated;

  /// 是否密文输入
  final bool obscureText;

  /// 最大输入限制
  final int? maxLength;

  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onEditingComplete;

  /// TextField总体边距
  final EdgeInsetsGeometry padding;
  TextInputType? keyboardType;

  final FormFieldValidator<String>? validator;

  final Widget? prefixIcon;

  final BoxConstraints? prefixIconConstraints;

  ObTextField(
      {this.labelText,
      this.labelStyle = const TextStyle(
        fontSize: 14,
        color: Colors.white60,
      ),
      this.hintText,
      this.hintStyle = const TextStyle(
        fontSize: 14,
        color: Colors.white30,
      ),
      this.suffixIcon,
      this.focusNode ,
      this.controller,
      this.inputFormatters,
      this.onChanged,
      this.onTap,
      this.contentStyle = const TextStyle(
        fontSize: 14,
        color: Colors.white,
      ),
      this.onEditingComplete,
      this.onSubmitted,
      this.keyboardType,
      this.isHiddenSuffixIcon = true,
      this.suffixIconConstraints =
          const BoxConstraints(minHeight: 16, minWidth: 16),
      this.readOnly = false,
      this.autofocus = false,
      this.enabled = true,
      this.obscureText = false,
      this.maxLength,
      this.isHiddenSeparated = false,
      this.padding = const EdgeInsets.only(bottom: 8),
      this.inputPadding = const EdgeInsets.only(top: 8, bottom: 8),
      this.validator,
      this.prefixIcon,
      this.prefixIconConstraints});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
        onTap: (){
          this.onTap?.call();
        },
        behavior: HitTestBehavior.translucent,
        child: Container(
          padding: this.padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                this.labelText ?? '',
                style: this.labelStyle,
              ),
              Padding(
                  padding: this.inputPadding,
                  child: Theme(
                    data: Theme.of(context)
                        .copyWith(platform: TargetPlatform.android),
                    child: TextFormField(
                      focusNode: focusNode,
                      autofocus: this.autofocus,
                      onFieldSubmitted: this.onSubmitted,
                      validator: this.validator ?? noEmptyValidator,
                      readOnly: this.readOnly,
                      onTap: this.onTap,
                      enabled: this.enabled,
                      controller: this.controller,
                      style: this.contentStyle,
                      inputFormatters: this.inputFormatters,
                      keyboardType: this.keyboardType,
                      obscureText: this.obscureText,
                      maxLength: this.maxLength,
                      onChanged: this.onChanged,
                      onEditingComplete: this.onEditingComplete,
                      decoration: InputDecoration(
                        counterText: '',
                        errorText: '',
                        errorStyle: TextStyle(
                          color: Colors.red,
                          height: 1.1,
                        ),
                        border: InputBorder.none,
                        isCollapsed: true,
                        focusedBorder: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        disabledBorder: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        hintText: this.hintText,
                        hintStyle: this.hintStyle,
                        prefixIcon: this.prefixIcon,
                        prefixIconConstraints: this.prefixIconConstraints,
                        suffixIconConstraints: this.suffixIconConstraints,
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                        suffixIcon: this.isHiddenSuffixIcon == true
                            ? null
                            : (this.suffixIcon ??
                            ObImage.asset(
                              Assets.images.icon.homeMoreRight.path,
                              width: 16.w,
                              height: 16.w,
                            )),
                      ),
                    ),
                  )),
              Offstage(
                offstage: this.isHiddenSeparated,
                child: Divider(
                  height: 1,
                  color: Colors.white.withOpacity(0.08),
                ),
              )
            ],
          ),
        ));
  }
}

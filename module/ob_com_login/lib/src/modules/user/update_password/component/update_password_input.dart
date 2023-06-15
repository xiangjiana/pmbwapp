import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class PasswordInput extends StatefulWidget {
  final String? labelText;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final TextEditingController controller;
  final VoidCallback? onLookOver;
  final bool isPassword;
  final String errorText;

  const PasswordInput(
      {Key? key,
      this.labelText,
      this.hintText,
      this.onChanged,
      this.onLookOver,
      this.isPassword = false,
      this.errorText = "",
      required this.controller})
      : super(key: key);

  @override
  _PasswordInputStats createState() => _PasswordInputStats();
}

class _PasswordInputStats extends State<PasswordInput> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        children: [
          TextField(
            controller: widget.controller,
            maxLength: 12,
            keyboardType: TextInputType.streetAddress,
            obscureText: widget.isPassword,
            onChanged: widget.onChanged,
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp('^[a-z0-9A-Z]+'))
            ],
            decoration: InputDecoration(
              hintText: widget.hintText,
              labelText: widget.labelText,
              counterText: '',
              suffixIcon: GestureDetector(
                onTap: widget.onLookOver,
                child: Container(
                  width: 24.w,
                  margin: EdgeInsets.only(top: 24.w),
                  alignment: Alignment.bottomRight,
                  child: widget.isPassword
                      ? pkObImage(Assets.images.icon.loginEyeOn.path)
                      : pkObImage(Assets.images.icon.loginEye.path),
                ),
              ),
              suffixIconConstraints: BoxConstraints(
                minWidth: 24.w,
                minHeight: 24.w,
              ),
            ),
          ),
          Visibility(
            visible: widget.errorText.isNotEmpty,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.errorText,
                textAlign: TextAlign.start,
                style: const TextStyle(fontSize: 12.0, color: ColorName.redFF5722), 
              ),
            ),
          ),
        ],
      ),
    );
  }
}

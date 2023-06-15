import 'dart:ui';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/src/ob/widget/custom_number_keyboard.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_textfield.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class InputVerifyCode extends StatefulWidget {
  InputVerifyCode({
    Key? key,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.sendCode,
    this.onErrorText,
    TimerUtil? timerUtil,
  }) : timerUtil = timerUtil ?? TimerUtil();

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final FocusNode? focusNode;
  final Function()? sendCode;
  final VoidCallback? onErrorText;
  final TimerUtil timerUtil;

  @override
  _InputVerifyCodeState createState() => _InputVerifyCodeState();
}

class _InputVerifyCodeState extends State<InputVerifyCode> {
  String _autoCodeText = "login_error_get_code".tr;
  int mTimeCount = 0;
  int totalTime = 59 * 1000;

  @override
  void initState() {
    super.initState();
    if (widget.timerUtil.isActive()) {
      widget.timerUtil.startCountDown();
    } else {
      widget.timerUtil.setInterval(1000);
      widget.timerUtil.setTotalTime(totalTime);
      widget.timerUtil.setOnTimerTickCallback((int tick) {
        double _tick = tick / 1000;
        if (_tick.toInt() == 0) {
          _autoCodeText = "bind_email_reacquire".tr;
          mTimeCount = 0;
          if (widget.onErrorText != null) widget.onErrorText!();
          widget.timerUtil.setTotalTime(totalTime);
          widget.timerUtil.cancel();
        } else {
          _autoCodeText = "${_tick.toInt()}" + 's';
        }
        setState(() {
          mTimeCount = _tick.toInt();
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ObInputTextField(
      rimStyle: RimStyle.customize,
      editingController: widget.controller,
      onChanged: widget.onChanged,
      autofocus: false,
      hintText: "login_error_code".tr,
      focusNode: widget.focusNode,
      inputFormatters: [
        LengthLimitingTextInputFormatter(6),
        FilteringTextInputFormatter.digitsOnly, //设置只允许输入数字
      ],
      focusedBorder: InputBorder.none,
      prefixIcon: Container(
        width: 24.w,
        height: 24.w,
        margin: EdgeInsets.only(right: 12.w, left: 24.w),
        child: pkObImage(
          Assets.images.icon.loginCode.path,
          fit: BoxFit.cover,
        ),
      ),
      prefixIconConstraints: BoxConstraints(
        minWidth: 24.w,
        minHeight: 24.w,
      ),
      suffixIcon: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          if (mTimeCount <= 0) {
            widget.sendCode?.call();
          }
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _autoCodeText,
              softWrap: false,
              style: TextStyle(
                  color: Get.theme.selectedRowColor,
                  fontFamily: "PingFangSC-Regular",
                  wordSpacing: -1.5,
                  fontSize: 13,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.end,
            )
          ],
        ),
      ),
      suffixIconConstraints: BoxConstraints(
        minWidth: 98.w,
      ),
      keyboardType: CustomNumberKeyboard.inputNormalType,
    );
  }
}

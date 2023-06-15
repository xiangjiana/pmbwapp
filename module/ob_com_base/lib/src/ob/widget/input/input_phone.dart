import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_com_base/src/ob/utils/store.dart';
import 'package:ob_com_base/src/ob/widget/custom_number_keyboard.dart';
import 'package:ob_com_base/src/ob/widget/ob_image.dart';
import 'package:ob_com_base/src/ob/widget/ob_input_textfield.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'calling_code_select.dart';

class InputPhone extends StatelessWidget {
  InputPhone(
      {this.txtAreaCode,
        this.onAreaCodeChoose,
        this.inputFormatters,
        this.controller,
        this.onChanged,
        this.autofocus,
        this.enabled,
        this.maxLength,
        this.enableClean = false,
        this.onCleanTap,
        this.focusNode});

  final ValueChanged<String>? onAreaCodeChoose;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final bool? autofocus;
  final bool? enabled;
  final String? txtAreaCode;
  final int? maxLength;
  final bool enableClean;
  final GestureTapCallback? onCleanTap;

  @override
  Widget build(BuildContext context) {
    return ObInputTextField(
      rimStyle: RimStyle.customize,
      editingController: controller,
      onChanged: onChanged,
      enabled: enabled,
      maxLength: maxLength,
      hintText: "user_phone".tr,
      inputFormatters: inputFormatters,
      focusedBorder: InputBorder.none,
      focusNode: focusNode,
      prefixIcon: GestureDetector(
        onTap: () {
          _showCallingCodeBottomSheet(context, focusNode);
        },
        child: GestureDetector(
          //GestureDetector包裹Container并设置behavior解决透明点击国家区号下方部位弹出键盘问题（OBDJ96）
          behavior: HitTestBehavior.opaque,
          child: Container(
            padding: EdgeInsets.only(left: 20.w),
            height: 50.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '$txtAreaCode',
                  style: const TextStyle(
                    color: ColorName.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(
                      minWidth: 7.w, //宽度尽可能大
                      maxWidth: 17.w),
                ),
                pkObImage(
                  Assets.images.icon.homeZhanghaoMore.path,
                  width: 16.w,
                  height: 16.w,
                ),
              ],
            ),
          ),
        ),
      ),
      prefixIconConstraints: BoxConstraints(
        minWidth: 84.w,
        maxWidth: 84.w,
      ),
      suffixIcon: Container(
          constraints: BoxConstraints(minWidth: 24.w, maxWidth: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
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
      keyboardType: CustomNumberKeyboard.inputIntNumberPad,
    );
  }

  // Choose
  void _showCallingCodeBottomSheet(context, focusNode) async {
    hideKeyboard(context, focusNode);
    await Get.bottomSheet<UiCallingCode>(
      CallingCodeSelect(
        uiCallingCode: Store.callingCode,
        selectId: txtAreaCode,
        onAreaCodeChoose: onAreaCodeChoose,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w))),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
    );
  }

  void hideKeyboard(context, FocusNode? focusNode) {
    if (focusNode != null) {
      if (!focusNode.hasFocus) {
        focusNode.canRequestFocus = false;
        Future.delayed(Duration(milliseconds: 800), () {
          focusNode.canRequestFocus = true;
        });
      } else {
        focusNode.unfocus();
      }
      return;
    }
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class InputPhoneLabel extends StatelessWidget {
  InputPhoneLabel({
    this.controller,
    this.onChanged,
    this.inputFormatters,
    this.focusNode,
    this.maxLength,
    this.errorText = "",
    this.autofocus = false,
    this.isError = false,
    this.enabled = true,
    this.txtAreaCode = '',
    this.onAreaCodeChoose,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final List<TextInputFormatter>? inputFormatters;
  final FocusNode? focusNode;
  final int? maxLength;
  final String errorText;
  final bool autofocus;
  final bool isError;
  final bool enabled;
  final String txtAreaCode;
  final ValueChanged<String>? onAreaCodeChoose;

  @override
  Widget build(BuildContext context) {
    return InputLabel(
      maxLength: maxLength,
      controller: controller,
      enabled: enabled,
      onChanged: onChanged,
      hint: 'please_enter'.tr,
      labelText: 'user_phone'.tr,
      errorText: errorText,
      isError: isError,
      prefixIcon: GestureDetector(
        onTap: () {
          KeyboardUtil().hideKeyboard(context);
          _showCallingCodeBottomSheet(context, focusNode);
        },
        child: Container(
          color: Colors.transparent,
          height: 40.w,
          child: Row(
            children: [
              Text(
                txtAreaCode,
                style: const TextStyle(
                  color: ColorName.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(width: 4.w),
              pkObImage(
                Assets.images.icon.homeZhanghaoMore.path,
                width: 16.w,
                height: 16.w,
              ),
            ],
          ),
        ),
      ),
      prefixIconConstraints: BoxConstraints(
        minWidth: 48.w,
        maxWidth: 68.w,
      ),
      keyboardType: CustomNumberKeyboard.inputIntNumberPad,
    );
  }

  void _showCallingCodeBottomSheet(context, focusNode) async {
    hideKeyboard(context, focusNode);

    await showSheet<UiCallingCode>(
      context,
      CallingCodeSelect(
        uiCallingCode: Store.callingCode,
        selectId: txtAreaCode,
        onAreaCodeChoose: onAreaCodeChoose,
      ),
      bodyColor: const Color(0xff1D2933),
    );
  }

  void hideKeyboard(context, FocusNode? focusNode) {
    if (focusNode != null) {
      if (!focusNode.hasFocus) {
        focusNode.canRequestFocus = false;
        Future.delayed(const Duration(milliseconds: 800), () {
          focusNode.canRequestFocus = true;
        });
      } else {
        focusNode.unfocus();
      }
      return;
    }
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

  Future<T?> showSheet<T>(
    BuildContext context,
    Widget body, {
    bool scrollControlled = false,
    Color bodyColor = Colors.white,
    EdgeInsets? bodyPadding,
    BorderRadius? borderRadius,
  }) {
    const radius = Radius.circular(16);
    borderRadius ??= const BorderRadius.only(topLeft: radius, topRight: radius);
    bodyPadding ??= const EdgeInsets.all(0);
    return showModalBottomSheet(
        context: context,
        elevation: 0,
        backgroundColor: bodyColor,
        shape: RoundedRectangleBorder(borderRadius: borderRadius),
        barrierColor: Colors.transparent,
        constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height -
                MediaQuery.of(context).viewPadding.top),
        isScrollControlled: scrollControlled,
        builder: (ctx) => Padding(
              padding: EdgeInsets.only(
                left: bodyPadding!.left,
                top: bodyPadding.top,
                right: bodyPadding.right,
                // B处
                bottom:
                    bodyPadding.bottom + MediaQuery.of(ctx).viewPadding.bottom,
              ),
              child: body,
            ));
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class RemitterTextFiled extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode nameFocus;

  const RemitterTextFiled({Key? key, this.controller, required this.nameFocus})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(nameFocus);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            margin: EdgeInsets.only(right: 12.w),
            child: Text(
              'deposit_name'.tr,
              style: TextStyle(
                fontSize: 14,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(height: 12.w),
          InputBelowBorder(
            height: 36.w,
            focusNode: nameFocus,
            autofocus: Store.isAutoFocus,
            maxLength: 15,
            controller: controller,
            validator: noEmptyValidator,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[\u4e00-\u9fa5_a-zA-Z·]'),//需求要能输入·这个字符(OBDJ16)
              )
            ],
            textAlign: TextAlign.start,
            hintText: 'deposit_name_input_hint'.tr,
            keyboardType: TextInputType.streetAddress,
          ),
          SizedBox(height: 12.w),
          Text(
            '*' + 'deposit_remarks'.tr,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white.withOpacity(0.6),
              fontFamily: 'PingFangSC-Regular',
            ),
          ),
        ],
      ),
    );
  }
}

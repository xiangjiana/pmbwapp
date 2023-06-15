import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

//横线
class DividerLine extends StatelessWidget  {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.textSelectionTheme.selectionHandleColor,
      height: 8.w,
    );
  }
}
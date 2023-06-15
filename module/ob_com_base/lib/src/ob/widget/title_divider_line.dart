import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class TitleDividerLine extends StatelessWidget implements PreferredSizeWidget {
  TitleDividerLine({
    Key? key,
    double? height,
  })  : this.height = Size.fromHeight(height ?? 8.w),
        super(key: key);

  final Size height;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Get.theme.textSelectionTheme.selectionHandleColor,
      height: 8.w,
    );
  }

  @override
  Size get preferredSize => height;
}

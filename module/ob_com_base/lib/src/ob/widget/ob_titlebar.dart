import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'ob_image.dart';

class ObTitleBar extends StatelessWidget {
  Function()? back;
  List<Widget>? actions;
  late String title;

  ObTitleBar({this.back, this.actions, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Container(
        height: 49.w,
        color: Get.theme.backgroundColor,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            GestureDetector(
              onTap: () {
                if (back != null) {
                  back!();
                } else {
                  Get.back();
                }
              },
              child: Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 16.w),
                child: pkObImage(
                  Assets.images.icon.comBack.path,
                  height: 24.w,
                  width: 24.w,
                ),
              ),
            ),
            Center(
              child: Text(
                title,
                style: TextStyle(
                  color: Get.theme.colorScheme.primary,
                  fontSize: 16,
                ),
              ),
            ),
            if (actions != null)
              Align(
                  alignment: Alignment.centerRight,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: actions!,
                  ))
          ],
        ),
      ),
    );
  }
}

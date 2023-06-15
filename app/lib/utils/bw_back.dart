import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class BwBackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.back();
      },
      child: SizedBox(
        width: 40.w,
        height: 49.h,
        child: Center(
          child: pkObImage(
            Assets.images.icon.comBack.path,
            width: 24,
            height: 24,
          ),
        ),
      ),
    );
  }
}

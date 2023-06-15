import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/gen/colors.gen.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';

class WarningTip extends StatelessWidget {
  WarningTip({
    Key? key,
    this.text,
  }) : super(key: key);

  String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 12.w,
      ),
      color: ColorName.colorEmbellish.withOpacity(0.06),
      child: Text(
        text??'plz_get_account_every_time'.tr,
        style: TextStyle(
          fontSize: 12.w,
          fontWeight: FontWeight.w400,
          color: Get.theme.selectedRowColor,
        ),
      ),
    );
  }
}

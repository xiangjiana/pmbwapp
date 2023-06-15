import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/utils/event_utils.dart';

class ObNavigationBarTitle extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final String? curRunTimeType;

  ObNavigationBarTitle(
    this.data, {
    Key? key,
    this.style,
    this.curRunTimeType,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        eventBus.fire(GlobalBackTopEvent(eventRunTimeType: curRunTimeType));
      },
      child: Text(
        data,
        style: TextStyle(
          fontSize: 16,
          color: Get.theme.colorScheme.primary,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';

class FeedBackLabelRow extends StatelessWidget {
  final String text;

  FeedBackLabelRow(this.text);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 16.w),
        child: Row(
          children: [
            Container(
              width: 2.w,
              height: 12.w,
              decoration: BoxDecoration(
                color: Get.theme.selectedRowColor,
                borderRadius: BorderRadius.circular(2.w),
              ),
              margin: EdgeInsets.only(right: 12.w),
            ),
            Text(text,style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Get.theme.colorScheme.primary,
            ),)
          ],
        ));
  }
}

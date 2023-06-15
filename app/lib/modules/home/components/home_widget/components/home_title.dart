import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

class HomeIndexTitle extends StatelessWidget {
  final String title;
  final String content;

  HomeIndexTitle({required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      height: 70.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: EdgeInsets.only(left: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "$title",
                  style: TextStyle(
                    fontSize: 14,
                    color: Get.theme.colorScheme.primary.withOpacity(.6),
                  ),
                ),
                SizedBox(
                  height: 4.w,
                ),
                Text(
                  "$content",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.only(bottom: 12.w, right: 16.w),
            child: Row(
              children: [
                Text(
                  "home_reading_more_lable".tr,
                  style: TextStyle(
                    color: Get.theme.colorScheme.primary.withOpacity(.3),
                    fontSize: 12,
                  ),
                ),
                SizedBox(width: 4.w),
                ObImage.asset(
                  Assets.images.icon.homeMoreRight.path,
                  width: 16.w,
                  height: 16.w,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

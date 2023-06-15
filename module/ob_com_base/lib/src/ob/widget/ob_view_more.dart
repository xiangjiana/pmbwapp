import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'ob_image.dart';

class ObViewMore extends StatelessWidget {
  const ObViewMore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 56.w,
      width: 152.w,
      margin: EdgeInsets.only(top: 12.w, bottom: 60.w),
      padding: EdgeInsets.all(12.w),
      child: Align(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.w),
            color: ColorName.colorMain.withOpacity(0.1),
          ),
          height: double.infinity,
          width: 128.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pkObImage(
                Assets.images.icon.homeDetailsMore.path,
                width: 16.w,
                height: 16.w,
              ),
              SizedBox(width: 8.w),
              Text(
                "deposit_see_more".tr,
                style: TextStyle(
                  fontSize: 14,
                  color: ColorName.colorMain1,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

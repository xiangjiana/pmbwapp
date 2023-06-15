import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'ob_image.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.w),
        Container(
          alignment: Alignment.center,
          child: pkObImage(Assets.images.queTongyongKong.path),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text(
          'bet_histories_nothing_look_elsewhere'.tr,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}

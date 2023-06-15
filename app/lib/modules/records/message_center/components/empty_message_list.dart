import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';

import 'package:get/get.dart';

class EmptyMessageList extends StatelessWidget {
  const EmptyMessageList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.w),
        Container(
          alignment: Alignment.center,
          child: ObImage.asset(Assets.images.queXiaoxi.path),
          // color: Colors.white.withOpacity(0.04),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text(
          'message_center_no_new_news_for_now'.tr,
          style: TextStyle(
            fontSize: 14,
            color: Colors.white.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class ActivityEmpty extends StatelessWidget {
  const ActivityEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.w),
        Container(
          alignment: Alignment.center,
          child: ObImage.asset(Assets.images.queJilu.path),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text(
          'agent_n_recharge_withdrawal_no_data'.tr,
          style: TextStyle(
            color: Colors.white.withOpacity(0.6),
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
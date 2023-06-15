import 'package:get/get.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class EmptyWithdraw extends StatelessWidget {
  const EmptyWithdraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 60.w),
        Container(
          alignment: Alignment.center,
          child: pkObImage(Assets.images.queJilu.path),
          // color: Colors.white.withOpacity(0.04),
          width: 234.w,
          height: 234.w,
        ),
        SizedBox(height: 12.w),
        Text('access_record_no_new_withdrawal_records'.tr,
            style: TextStyle(color: Colors.white.withOpacity(0.6))),
      ],
    );
  }
}

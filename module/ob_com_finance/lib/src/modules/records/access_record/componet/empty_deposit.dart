import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

class EmptyDeposit extends StatelessWidget {
  const EmptyDeposit({Key? key}) : super(key: key);

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
        Text('access_record_temporarily_no_new_deposit_records'.tr,
            style: TextStyle(color: Colors.white.withOpacity(0.6))),
        SizedBox(height: 12.w),
        OBasePrimaryButton(
          child: Text('access_record_deposit_now'.tr),
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          onPressed: () {
            //Get.toNamed(AppRoutes.DEPOSIT);
            GoUtils.goDeposit();
          },
        )
      ],
    );
  }
}

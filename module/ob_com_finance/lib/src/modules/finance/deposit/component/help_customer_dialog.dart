import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme,PrimaryButton;

class HelpCustomerDialog extends StatelessWidget {
  final String valetCode;
  const HelpCustomerDialog({Key? key, required this.valetCode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObDialog(
      insetPadding: EdgeInsets.all(16.w),
      background: ObTheming.obDialogBgColor,
      titleWidget: Row(
        children: [
          SizedBox(width: 24.w),
          Expanded(
            child: Text(
              'valet_recharge_code'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Get.theme.colorScheme.primary,
                fontWeight: FontWeight.w500,
                fontSize: 16,
              ),
            ),
          ),
          GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () {
              Get.back(result: false);
            },
            child: Padding(
              padding: EdgeInsets.all(10.0),
              child: pkObImage(
                Assets.images.icon.comCloseWhite.path,
                width: 24.w,
                height: 24.w,
              ),
            ),
          ),
        ],
      ),
      contentWidget: Column(
        children: [
          SizedBox(height: 16.w),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (int i = 0; i < valetCode.length; i++)
                Container(
                  width: 64.w,
                  height: 64.w,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Get.theme.colorScheme.primary.withOpacity(0.04),
                    borderRadius: BorderRadius.circular(4.w),
                  ),
                  child: Text(
                    '${valetCode[i]}',
                    style: TextStyle(
                      color: Get.theme.colorScheme.primary,
                      fontFamily: "DIN-Medium",
                      fontWeight: FontWeight.w500,
                      fontSize: 32,
                    ),
                  ),
                ),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 15.w),
            alignment: Alignment.centerLeft,
            child: Text(
              'warm_tips'.tr,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 4.w),
            child: Text(
              'valet_recharge_remarks'.tr,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Get.theme.colorScheme.primary.withOpacity(0.6),
              ),
            ),
          ),
        ],
      ),
      actionsWidget: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: 16.w),
        child: OBasePrimaryButton(
          size: ButtonSize.large,
          image: DecorationImage(
            image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
            fit: BoxFit.fill,
          ),
          child: Text(
            'valet_recharge_next_step'.tr,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: Get.theme.colorScheme.primary,
            ),
          ),
          onPressed: () {
            Get.back(result: true);
          },
        ),
      ),
    );
  }
}

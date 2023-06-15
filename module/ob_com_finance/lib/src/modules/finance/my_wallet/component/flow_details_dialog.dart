import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_finance/src/modules/finance/add_bank_account/component/tip.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme, PrimaryButton;

class FlowDetailsDialog extends StatelessWidget {
  final String activityName;
  final double billAmount;
  final double completeBillAmount;
  final double percentage;

  const FlowDetailsDialog({
    Key? key,
    required this.activityName,
    required this.billAmount,
    required this.completeBillAmount,
    required this.percentage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObDialog(
      background: ObTheming.obDialogBgColor,
      titleWidget: Text(
        'withdraw_flowing_water_details'.tr,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      contentWidget: Column(
        children: [
          Tip(
            padding: EdgeInsets.all(12.w),
            margin: EdgeInsets.only(top: 12.w, bottom: 16.w),
            borderRadius: 8.w,
            backgroundColor: Colors.white.withOpacity(0.04),
            child: Column(
              children: [
                TitleRow(
                  label: 'vip_level_submit_active'.tr,
                  value: activityName,
                ),
                SizedBox(height: 8.w),
                TitleRow(
                  label: 'my_wallet_required_running_water'.tr,
                  value: AppCurrencyUtils.dealBalance(billAmount.toString()),
                ),
                SizedBox(height: 8.w),
                TitleRow(
                  label: 'withdraw_flow_has_been_completed'.tr,
                  childValue: Row(
                    children: [
                      const Spacer(),
                      Text(
                        AppCurrencyUtils.dealBalance(
                          completeBillAmount.toString(),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(width: 16.w),
                      Text(
                        '${numberFormat((completeBillAmount / billAmount) * 100, comma: false)}%',
                        style: TextStyle(
                          fontSize: 12,
                          color: Get.theme.selectedRowColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actionsWidget: OBasePrimaryButton(
        child: Text(
          'vip_level_active_alert_know'.tr,
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
        image: DecorationImage(
          image: AssetImage(Assets.images.btnbg.path, package: BaseX.pkg),
          fit: BoxFit.fill,
        ),
        onPressed: () => Get.back(),
        size: ButtonSize.large,
        block: true,
      ),
    );
  }
}

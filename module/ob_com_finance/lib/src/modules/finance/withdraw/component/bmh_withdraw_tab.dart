import 'package:get/get.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/withdraw/component/refresh_lottie.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class BmhWithdrawTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (Store.clientId == Store.clientIdDJ)
          Padding(
            padding: EdgeInsets.only(
              left: 16.w,
              right: 16.w,
            ),
            child: Row(
              children: [
                Text(
                  "account_balance".tr,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
                SizedBox(
                  width: 4.w,
                ),
                Obx(
                  () => Text(
                    BalanceManager.formatCenterBalance,
                    style: TextStyle(
                      fontSize: 14,
                      color: Get.theme.colorScheme.primary,
                      fontFamily: "Gotham-Medium",
                    ),
                  ),
                ),
                SizedBox(
                  width: 7.5.w,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 8.w),
                  child: RefreshLottie(
                    width: 16.w,
                    height: 16.h,
                  ),
                ),
              ],
            ),
          ),
        Padding(
          padding: EdgeInsets.all(16.w),
          child: Store.clientId == Store.clientIdDJ
              ? pkObImage(Assets.images.picBaimahuiDj.path)
              : pkObImage(Assets.images.picBaimahui.path),
        ),
        if (Store.clientId != Store.clientIdDJ)
          Center(
            child: Text(
              'withdraw_recycle_all_the_wallet_amount_to_the_central_wallet'.tr,
              style: TextStyle(
                color: ColorName.colorTextWhite60,
                fontSize: 12,
              ),
            ),
          ),
        SizedBox(height: 6.w),
        Center(
          child: ContactCustomerService(
            prefixText: 'withdraw_having_trouble_withdrawing_money'.tr,
            jumpToAgentServicePage: Store.clientId == Store.clientIdFYB,
          ),
        ),
        SizedBox(height: 24.w),
      ],
    );
  }
}

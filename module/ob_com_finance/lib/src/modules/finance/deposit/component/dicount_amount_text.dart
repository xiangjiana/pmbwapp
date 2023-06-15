import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';

class DiscountAmountText extends StatelessWidget {
  final UiPayType? payType;

  const DiscountAmountText({Key? key, this.payType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: payType != null && payType!.activityGiveMaxMoney > 0,
      child: Text(
            "${'up_to_daily_deals'.tr} ${AppCurrencyUtils.getAppCurrencySymbol()}${AppCurrencyUtils.fixAmount(payType?.activityGiveMaxMoney?.toString(), suffix: 'K')}",
        style: TextStyle(
          color: Colors.white.withOpacity(0.6),
          fontSize: 12,
          fontFamily: 'PingFangSC-Regular',
        ),
        textAlign: TextAlign.end,
        maxLines: 3,
      ),
    );
  }
}

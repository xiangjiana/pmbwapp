

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../deposit/repository/ui_pay_type.dart';
import '../deposit_easy_controller.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';

class BaiMaView extends StatelessWidget {
  final DepositEasyController controller;
  final UiPayType payType;
  GestureTapCallback? serviceTap;
  BaiMaView(this.payType,this.controller,this.serviceTap);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.w,
        ),
        ObImage.network(
          payType.picture,
          width: double.infinity,
        ),
        ContactCustomerService(prefixText: 'deposit_customer_service'.tr,serviceTap:serviceTap,jumpToAgentServicePage: Store.clientId==Store.clientIdFYB,),
      ],
    );
  }
}

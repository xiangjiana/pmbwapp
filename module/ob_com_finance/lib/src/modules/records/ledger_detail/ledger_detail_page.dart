import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/ledger_detail/ledger_detail_controller.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:ob_com_base/ob_com_base.dart';

class LedgerDetailPage extends GetView<LedgerDetailController> {
  String amountText(double amount) {
    if (amount > 0) {
      return '+${ AppCurrencyUtils.dealBalance('${amount.fixed(2)}')}';
    }
    return '${AppCurrencyUtils.dealBalance('${amount.fixed(2)}')}';
  }

  Color amountColor(double amount) {
    return amount > 0 ? Color(0xff69E300) : Color(0xffFF5722);
  }

  String amountTextWhite(double amount) {
    return '${AppCurrencyUtils.dealBalance('${amount.fixed(2)}')}'.replaceFirst('-', '');
  }

  Color amountColorWhite(double amount) {
    return Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('ledger_detail_transaction_details'.tr),
          leading: ObBackButton(),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
                SizedBox(height: 32.w),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 9),
                      child: Text(
                        '${'symbol'.tr}  ',
                        style: TextStyle(
                          fontSize: 14,
                          color: controller.isFromDepositResultPage()
                              ? amountColorWhite(controller.record.amount.toDouble())
                              : amountColor(controller.record.amount.toDouble()),
                        ),
                      ),
                    ),
                    Text(
                      controller.isFromDepositResultPage()
                          ? amountTextWhite(controller.record.amount.toDouble())
                          : amountText(controller.record.amount.toDouble()),
                      style: TextStyle(
                        fontSize: 28,
                        fontFamily: FontFamily.dINMedium,
                        package: BaseX.pkg2,
                        fontWeight: FontWeight.w500,
                        color: controller.isFromDepositResultPage()
                            ? amountColorWhite(controller.record.amount.toDouble())
                            : amountColor(controller.record.amount.toDouble()),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 32.w),
                Divider(indent: 32.w, endIndent: 32.w),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32.w),
                  child: Column(
                    children: [
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ledger_detail_transaction_type'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          Text(
                            TRANSACTION_DIC()
                                    .firstWhereOrNull((element) =>
                                        element.code ==
                                        '${controller.record.appType}')
                                    ?.title ??
                                '',
                            style: const TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'ledger_detail_transaction_hour'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          Text(
                            controller.record.createdAt,
                            softWrap: true,
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ],
                      ),
                      SizedBox(height: 8.w),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'order_number'.tr,
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white.withOpacity(0.6)),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text.rich(
                                TextSpan(
                                  text: controller.pureEventId(),
                                  style: TextStyle(
                                      fontSize: 14),
                                  children: [
                                  ],
                                ),
                                textAlign: TextAlign.end,
                                style:
                                    TextStyle(fontSize: 14, color: Colors.white),
                              ),
                              SizedBox(height: 2.w,),
                              GestureDetector(
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white.withOpacity(0.1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 8.w,
                                    vertical: 2.w,
                                  ),
                                  child: Text(
                                    'copy'.tr,
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                onTap: controller.copyEventId,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:Container(
          alignment: Alignment.center,
          height: 50.w,
          child: ContactCustomerService(jumpToAgentServicePage: Store.clientId==Store.clientIdFYB,),
        ),
      ),
    );
  }
}

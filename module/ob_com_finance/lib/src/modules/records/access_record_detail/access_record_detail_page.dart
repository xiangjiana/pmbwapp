import 'package:flutter/material.dart' hide PageController;
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/access_record_detail/access_record_detail_controller.dart';

class AccessRecordDetailPage extends GetView<AccessRecordDetailController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: ObNavigationBarTitle('access_record_transaction_details'.tr),
          leading: ObBackButton(),
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (context, viewport) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: viewport.maxHeight,
                  ),
                  child: IntrinsicHeight(
                    child: Column(
                      children: [
                        Divider(
                            height: 8.w,
                            thickness: 8.w,
                            color: const Color(0xff0E1519)),
                        SizedBox(height: 32.w),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 5),
                              child: Text(
                                '${AppCurrencyUtils.getAppCurrencySymbol()}  ',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              '${AppCurrencyUtils.dealBalance(controller.record.orderAmount)}',
                              style: const TextStyle(
                                fontSize: 28,
                                fontFamily: FontFamily.gothamMedium,
                                package: BaseX.pkg2,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 32.w),
                        Divider(indent: 32.w, endIndent: 32.w),
                        const SizedBox(height: 24),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 32.w),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'access_record_status'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  Text(
                                    controller.record.orderStatus,
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: controller.record.statusColor,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'access_record_means_of_transaction'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  if (controller.record.isWithdraw)
                                    if (controller.record.withdrawType == '1')
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          controller.record.withdrawBank +
                                              ' ' +
                                              controller.record.accountLastFour,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      )
                                    else if (controller.record.withdrawType ==
                                        '2')
                                      SizedBox(
                                          width: 150.w,
                                          child: Text(
                                            controller.record
                                                    .withdrawBankAddress +
                                                ' ' +
                                                controller
                                                    .record.accountLastFour,
                                            textAlign: TextAlign.right,
                                            maxLines: 2,
                                            style: const TextStyle(
                                                fontSize: 14,
                                                color: Colors.white),
                                          ))
                                    else
                                      SizedBox(
                                        width: 150.w,
                                        child: Text(
                                          controller.record.showPayType,
                                          textAlign: TextAlign.right,
                                          style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white),
                                        ),
                                      )
                                  else
                                    SizedBox(
                                      width: 150.w,
                                      child: Text(
                                        controller.record.showPayType,
                                        textAlign: TextAlign.right,
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.white),
                                      ),
                                    )
                                ],
                              ),
                              SizedBox(height: 8.w),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'access_record_transaction_hour'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  Text(
                                    controller.record.createdAt,
                                    style: const TextStyle(
                                        fontSize: 14, color: Colors.white),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'access_record_order_number'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: controller.copyEventId,
                                          child: Align(
                                            alignment: Alignment.centerRight,
                                            child: buildOrderNumberWidget(),
                                          ),
                                        ),
                                        SizedBox(width: 5.w),
                                        GestureDetector(
                                          child: Container(
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.white.withOpacity(0.1),
                                              borderRadius:
                                                  BorderRadius.circular(20),
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
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.w),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'mark'.tr,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white.withOpacity(0.6)),
                                  ),
                                  SizedBox(width: 8.w),
                                  Expanded(
                                    child: Text(
                                      controller.record.remark.isEmpty
                                          ? "access_record_without".tr
                                          : controller.record.remark,
                                      textAlign: TextAlign.end,
                                      softWrap: true,
                                      style: const TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
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
              );
            },
          ),
        ),
        bottomNavigationBar: Container(
          alignment: Alignment.center,
          height: 50.w,
          child: ContactCustomerService(
            jumpToAgentServicePage: Store.clientId == Store.clientIdFYB,
          ),
        ),
      ),
    );
  }

  Widget buildOrderNumberWidget() {
    /*  if (GetPlatform.isWeb) {
      return Text.rich(
        TextSpan(text: controller.record.id),
        textDirection: TextDirection.rtl,
        textAlign: TextAlign.right,
        softWrap: false,
        maxLines: 1,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
        ),
      );
    }*/

    return AutoText(
      width: 225.w,
      text: controller.record.id,
      textDirection: TextDirection.rtl,
      minTextSize: 10,
      textStyle: const TextStyle(
        fontSize: 13,
        color: Colors.white,
        height: 1.1,
      ),
    );
  }
}

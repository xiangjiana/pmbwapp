import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:get/get.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';

class VipLevelActivityTable extends StatelessWidget {
  VipLevelActivityTable({Key? key}) : super(key: key);
  final VipLevelController vipController = Get.find<VipLevelController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Visibility(
        visible: vipController.userVipActivityInfo.value.activityStatus! > 0,
        child: DefaultTextStyle(
          style: TextStyle(fontSize: 14, color: Colors.white),
          child: Container(
            color: Color(0xFF151E25),
            width: 1.sw,
            padding: EdgeInsets.only(left: 16.w, right: 16.w),
            child: Container(
              width: 343.w,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.w),
                border:
                    Border.all(color: Colors.white.withOpacity(0.1), width: 1),
              ),
              child: Table(
                columnWidths: <int, TableColumnWidth>{
                  0: FixedColumnWidth(88),
                },
                border: TableBorder.symmetric(
                  inside: BorderSide(
                    color: Colors.white.withOpacity(0.1),
                    width: 1,
                  ),
                ),
                children: [
                  TableRow(
                    children: [
                      TableTh(
                        text: 'vip_status_table_th1'.tr,
                        borderRadius:
                            BorderRadius.only(topLeft: Radius.circular(7.w)),
                      ),
                      TableTd(
                        text: Text(vipController.userVipActivityInfo.value.gameName!),
                      ),
                    ],
                  ),
                  TableRow(children: [
                    TableTh(
                      text: 'vip_status_table_th2'.tr,
                      borderRadius: vipController
                                  .userVipActivityInfo.value.activityStatus ==
                              2
                          ? BorderRadius.only(bottomLeft: Radius.circular(7.w))
                          : BorderRadius.zero,
                    ),
                    TableTd(
                        text: Text(vipController
                            .userVipActivityInfo.value.approveTime!)),
                  ]),
                  if (vipController.userVipActivityInfo.value.activityStatus ==
                      1)
                    TableRow(children: [
                      TableTh(
                        text: Get.locale?.languageCode=="th"?'vip_status_table_th3'.tr.substring(0,8)+"\n"+'vip_status_table_th3'.tr.substring(8):'vip_status_table_th3'.tr,
                        borderRadius:
                            BorderRadius.only(bottomLeft: Radius.circular(7.w)),
                      ),
                      TableTd(
                          text: Text.rich(TextSpan(children: [
                        TextSpan(text: 'vip_status_table_td2_1'.tr),
                        TextSpan(
                          text:
                              ' ${'symbol'.tr}${AppCurrencyUtils.dealBalance(vipController.userVipActivityInfo.value.undoneBillAmount.toString())} ',
                          style: const TextStyle(color: Color(0xFFE1A100)),
                        ),
                        TextSpan(text: 'vip_status_table_td2_2'.tr),
                      ]))),
                    ])
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TableTh extends StatelessWidget {
  const TableTh({Key? key, required this.text, this.borderRadius})
      : super(key: key);
  final String text;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      height: 40,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: borderRadius,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.white.withOpacity(0.6)),
      ),
    );
  }
}

class TableTd extends StatelessWidget {
  const TableTd({Key? key, required this.text, this.borderRadius})
      : super(key: key);
  final Widget text;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      alignment: Alignment.center,
      child: text,
      padding: EdgeInsets.symmetric(horizontal: 4.w),
    );
  }
}

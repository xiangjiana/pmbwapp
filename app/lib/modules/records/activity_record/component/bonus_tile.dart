import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/records/activity_record/repository/ui_bonus_record.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'activity_text.dart';

class BonusTile extends StatelessWidget {
  final UiBonusRecord uiRecord;

  BonusTile({
    Key? key,
    required this.uiRecord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.circular(8.w),
      ),
      child: Column(
        children: [
          ItemTileSimple(
            userName: uiRecord.userName,
            statusTxt: uiRecord.statusTxt,
            statusColor: uiRecord.statusColor,
          ),
          Divider(color: Colors.white.withOpacity(0.06), height: 1),
          SizedBox(height: 12.w),
          _detailContent(
              'bonus_title_tab_item_1'.tr, '${numberFormat(uiRecord.forecastBonus)}'),
          SizedBox(height: 6.w),
          _detailContent('bonus_title_tab_item_2'.tr, '${numberFormat(uiRecord.validBet)}'),
          SizedBox(height: 6.w),
          _detailContent('bonus_title_tab_item_3'.tr, '${numberFormat(uiRecord.totalBonus)}'),
          SizedBox(height: 6.w),
          _detailContent(
              'bonus_title_tab_item_4'.tr, '${numberFormat(uiRecord.totalPayment)}'),
          SizedBox(height: 6.w),
          _detailContent(
            uiRecord.betCountType == 1
                ? 'bonus_title_tab_item_5'.tr
                : 'bonus_title_tab_item_7'.tr,
            uiRecord.betCountType == 1
                ? uiRecord.registerTime
                : uiRecord.firstDepositTime,
          ),
          SizedBox(height: 6.w),
          _detailContent('bonus_title_tab_item_6'.tr, uiRecord.endTime),
          SizedBox(height: 12.w),
        ],
      ),
    );
  }

  Widget _detailContent(String label, String amount) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Container(
            width: 75.w,
            child: Text(
              '$label',
              style: TextStyle(
                color: ColorName.colorTextWhite60,
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: 24.w),
          Text(
            '$amount',
            style: TextStyle(
              color: ColorName.white,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:intl/intl.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';

class CapitalListTile extends StatelessWidget {
  final MemberAccountRecording record;

  const CapitalListTile(this.record, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78,
      // color: Colors.white.withOpacity(0.04),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          Avatar(
            radius: 20.w,
            backgroundColor: Colors.white.withOpacity(0.04),
            child: pkObImage(
              TRANSACTION_DIC()
                      .firstWhereOrNull(
                          (element) => element.code == '${record.appType}')
                      ?.icon ??
                  '',
              width: 20.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      TRANSACTION_DIC()
                              .firstWhereOrNull((element) =>
                                  element.code == '${record.appType}')
                              ?.title ??
                          '',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    Expanded(child: SizedBox(width: 1,)),
                    Text(
                      (record.amount) > 0
                          ? '+${AppCurrencyUtils.dealBalance(record.amount.fixed(2))}'
                          : '${AppCurrencyUtils.dealBalance(record.amount.fixed(2))}',
                      style: TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.gothamMedium,
                        package: BaseX.pkg2,
                        fontWeight: FontWeight.w500,
                        color: (record.amount) > 0
                            ? Color(0xff69E300)
                            : Color(0xffFF5722),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      DateFormat('yyyy-MM-dd HH:mm:ss')
                          .format(DateTime.parse(record.createdAt)),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                   Expanded(child: SizedBox(width: 1,)),
                    Text(
                      'mine_center_wallet'.tr +
                          ' ${'symbol'.tr} ${AppCurrencyUtils.dealBalance(record.changeAfter.fixed(2))}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

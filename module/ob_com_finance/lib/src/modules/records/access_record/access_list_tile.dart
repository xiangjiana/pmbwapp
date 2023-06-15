import 'package:flutter/material.dart' hide PageController;
import 'package:intl/intl.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/ui_access_record.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class AccessListTile extends StatelessWidget {
  final UiAccessRecordDetail detail;
  final bool roundBottom;

  const AccessListTile({
    Key? key,
    required this.detail,
    this.roundBottom = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(minHeight: 72),
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.04),
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(roundBottom ? 8.w : 0)),
      ),
      child: Row(
        children: [
          Avatar(
            radius: 20.w,
            backgroundColor: Colors.white.withOpacity(0.04),
            child: pkObImage(
              detail.iconUrl,
              width: 20.w,
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(width: 160.w,
                    child: Text(
                      detail.payType,
                      style: const TextStyle(fontSize: 14, color: Colors.white),
                    ),),
                    const Spacer(),
                    Text(
                      '${AppCurrencyUtils.dealBalance(detail.orderAmount)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontFamily: FontFamily.gothamMedium,
                        package: BaseX.pkg2,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4.w),
                Row(
                  children: [
                    Text(
                      DateFormat('HH:mm:ss')
                          .format(DateTime.parse(detail.createdAt)),
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      detail.orderStatus,
                      style: TextStyle(
                        fontSize: 12,
                        color: detail.statusColor,
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

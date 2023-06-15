import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class DepositWayTile extends StatelessWidget {
  final bool selected;
  final UiPayType payType;

  const DepositWayTile({
    Key? key,
    this.selected = false,
    required this.payType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget text;
    if (kIsWeb) {
      text = SizedBox(
        width: double.infinity,
        child: Text(
          payType.name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: selected ? Colors.white : payType.fontColor,
            fontSize: 12,
            fontWeight: payType.fontWeight,
          ),
        ),
      );
    } else {
      text = AutoSizeText(
        payType.name,
        maxLines: 1,
        minFontSize: 8,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: selected ? Colors.white : payType.fontColor,
          fontSize: 14,
          fontWeight: payType.fontWeight,
        ),
      );
    }
    return Stack(
      children: [
        AnimatedContainer(
          width: 106.w,
          height: 56.w,
          padding: EdgeInsets.only(left: 9.w),
          decoration: BoxDecoration(
            gradient: selected ? ObTheming.depositWayTileGradientNew : LinearGradient(colors: payType.defaultColor),
            borderRadius: BorderRadius.circular(4.w),
          ),
          duration: const Duration(milliseconds: 250),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              text,
              SizedBox(height: 2.w),
              Visibility(
                visible: payType.activityDiscountScale > 0,
                child: Text(
                  'extra_amount'.tr +
                      (Get.locale!.languageCode == 'vi' ? '\n' : '') +
                      '${(payType.activityDiscountScale * 100).fixed(2)}%',
                  style: TextStyle(color: Colors.white.withOpacity(0.6), fontSize: 10),
                ),
              )
            ],
          ),
        ),
        Positioned(
          bottom: -8.w,
          right: 0,
          child: Opacity(opacity: 0.4, child: pkObImage(payType.iconUrl, width: 32.w)),
        ),
      ],
    );
  }
}

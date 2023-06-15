import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

enum CardStyle { nullable, bankCard }

class BankCardItem extends StatelessWidget {
  final ImageProvider bg;
  final Widget bankIcon;
  final bool showIcon;
  final String bankName;
  final String cardName;
  final String realName;
  final String cardNum;
  final Widget actionButton;
  final bool typeStyle;
  final CardStyle cardStyle;

  const BankCardItem({
    Key? key,
    required this.bg,
    required this.bankIcon,
    required this.showIcon,
    required this.bankName,
    required this.realName,
    required this.cardNum,
    required this.cardName,
    required this.actionButton,
    this.typeStyle = true,
    this.cardStyle = CardStyle.bankCard,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 18.w,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        image: DecorationImage(
          image: bg,
          fit: BoxFit.fitHeight,
        ),
        gradient: const LinearGradient(colors: [
          Color(0XFF2E394A),
          Color(0XFF435467),
        ]),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showIcon == true)
            Column(
              children: [
                SizedBox(height: 3.w),
                Container(
                  width: 40.w,
                  height: 40.w,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: bankIcon,
                ),
              ],
            ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$bankName',
                  style: TextStyle(
                    fontSize: 16.w,
                    fontWeight: FontWeight.w500,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
                SizedBox(height: 4.w),
                Row(
                  children: [
                    if (cardStyle == CardStyle.nullable)
                      Expanded(
                        child: Text(
                          '$cardName',
                          style: TextStyle(
                            fontSize: 12.w,
                            fontWeight: FontWeight.w400,
                            color:
                                Get.theme.colorScheme.primary.withOpacity(0.6),
                          ),
                        ),
                      ),
                    // SizedBox(width: 8.w),
                    if (typeStyle && cardStyle != CardStyle.nullable)
                      Expanded(
                        child: Text(
                          '$realName',
                          style: TextStyle(
                            fontSize: 12,
                            color:
                                Get.theme.colorScheme.primary.withOpacity(0.6),
                          ),
                        ),
                      ),
                  ],
                ),
                SizedBox(height: 24.w),
                Text(
                  '$cardNum',
                  style: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w500,
                    fontFamily: FontFamily.dINMedium,
                    package: BaseX.pkg2,
                    color: Get.theme.colorScheme.primary,
                  ),
                ),
              ],
            ),
          ),
          DefaultTextStyle(
            style: TextStyle(
              fontSize: 12.w,
              fontWeight: FontWeight.w400,
              color: Get.theme.colorScheme.primary,
            ),
            child: actionButton,
          ),
        ],
      ),
    );
  }
}

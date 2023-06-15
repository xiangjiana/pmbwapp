import 'package:flutter/material.dart' hide PageController;
import 'package:models/models.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class BankCardListTile extends StatelessWidget {
  final UserBankCard bank;
  final List<Color> colors;

  const BankCardListTile({Key? key, required this.colors, required this.bank})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 12.w),
      height: 80.w,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(4.w),
        ),
      ),
      child: Stack(
        children: [
          // Positioned(
          //   right: 0,
          //   child: Container(
          //     width: 142.w,
          //     height: 80.w,
          //     decoration: BoxDecoration(
          //       gradient: LinearGradient(
          //         colors: [
          //           Colors.white.withOpacity(0.06),
          //           Colors.white.withOpacity(0)
          //         ],
          //       ),
          //       borderRadius: BorderRadius.all(Radius.elliptical(5, 20)),
          //     ),
          //   ),
          // ),
          Row(
            children: [
              // Avatar(
              //   backgroundColor: Colors.white,
              //   radius: 20.w,
              //   child: pkObImage(
              //     'assets/images/bank/bank_${bank.bankCode}.webp',
              //     width: 28.w,
              //   ),
              // ),
              SizedBox(
                width: 8.w,
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            bank.bankName,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        SizedBox(width: 8.w,),
                        Text(
                          bank.cardNumber,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 4.w,
                    ),
                    Text(
                    realNameReplace(bank.realName.toString()),
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  String realNameReplace(String realName) {
    if (realName.length <= 5) {
      return realName.replaceRange(
        0,
          realName.length - 1,
        '*' * (realName.length - 1));
    }
    return '****' + realName.substring(realName.length - 1);
  }
}

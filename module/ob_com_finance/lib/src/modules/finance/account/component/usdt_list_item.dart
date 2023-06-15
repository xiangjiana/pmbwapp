import 'package:flutter/material.dart' hide PageController;
import 'package:models/models.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class USDTListItem extends StatelessWidget {
  final UserBankCard usdt;
  final List<Color> colors;

  const USDTListItem({Key? key, required this.usdt, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.w,
      margin: EdgeInsets.only(top: 16.w),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: colors,
        ),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          // Container(
          //   decoration: BoxDecoration(
          //     color: Colors.white.withOpacity(0.2),
          //     borderRadius: BorderRadius.all(
          //       Radius.circular(4.w),
          //     ),
          //   ),
          //   width: 64.w,
          //   height: 64.w,
          //   child: Center(
          //     child: pkObImage(
          //       USDT_PROTOCOL_ICON_DIC[usdt.virtualProtocol] ?? '',
          //       width: 32.w,
          //     ),
          //   ),
          // ),
          SizedBox(
            width: 16.w,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        usdt.virtualKind,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      usdt.virtualAddress,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                      child: const ColoredBox(
                        color: Color(0xff0E1519),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.w,
                  child: const ColoredBox(
                    color: Color(0xff0E1519),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        //'(${usdt.virtualProtocol ?? ''})'+'virtual_protocol'.tr,
                        '${usdt.virtualProtocol}',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: Colors.white.withOpacity(0.6),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 12.w,
                      child: const ColoredBox(
                        color: Color(0xff0E1519),
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

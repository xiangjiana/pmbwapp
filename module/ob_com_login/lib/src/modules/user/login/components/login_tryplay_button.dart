import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

class LoginTryPlayButton extends StatelessWidget {
  final VoidCallback onPressed;

  LoginTryPlayButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40.w),
          border: Border.all(
            color: ColorName.colorMain,
            width: 1.0,
          ),
          color: Store.clientId==Store.clientIdDJ?ColorName.colorMain.withOpacity(0.2):Color.fromRGBO(255, 87, 34, 0.20),
        ),
        child: Column(
          children: [
            SizedBox(height: 9.w),
            Row(
              children: [
                SizedBox(width: 31.w),
                Text(
                  "login_tryplay_text".tr,
                  style: TextStyle(
                    fontSize: 16,
                    color: Store.clientId==Store.clientIdDJ?Colors.white:ColorName.colorMain,
                    fontFamily: "PingFangSC-Regular",
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(width: 31.w),
              ],
            ),
            SizedBox(height: 9.w),
          ],
        ),
      ),
    );
  }
}

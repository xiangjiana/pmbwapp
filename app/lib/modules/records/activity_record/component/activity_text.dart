import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

enum ShowType {
  hint,
  warning,
  normal,
}

class TitleNotifyHint extends StatelessWidget {
  TitleNotifyHint({
    Key? key,
    required this.icon,
    required this.hint,
    this.backdropColor,
    this.txtColor,
    ShowType? showType,
    this.onPressed,
    this.onClosePressed,
  })  : this.showType = showType ?? ShowType.hint,
        super(key: key);

  final Color? backdropColor;
  final String icon;
  final String hint;
  final Color? txtColor;
  final ShowType showType;
  final VoidCallback? onPressed;
  final VoidCallback? onClosePressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed?.call();
      },
      behavior: HitTestBehavior.translucent,
      child: Container(
        width: 1.sw,
        color: backdropColor,
        child: Row(
          children: [
            SizedBox(width: 16.w),
            ObImage.asset(
              icon,
              width: 16.w,
              height: 16.w,
            ),
            SizedBox(width: 12.w),
            Text(
              hint,
              style: TextStyle(
                color: txtColor,
                fontSize: 12,
              ),
            ),
            Spacer(),
            if (showType == ShowType.normal) SizedBox(height: 40.h),
            if (showType == ShowType.hint) //关闭
              TextButton(
                onPressed: onPressed,
                child: Text(
                  'to_receive'.tr,
                  style: TextStyle(
                    color: ColorName.colorMain,
                    fontSize: 12,
                  ),
                ),
              ),
            if (showType == ShowType.warning) //关闭
              GestureDetector(
                onTap: onClosePressed,
                behavior: HitTestBehavior.translucent,
                child: Container(
                  child: IconButton(
                    padding: EdgeInsets.zero,
                    onPressed: onClosePressed,
                    icon: ObImage.asset(
                      Assets.images.icon.comDelete.path,
                      width: 16.w,
                      height: 16.w,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class ItemTileSimple extends StatelessWidget {
  ItemTileSimple({
    Key? key,
    required this.userName,
    required this.statusTxt,
    this.statusColor,
  }) : super(key: key);

  final String userName;
  final String statusTxt;
  final Color? statusColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.w),
      child: Row(
        children: [
          Text(
            '$userName',
            style: TextStyle(
              color: ColorName.white,
              fontSize: 14,
              fontFamily: "PingFangSC-Medium",
            ),
          ),
          Spacer(),
          Text(
            '$statusTxt',
            style: TextStyle(
              color: statusColor,
              fontSize: 14,
              fontFamily: "PingFangSC-Medium",
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class RecycleNewButton extends StatelessWidget {
  final AnimationController animationController;
  final List<UiWalletItem> availableWallet;
  final double? height;
  final double? maxWidth;
  final double? minHeight;
  final double? fontSize;

  const RecycleNewButton({
    Key? key,
    required this.animationController,
    required this.availableWallet,
    this.height,
    this.maxWidth,
    this.minHeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController,
      builder: (BuildContext context, Widget? child) {
        final index =
            availableWallet.length == 1 ? 0 : animationController.value.toInt();
        return Container(
          height: height,
          constraints: BoxConstraints(
            maxWidth: maxWidth != null ? maxWidth! : 100.w,
            minHeight: minHeight ?? 25.h,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.w),
            border:
                Border.all(color: Colors.white.withOpacity(0.4), width: 1.0),
            color: const Color.fromRGBO(255, 255, 255, 0.2),
          ),
          child: IconText(
            '${animationController.value.floor() == 0.0 ? 'deposit_one_click_recycling'.tr : availableWallet[index].name + 'deposit_recycling'.tr}',
            padding: EdgeInsets.only(right: 4.w),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: TextStyle(
              fontSize: fontSize ?? 12,
              height: 1.2,
              color: ColorName.white,
            ),
          ),
        );
      },
    );
  }
}

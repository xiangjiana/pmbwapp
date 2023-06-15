import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/ui_wallet_item.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class RecycleButton extends StatelessWidget {
  final AnimationController animationController;
  final List<UiWalletItem> availableWallet;
  final Color backgroundColor;
  final double? height;
  final double? maxWidth;
  final double? minHeight;
  final double? fontSize;

  const RecycleButton({
    Key? key,
    required this.animationController,
    required this.availableWallet,
    required this.backgroundColor,
    this.height,
    this.maxWidth,
    this.minHeight,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.w),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          final index = availableWallet.length == 1
              ? 0
              : animationController.value.toInt();
          if (kIsWeb) {
            return Container(
              height: height,
              constraints: BoxConstraints(
                maxWidth: maxWidth != null ? (maxWidth! + 18.w) : 100.w,
                minHeight: minHeight ?? 25.h,
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14.w),
                color: backgroundColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (animationController.value.floor() == 0.0)
                    SizedBox(
                      width: 12.w,
                      child: Image(
                        image: AssetImage(Assets.images.icon.gameNext.path,
                            package: BaseX.pkg),
                      ),
                    ),
                  SizedBox(width: 4.w),
                  if (animationController.value.floor() == 0.0)
                    Text(
                      '${animationController.value.floor() == 0.0 ? 'deposit_one_click_recycling'.tr : availableWallet[index].name + 'deposit_recycling'.tr}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    )
                  else
                    Expanded(
                        child: Text(
                      '${animationController.value.floor() == 0.0 ? 'deposit_one_click_recycling'.tr : availableWallet[index].name + 'deposit_recycling'.tr}',
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white.withOpacity(0.6),
                      ),
                    )),
                ],
              ),
            );
          }
          return Container(
            height: height,
            constraints: BoxConstraints(
              maxWidth: maxWidth != null ? (maxWidth! + 18.w) : 100.w,
              minHeight: minHeight ?? 25.h,
            ),
            alignment: Alignment.center,
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14.w),
              color: backgroundColor,
            ),
            child: IconText(
              '${animationController.value.floor() == 0.0 ? 'deposit_one_click_recycling'.tr : availableWallet[index].name + 'deposit_recycling'.tr}',
              padding: EdgeInsets.only(right: 4.w),
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              maxLines: 1,
              style: TextStyle(
                fontSize: fontSize ?? 12,
                height: kIsWeb ? 1 : 1,
                color: Colors.white.withOpacity(0.6),
              ),
              icon: animationController.value.floor() == 0.0
                  ? Image(
                      image: AssetImage(
                        Assets.images.icon.gameNext.path,
                        package: BaseX.pkg,
                      ),
                      width: 12.w,
                      height: 12.h,
                    )
                  : null,
            ),
          );
        },
      ),
    );

    return Container(
      constraints: BoxConstraints(
        minHeight: minHeight ?? 25.h,
        maxWidth: maxWidth ?? 100.w,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 3.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14.w),
        color: backgroundColor,
      ),
      child: AnimatedBuilder(
        animation: animationController,
        builder: (BuildContext context, Widget? child) {
          final index = availableWallet.length == 1
              ? 0
              : animationController.value.toInt();
          return Row(
            children: [
              if (animationController.value.floor() == 0.0)
                SizedBox(
                  width: 12.w,
                  child: Image(
                    image: AssetImage(Assets.images.icon.gameNext.path,
                        package: BaseX.pkg),
                  ),
                ),
              SizedBox(width: 4.w),
              Expanded(
                child: Text(
                  '${animationController.value.floor() == 0.0 ? 'deposit_one_click_recycling'.tr : availableWallet[index].name + 'deposit_recycling'.tr}',
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                  maxLines: 3,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.white.withOpacity(0.6),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

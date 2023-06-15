import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';

class Tag extends StatelessWidget {
  final bool selected;
  final String? label;
  final Widget? leading;
  final double? labelPadding;
  final double? width;
  final double height;
  final EdgeInsets padding;
  final double borderRadius;
  final double fontSize;

  const Tag({
    Key? key,
    this.selected = false,
    this.label,
    this.leading,
    this.labelPadding,
    this.width,
    required this.height,
    required this.borderRadius,
    this.padding = EdgeInsets.zero,
    this.fontSize = 14,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: width,
      height: height,
      padding: padding,
      duration: const Duration(milliseconds: 75),
      decoration: BoxDecoration(
        // image: DecorationImage(
        //   image: AssetImage(
        //       selected
        //           ? Assets.images.bg.xieyi3x.path
        //           : Assets.images.bg.xieyiNo3x.path,
        //       package: BaseX.pkg),
        //   fit: BoxFit.fill,
        // ),
        color: selected
            ? ColorName.colorMain1.withOpacity(0.2)
            : Colors.white.withOpacity(0.04),
        border: (selected &&
                (Store.clientId == Store.clientIdDJ || Store.isEasyPay))
            ? Border.all(color: ColorName.colorMain1, width: 1)
            : null,
        borderRadius: BorderRadius.circular(borderRadius),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (leading != null) leading!,
          if (labelPadding != null)
            SizedBox(
              width: labelPadding!,
            ),
          ObText(
            label ?? '',
            style: TextStyle(
              color: selected
                  ? (Store.clientId == Store.clientIdDJ
                      ? Colors.white
                      : ColorName.colorMain1)
                  : Colors.white.withOpacity(0.6),
              fontSize: fontSize,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.none,
              height: kIsWeb ? 1.2 : 1.1, //web一些字母显示不全
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class TitleTile extends StatelessWidget {
  final String title;
  final String? suffix;
  final VoidCallback? onSuffixClickListener;
  final Color? titleColor;

  const TitleTile(
      {Key? key, required this.title,this.titleColor, this.suffix, this.onSuffixClickListener})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final suffixText = Text(
      suffix ?? '',
      style: TextStyle(
        color: Colors.white.withOpacity(0.6),
        fontSize: 12,
        fontFamily: 'PingFangSC-Regular',
      ),
    );
    final suffixWidget = onSuffixClickListener == null
        ? suffixText
        : GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: onSuffixClickListener,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 14.w),
              child: Row(
                children: [
                  suffixText,
                  SizedBox(width: 4.w),
                  pkObImage(
                    Assets.images.icon.homeMoreRight.path,
                    width: 16,
                  )
                ],
              ),
            ),
          );
    return Container(
      height: 48.w,
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: TextStyle(
                color: titleColor??Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          suffixWidget
        ],
      ),
    );
  }
}

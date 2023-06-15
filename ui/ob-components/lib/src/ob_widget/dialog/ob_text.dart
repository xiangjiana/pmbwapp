import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ObText extends StatelessWidget {
  final String text; //要显示的文字；
  final TextStyle style; //文字的样式；
  final int maxLines; //最大行数；
  final double height; //文本高度，默认1.1，但是一般趋于1.0；
  final TextOverflow overflow; //裁剪模式；
  final double textMaxWidth; //文字显示的最大宽度，如果设置为autoFixSize则要指定该值；
  final TextAlign textAlign; //对齐方式；

  ObText(this.text,
      {TextStyle? style,
      this.maxLines = 1,
      this.height = 1.1,
      this.overflow = TextOverflow.ellipsis,
      this.textMaxWidth = double.infinity,
      this.textAlign = TextAlign.center})
      : this.style = style ??
            TextStyle(
              color: Get.theme.colorScheme.primary,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            );

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: maxLines,
      style: style,
      textAlign: textAlign,
      strutStyle: StrutStyle(
        fontSize: style.fontSize,
        fontWeight: style.fontWeight,
        fontFamily: style.fontFamily,
        leading: 0,
        height: height,
        forceStrutHeight: true, //设置为文字高度
      ),
      textHeightBehavior: TextHeightBehavior(
        applyHeightToFirstAscent: false, //基线设置
        applyHeightToLastDescent: false,
      ),
    );
  }
}

import 'package:flutter/material.dart';

/// icon text
class IconText extends StatelessWidget {
  final String text;
  final Widget? icon;
  final double? iconSize;
  final Axis direction;

  /// icon padding
  final EdgeInsetsGeometry padding;
  final TextStyle? style;
  final int? maxLines;
  final bool softWrap;
  final TextOverflow? overflow;
  final TextAlign? textAlign;

  const IconText(
    this.text, {
    Key? key,
    this.icon,
    this.iconSize,
    this.direction = Axis.horizontal,
    this.style,
    this.maxLines,
    this.softWrap = true,
    this.padding = EdgeInsets.zero,
    this.textAlign,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _style = DefaultTextStyle.of(context).style.merge(style);
    return RichText(
      text: TextSpan(
        style: _style,
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: IconTheme(
                  data: IconThemeData(
                    size: iconSize,
                    color: _style.color,
                  ),
                  child:
                Padding(
              padding: padding,
              child: icon != null ? icon! : const SizedBox(),
            ),
            ),
          ),
          TextSpan(
            text: direction == Axis.horizontal ? text : "\n$text",
            style: _style,
          ),
        ],
      ),
      maxLines: maxLines,
      softWrap: softWrap,
      overflow: overflow ?? TextOverflow.clip,
      textAlign: textAlign ?? (direction == Axis.horizontal ? TextAlign.start : TextAlign.center),
    )
        /*: Text(
            text,
            maxLines: maxLines,
            softWrap: softWrap,
            overflow: overflow ?? TextOverflow.clip,
            textAlign: textAlign ??
                (direction == Axis.horizontal
                    ? TextAlign.start
                    : TextAlign.center),
            style: _style,
          )*/
        ;
  }
}

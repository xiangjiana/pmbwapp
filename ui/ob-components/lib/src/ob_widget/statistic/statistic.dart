import 'package:flutter/material.dart';

///
typedef ValueRender = Widget Function(String);

///
class Statistic extends StatelessWidget {
  ///
  const Statistic({
    required this.title,
    required this.value,
    Key? key,
    this.valueStyle,
    this.suffix,
    this.prefix,
    this.groupSeparator = ',',
    this.precision,
    this.space = 4,
    this.render,
  }) : super(key: key);

  /// 数值的标题
  final Widget? title;

  /// 数值内容
  final String value;

  /// 设置数值的样式
  final TextStyle? valueStyle;

  /// 设置数值的前缀
  final Widget? suffix;

  /// 设置数值的后缀
  final Widget? prefix;

  /// 设置千分位标识符
  final String groupSeparator;

  /// 设置小数点
  final int? precision;

  /// 标题和数值直接的间距
  final double space;

  /// 自定义
  final ValueRender? render;

  @override
  Widget build(BuildContext context) {
    final RegExpMatch? isDigitMatch =
        RegExp(r'^(-?)(\d*)(\.(\d+))?$').firstMatch(value);
    final InlineSpan inlineNode;
    if (render != null) {
      inlineNode = WidgetSpan(child: render!.call(value));
    } else if (value == '-' || isDigitMatch == null) {
      inlineNode = TextSpan(text: value);
    } else {
      final String? negative = isDigitMatch.group(1);
      final String? int = ((isDigitMatch.group(2)?.isEmpty ?? true)
              ? '0'
              : isDigitMatch.group(2))
          ?.replaceAll(RegExp(r'\B(?=(\d{3})+(?!\d))'), groupSeparator);
      String? decimal = isDigitMatch.group(4) ?? '';
      if (precision != null) {
        decimal = decimal.padRight(precision!, '0').substring(0, precision);
      }
      inlineNode = TextSpan(
          text: '$negative$int${decimal.isEmpty ? decimal : '.$decimal'}');
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (title != null) title!,
        SizedBox(height: space),
        Text.rich(
          TextSpan(
            children: <InlineSpan>[
              if (prefix != null) WidgetSpan(child: prefix!),
              // TextSpan(text: valueText),
              inlineNode,
              if (suffix != null) WidgetSpan(child: suffix!),
            ],
          ),
          style: valueStyle,
        )
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// 圆形图标控件
class Avatar extends StatelessWidget {
  /// Creates a circle that represents a user.
  const Avatar({
    Key? key,
    this.child,
    this.shape = BoxShape.circle,
    this.backgroundColor,
    this.backgroundImage,
    this.foregroundImage,
    this.onBackgroundImageError,
    this.onForegroundImageError,
    this.foregroundColor,
    this.radius,
    this.minRadius,
    this.maxRadius,
    this.foregroundImageColorFilter,
    this.backgroundImageColorFilter,
    this.rectangleRadius = 2,
  })  : assert(radius == null || (minRadius == null && maxRadius == null)),
        assert(backgroundImage != null || onBackgroundImageError == null),
        assert(foregroundImage != null || onForegroundImageError == null),
        super(key: key);

  /// 子控件
  final Widget? child;

  ///图片形状
  final BoxShape shape;

  ///背景颜色
  final Color? backgroundColor;

  ///
  final Color? foregroundColor;

  ///
  final ImageProvider? backgroundImage;

  ///
  final ImageProvider? foregroundImage;

  ///
  final ImageErrorListener? onBackgroundImageError;

  ///
  final ImageErrorListener? onForegroundImageError;

  ///半径
  final double? radius;

  ///
  final double? minRadius;

  ///最小半径
  final double? maxRadius;

  ///矩形半径
  final double rectangleRadius;

  ///
  final Color? backgroundImageColorFilter;

  ///
  final Color? foregroundImageColorFilter;

  // The default radius if nothing is specified.
  static const double _defaultRadius = 20.0;

  // The default min if only the max is specified.
  static const double _defaultMinRadius = 0.0;

  // The default max if only the min is specified.
  static const double _defaultMaxRadius = double.infinity;

  double get _minDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? minRadius ?? _defaultMinRadius);
  }

  double get _maxDiameter {
    if (radius == null && minRadius == null && maxRadius == null) {
      return _defaultRadius * 2.0;
    }
    return 2.0 * (radius ?? maxRadius ?? _defaultMaxRadius);
  }

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMediaQuery(context));
    final ThemeData theme = Theme.of(context);
    TextStyle textStyle =
        theme.primaryTextTheme.subtitle1!.copyWith(color: foregroundColor);
    Color? effectiveBackgroundColor = backgroundColor;
    if (effectiveBackgroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(textStyle.color!)) {
        case Brightness.dark:
          effectiveBackgroundColor = theme.primaryColorLight;
          break;
        case Brightness.light:
          effectiveBackgroundColor = theme.primaryColorDark;
          break;
      }
    } else if (foregroundColor == null) {
      switch (ThemeData.estimateBrightnessForColor(backgroundColor!)) {
        case Brightness.dark:
          textStyle = textStyle.copyWith(color: theme.primaryColorLight);
          break;
        case Brightness.light:
          textStyle = textStyle.copyWith(color: theme.primaryColorDark);
          break;
      }
    }
    final double minDiameter = _minDiameter;
    final double maxDiameter = _maxDiameter;
    return AnimatedContainer(
      constraints: BoxConstraints(
        minHeight: minDiameter,
        minWidth: minDiameter,
        maxWidth: maxDiameter,
        maxHeight: maxDiameter,
      ),
      duration: kThemeChangeDuration,
      decoration: BoxDecoration(
        color: effectiveBackgroundColor,
        borderRadius: shape == BoxShape.rectangle
            ? BorderRadius.all(Radius.circular(rectangleRadius))
            : null,
        image: backgroundImage != null
            ? DecorationImage(
                image: backgroundImage!,
                colorFilter: backgroundImageColorFilter != null
                    ? ColorFilter.mode(
                        backgroundImageColorFilter!, BlendMode.dstATop)
                    : null,
                onError: onBackgroundImageError,
                fit: BoxFit.cover,
              )
            : null,
        shape: shape,
      ),
      foregroundDecoration: foregroundImage != null
          ? BoxDecoration(
              borderRadius: shape == BoxShape.rectangle
                  ? BorderRadius.all(Radius.circular(rectangleRadius))
                  : null,
              image: DecorationImage(
                image: foregroundImage!,
                colorFilter: foregroundImageColorFilter != null
                    ? ColorFilter.mode(
                        foregroundImageColorFilter!, BlendMode.dstATop)
                    : null,
                onError: onForegroundImageError,
                fit: BoxFit.cover,
              ),
              shape: shape,
            )
          : null,
      child: child == null
          ? null
          : Center(
              child: MediaQuery(
                // Need to ignore the ambient textScaleFactor here so that the
                // text doesn't escape the avatar
                // when the textScaleFactor is large.
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: IconTheme(
                  data: theme.iconTheme.copyWith(color: textStyle.color),
                  child: DefaultTextStyle(
                    style: textStyle,
                    child: child!,
                  ),
                ),
              ),
            ),
    );
  }
}

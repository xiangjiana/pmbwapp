import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_component/ob_component.dart';

import 'colors.dart';

///
class ObTheme extends StatelessWidget {
  ///
  const ObTheme({
    required this.data,
    required this.child,
    Key? key,
  }) : super(key: key);

  ///
  final ObThemeData data;

  ///
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return _InheritedObTheme(
      data,
      child: Theme(
        data: ThemeData.dark().copyWith(
          colorScheme: ColorScheme(
            primary: data.colorScheme.primaryColor,
            primaryVariant: data.colorScheme.primaryColor,
            secondary: data.colorScheme.secondaryColor,
            secondaryVariant: data.colorScheme.secondaryColor,
            surface: data.colorScheme.cardBackgroundColor,
            background: data.colorScheme.windowBackgroundColor,
            error: data.colorScheme.primaryColor,
            onPrimary: data.colorScheme.primaryTextColor,
            onSecondary: data.colorScheme.primaryTextColor,
            onSurface: data.colorScheme.primaryTextColor,
            onBackground: data.colorScheme.primaryTextColor,
            onError: data.colorScheme.primaryTextColor,
            brightness: Brightness.dark,
          ),
          hintColor: data.colorScheme.tertiaryTextColor,
          errorColor: data.colorScheme.primaryColor,
          scaffoldBackgroundColor: data.colorScheme.windowBackgroundColor,
          dividerColor: data.colorScheme.dividerColor,
          appBarTheme: AppBarTheme(
            elevation: 0,
            titleTextStyle: data.typographyTheme.title,
            toolbarTextStyle: data.typographyTheme.body2
                ?.apply(color: data.colorScheme.secondaryTextColor),
            backgroundColor: mirage,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: data.colorScheme.windowBackgroundColor,
              statusBarBrightness: Brightness.light,
              statusBarIconBrightness: Brightness.light,
            ),
            centerTitle: true,
          ),
          tabBarTheme: TabBarTheme(
            labelStyle: data.typographyTheme.body1,
            unselectedLabelStyle: data.typographyTheme.body2,
            labelColor: data.colorScheme.primaryColor,
            unselectedLabelColor: data.colorScheme.secondaryTextColor,
            indicator: TabFixedSizedIndicator(
                const Size(24, 3), data.colorScheme.primaryColor),
          ),
          dialogTheme: DialogTheme(
            backgroundColor: dialogBackground,
            titleTextStyle: data.typographyTheme.title,
            contentTextStyle: data.typographyTheme.body2
                ?.copyWith(color: data.colorScheme.secondaryTextColor),
          ),
        ),
        child: child,
      ),
    );
  }

  ///
  static ObThemeData of(BuildContext context) {
    final _InheritedObTheme? inheritedTheme =
        context.dependOnInheritedWidgetOfExactType<_InheritedObTheme>();
    return inheritedTheme?.themeData ?? ObThemeData.fallback();
  }
}

class _InheritedObTheme extends InheritedTheme {
  ///
  const _InheritedObTheme(this.themeData, {required Widget child})
      : super(child: child);

  final ObThemeData themeData;

  @override
  bool updateShouldNotify(_InheritedObTheme oldWidget) {
    return themeData != oldWidget.themeData;
  }

  @override
  Widget wrap(BuildContext context, Widget child) {
    return _InheritedObTheme(themeData, child: child);
  }
}

///
class ObThemeData {
  ///
  ObThemeData(this.typographyTheme, this.colorScheme);

  /// 默认主题
  factory ObThemeData.fallback() => ObThemeData(
        TypographyTheme(
          title: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
          subtitle1: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          subtitle2: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          body1: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          body2: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          caption: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          overline: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
        ObColorScheme(
          primaryColor: orange,
          secondaryColor: corn,
          windowBackgroundColor: mirage,
          primaryGradientColor: const <Color>[coral, orange],
          secondaryGradientColor: const <Color>[rioGrande, corn],
          primaryTextColor: white,
          secondaryTextColor: white60,
          tertiaryTextColor: white30,
          edgeDividerColor: white10,
          dividerColor: white6,
          cardBackgroundColor: white4,
          gapColor: bunker,
        ),
      );

  ///
  final ObColorScheme colorScheme;

  ///
  final TypographyTheme typographyTheme;
}

///
@immutable
class ObColorScheme with Diagnosticable {
  ///
  ObColorScheme({
    required this.primaryColor,
    required this.secondaryColor,
    required this.windowBackgroundColor,
    required this.primaryGradientColor,
    required this.secondaryGradientColor,
    required this.primaryTextColor,
    required this.secondaryTextColor,
    required this.tertiaryTextColor,
    required this.dividerColor,
    required this.cardBackgroundColor,
    required this.gapColor,
    required this.edgeDividerColor,
  });

  ///
  final Color primaryColor;

  ///
  final Color secondaryColor;

  ///
  final Color windowBackgroundColor;

  ///
  final List<Color> primaryGradientColor;

  ///
  final List<Color> secondaryGradientColor;

  ///
  final Color primaryTextColor;

  ///
  final Color secondaryTextColor;

  ///
  final Color tertiaryTextColor;

  ///
  final Color edgeDividerColor;

  ///
  final Color dividerColor;

  ///
  final Color cardBackgroundColor;

  ///
  final Color gapColor;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is ObColorScheme &&
        primaryColor == other.primaryColor &&
        secondaryColor == other.secondaryColor &&
        windowBackgroundColor == windowBackgroundColor &&
        listEquals(primaryGradientColor, other.primaryGradientColor) &&
        listEquals(secondaryGradientColor, other.secondaryGradientColor) &&
        primaryTextColor == other.primaryTextColor &&
        secondaryTextColor == other.secondaryTextColor &&
        tertiaryTextColor == other.tertiaryTextColor &&
        edgeDividerColor == other.edgeDividerColor &&
        dividerColor == other.dividerColor &&
        cardBackgroundColor == other.cardBackgroundColor &&
        gapColor == other.gapColor;
  }

  @override
  int get hashCode {
    return hashValues(
      primaryColor,
      secondaryColor,
      windowBackgroundColor,
      primaryGradientColor,
      secondaryGradientColor,
      primaryTextColor,
      secondaryTextColor,
      tertiaryTextColor,
      dividerColor,
      cardBackgroundColor,
      gapColor,
      edgeDividerColor,
    );
  }
}

///
@immutable
class TypographyTheme with Diagnosticable {
  ///
  TypographyTheme({
    this.title,
    this.subtitle1,
    this.subtitle2,
    this.body1,
    this.body2,
    this.caption,
    this.overline,
  });

  ///
  final TextStyle? title;

  ///
  final TextStyle? subtitle1;

  ///
  final TextStyle? subtitle2;

  ///
  final TextStyle? body1;

  ///
  final TextStyle? body2;

  ///
  final TextStyle? caption;

  ///
  final TextStyle? overline;

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other.runtimeType != runtimeType) return false;
    return other is TypographyTheme &&
        title == other.title &&
        subtitle1 == other.subtitle1 &&
        subtitle2 == other.subtitle2 &&
        body1 == other.body1 &&
        body2 == other.body2 &&
        subtitle2 == other.subtitle2 &&
        caption == other.caption &&
        overline == other.overline;
  }

  @override
  int get hashCode {
    return hashValues(
      title,
      subtitle1,
      subtitle2,
      body1,
      body2,
      caption,
      overline,
    );
  }
}

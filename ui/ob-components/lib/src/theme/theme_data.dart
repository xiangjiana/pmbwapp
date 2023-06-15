import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ob_component/src/extension/size_extension.dart';

import 'colors.dart';

///
final ThemeData obTheme = _buildObMaterialTheme();

ThemeData _buildObMaterialTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    colorScheme: _obColorScheme,
    hintColor: white30,
    scaffoldBackgroundColor: mirage,
    dividerColor: white6,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      titleTextStyle: TextStyle(
        fontSize: 16,
        color: white,
        fontWeight: FontWeight.w500,
      ),
      toolbarTextStyle: TextStyle(fontSize: 14, color: white60),
      backgroundColor: mirage,
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: mirage,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.light,
      ),
      centerTitle: true,
    ),
    tabBarTheme: const TabBarTheme(
      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      unselectedLabelStyle:
          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
      labelColor: orange,
      unselectedLabelColor: white60,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: dialogBackground,
      titleTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
      ),
      contentTextStyle: TextStyle(
        fontSize: 14,
        color: white60,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8))),
    ),
    iconTheme: const IconThemeData(size: 24),
  );
}

const ColorScheme _obColorScheme = ColorScheme(
  primary: orange,
  primaryVariant: coral,
  secondary: corn,
  secondaryVariant: rioGrande,
  surface: white4,
  background: mirage,
  error: orange,
  onPrimary: white,
  onSecondary: white,
  onSurface: white,
  onBackground: white,
  onError: white,
  brightness: Brightness.dark,
);

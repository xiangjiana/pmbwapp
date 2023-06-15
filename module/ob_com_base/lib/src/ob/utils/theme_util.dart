import 'package:flutter/material.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_com_base/gen/colors.gen.dart';

class ThemeUtil {
  static ThemeData light() {
    return ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      primaryColor: ColorName.blue,
      tabBarTheme: TabBarTheme(
        labelColor: ColorName.colorBlack1,
      ),
      primarySwatch: Colors.blue,
      dialogBackgroundColor: ColorName.colorBlack2,
      //用来放字体颜色
      colorScheme: ColorScheme.light(
          primary: ColorName.white, primaryVariant: ColorName.colorAssist),
      backgroundColor: ColorName.colorBlack3,
      scaffoldBackgroundColor: ColorName.colorSplitWhite10,
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.light(
          primary: ColorName.colorMainGradient1,
          primaryVariant: ColorName.colorMainGradient2,
        ),
      ),
      textTheme: TextTheme(
          subtitle1: TextStyle(
        fontSize: 18,
        color: ColorName.white,
      )),
      selectedRowColor: ColorName.colorEmbellish,
      textSelectionTheme: TextSelectionThemeData(
          //输入框提示颜色
          selectionColor: ColorName.colorTextWhite30,
          //找回密码 未选中
          cursorColor: ColorName.colorTextWhite60,
          //找回密码 未选中下面那个黑色
          selectionHandleColor: ColorName.colorSplitWhite10),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: ColorName.colorBlack4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(16.w)),
        ),
      ),
      // cursorColor:ColorName.colorMain
    );
  }

  static ThemeData dark() {
    return ThemeData(
      primaryColor: ColorName.red,
      primarySwatch: Colors.blue,
      tabBarTheme: TabBarTheme(
        labelColor: ColorName.colorBlack1,
      ),
      backgroundColor: ColorName.colorBlack3,
      colorScheme: ColorScheme.light(primary: ColorName.white),
      buttonTheme: ButtonThemeData(
        colorScheme: ColorScheme.dark(
          primary: ColorName.colorMainGradient1,
          primaryVariant: ColorName.colorMainGradient2,
        ),
      ),
    );
  }
}

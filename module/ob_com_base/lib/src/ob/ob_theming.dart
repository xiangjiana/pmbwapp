import 'package:flutter/widgets.dart';
import 'package:ob_com_base/ob_com_base.dart';

///配置扩展所有主题相关的变量，默认情况下是OB旗舰的主题色，接入ob_com的其他app需要调用init并写好对应主题色
abstract class ObTheming {
  static Gradient buttonGradient = const LinearGradient(
    colors: [Color(0xffFF9047), Color(0xffFF5722)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  ); //目前用于按钮渐变色

  static Gradient buttonGradientNew = const LinearGradient(
    colors: [Color(0xff5718CC), Color(0xff9459FF)],
    begin: Alignment.centerLeft,
    end: Alignment.centerRight,
  );
  static Gradient depositWayTileGradient = const LinearGradient(
      colors: [Color(0xffFF9047), Color(0xffFF5722)]); //支付方式的背景渐变

  static Gradient depositWayTileGradientNew = const LinearGradient(
      colors: [Color(0xff5718CC), Color(0xff9459FF)]); //支付方式的背景渐变

  static Color obDialogBgColor = const Color(0xff1D2933); //ObDialog背景色
  static Color scaffoldBackgroundColor = const Color(0xff151e25); //页面背景色
  static void init() {
    if (Store.clientId == Store.clientIdDJ) {
      buttonGradient = const LinearGradient(
        colors: [
          Color(0xff61C5FF),
          Color(0xff0271BD),
          Color(0xff027ED0),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      );
      depositWayTileGradient =
          const LinearGradient(colors: [Color(0xff1DA7FF), Color(0xff0095FF)]);
      obDialogBgColor = const Color(0xff2B2F35);
      scaffoldBackgroundColor = const Color(0xff272C32);
    } else if (Store.clientId == Store.clientIdMB) {
    } else {
      //其他 ob旗舰
      depositWayTileGradient =
          const LinearGradient(colors: [Color(0xffFF9047), Color(0xffFF5722)]);
    }
  }
}

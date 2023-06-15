import 'package:flutter_vibrate/flutter_vibrate.dart';
import 'package:get/get.dart';

class OBVibrate {
  static void auto() async {
    if (await Vibrate.canVibrate) {
      if (GetPlatform.isIOS) {
        Vibrate.feedback(FeedbackType.impact);
      } else if (GetPlatform.isAndroid) {
        Vibrate.feedback(FeedbackType.light);
      }
    } else {
      /// 该手机不支持震动功能
    }
  }
}

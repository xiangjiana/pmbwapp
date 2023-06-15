import 'package:intl/intl.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/utils/cache_util.dart';
import 'package:ob_component/ob_component.dart';

int Function(String msg) secondMsg = (String msg) {
  // String msg1 = "还剩0分27秒可以再次发送短信";
  try {
    var date = DateFormat("there_are_mm_minutes_ss_seconds_left_to_send_text_messages_again".tr).parse(msg);
    int second = date.minute * 60 + date.second;
    return second;
  } catch (e) {
    return 0;
  }
};

class StringUtil {

  StringUtil.startCountDownMsg(String msg, CountDownController controller,
      {bool save = true}) {
    int sec = secondMsg(msg);
    StringUtil.startCountDown(sec, controller);
  }

  StringUtil.startCountDown(int sec, CountDownController controller,
      {bool save = true}) {

    if (sec <= 0) return;

    if (save) {
      int timestamp = DateTime.now().add(Duration(seconds: sec)).microsecondsSinceEpoch;
      CacheUtil.save("SMSTime", timestamp);
    }
    if (controller.isTicking == false && controller.duration.inSeconds != sec) {
      controller.updateDuration(Duration(seconds: sec));
    }
    controller.startTimer();
  }

  StringUtil.countDownReload(CountDownController controller,{int maxSeconds = 60}) {
    var timestamp = CacheUtil.get("SMSTime");
    if (timestamp != null && timestamp is int) {
      int now = DateTime.now().microsecondsSinceEpoch;
      int sec = (timestamp - now) ~/ 1000000;
      if (sec < maxSeconds  && sec > 0) {
        controller.updateDuration(Duration(seconds: sec));
        controller.startTimer();
      }
    }
  }
}

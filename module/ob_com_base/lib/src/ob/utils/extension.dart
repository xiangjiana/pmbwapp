import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

extension Extension on GetInterface {
  T? findOrNull<T>({String? tag}) {
    if (Get.isRegistered<T>(tag: tag)) {
      return Get.find<T>(tag: tag);
    }
    return null;
  }
}

////泰文 上下标字符 unicode
List<int> thaiSupSubs = [
  0x0e31,
  0x0e33,
  0x0e34,
  0x0e35,
  0x0e36,
  0x0e37,
  0x0e38,
  0x0e39,
  0x0e47,
  0x0e48,
  0x0e49,
  0x0e4a,
  0x0e4b,
  0x0e4c,
  0x0e4d,
  0x0e4e
];

//对泰语强制加空格避免不换行问题
extension BreakWord on String {
  String get breakWordOnWeb {
    if (!kIsWeb) return this;
    if((Get.locale?.languageCode??"")!="th")return this;
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      //泰语的上下标会与字符合并为新的字符，但是新的字符还是会占两个长度length，因此不能将字符和上下标分开加空格，要判断
      if (thaiSupSubs.contains(element)) {
        breakWord = breakWord.substring(0, breakWord.length - 1);
      }
      //如果是%那么也不能空格分开  影响参数格式化
      if (String.fromCharCode(element) != "%") {
        breakWord += '\u200B';
      }
    }
    return breakWord;
  }

  //app直接用u200B，web的iOS会有问题不能用
  String get breakWordOnApp {
    if (kIsWeb) return this;
    if((Get.locale?.languageCode??"")!="th")return this;
    String breakWord = '';
    for (var element in runes) {
      breakWord += String.fromCharCode(element);
      if (thaiSupSubs.contains(element)) {
        breakWord = breakWord.substring(0, breakWord.length - 1);
      }
      if (String.fromCharCode(element) != "%") {
        breakWord += '\u200B';
      }
    }
    return breakWord;
  }
}
// extension FijkPlayerExt on FijkPlayer {
//   Future<void> safeStart() async {
//     if (state == FijkState.initialized) {
//       await prepareAsync();
//     }
//     if (state == FijkState.asyncPreparing ||
//         state == FijkState.prepared ||
//         state == FijkState.completed ||
//         state == FijkState.paused) {
//       await start();
//     }
//   }
//
//   Future<void> safePause() async {
//     if (isPlayable()) {
//       await pause();
//     }
//   }
// }

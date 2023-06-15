import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:ob_com_login/src/modules/debug/crash_log_manager.dart';
import 'package:sp_util/sp_util.dart';

class SentryUtil {
  static Future<String> initId() async {
    String id = "";
    Map<String, dynamic> map = await CrashLogManager.initPlatformState();
    map.forEach((key, value) {
      id += key + value;
    });
    id = generateMd5(id);
    SpUtil.putString("sentryId", id);
    return id;
  }

  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toUpperCase();
  }
}

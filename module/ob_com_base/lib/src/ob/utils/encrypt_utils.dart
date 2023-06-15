import 'dart:convert';
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flavor/flavor.dart';

class EncryptUtils {
  static String obKey = '11,22,33,44,55,66';

  static String generateMd5(String data) {
    var content = const Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toUpperCase();
  }

  static String base64Encode(String data) {
    return EncryptUtil.xorBase64Encode(data, obKey);
  }

  static String base64Decode(String data) {
    return EncryptUtil.xorBase64Decode(data, obKey);
  }

  static int randomIntNext({int min = 0, int max = 1}) {
    return min + Random().nextInt(max - min + 1);
  }

  static bool isBase64Encrypted(String data) {
    try {
      base64Decode(data);
      return true;
    } catch (_) {
      return false;
    }
  }

  static String? getConfigFromFlavor(String key) {
    return Flavor.I.getString(key);
  }
}

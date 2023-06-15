import 'dart:convert';
import 'dart:math';

import 'package:common_utils/common_utils.dart';
import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flavor/flavor.dart';
import 'package:flutter/services.dart';
import 'package:encrypt/encrypt.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/utils/properties2.dart';
import 'package:sp_util/sp_util.dart';

import 'constants.dart';
import 'store.dart';

class Tools {
  static String obKey = '11,22,33,44,55,66';
  static String aseKey = "obappkey12346666";

  static String generateMd5(String data) {
    var content = Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    return hex.encode(digest.bytes).toUpperCase();
  }

  static String base64Encode(String data) {
    return EncryptUtil.xorBase64Encode(data, obKey);
  }

  static String base64Decode(String data) {
    try {
      return EncryptUtil.xorBase64Decode(data, obKey);
    } catch (e) {
      return '';
    }
  }

  static int randomIntNext({int min = 0, int max = 1}) {
    return min + Random().nextInt(max - min + 1);
  }

  static void autoRestartApp() {
    final now = DateTime.now().millisecondsSinceEpoch;
    final appActiveTime = Store.appActiveTime.millisecondsSinceEpoch;
    if (now - appActiveTime >= Constants.autoRestartAppDuration * 3599 * 1000) {
      SystemNavigator.pop(); // Only works on Android.
    }
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

  static late Key _keyAes;
  static late Encrypter _encryptAes;
  static IV _ivAes = IV.fromLength(16);

  ///初始化AES加密启动时调用
  static Future<void> initAes({
    mode = AESMode.sic,
    padding = 'PKCS7',
  }) async {
    _keyAes = Key.fromUtf8(aseKey);
    _encryptAes = Encrypter(AES(_keyAes, mode: mode, padding: padding));
  }

  ///Aes加密
  static String encryptAes(String context) {
    return _encryptAes.encrypt(context, iv: _ivAes).base64;
  }

  ///Aes解密
  static String decryptAes(String context) {
    try{
      return _encryptAes.decrypt(Encrypted.fromBase64(context), iv: _ivAes);
    }catch(e){
      return '';
    }
  }
  static String getCurLangAppName(){
    String saveLocaleLanguageCode =
        SpUtil.getString("saveLocaleLanguageCode") ?? '';
    String saveLocaleCountryCode =
        SpUtil.getString("saveLocaleCountryCode") ?? '';
    var lang = 'zh_CN';
    if (saveLocaleLanguageCode.isNotEmpty && saveLocaleCountryCode.isNotEmpty) {
      lang = saveLocaleLanguageCode + '_' + saveLocaleCountryCode;
    }
    return getAppName(lang: lang);
  }

  //根据接入的客户端标识获取app名称
  static String getAppName({String? lang}){
    if(Store.clientId==Store.clientIdDJ){
      return 'app_name_dj'.tr;
    }else if(Store.clientId==Store.clientIdMB){
      return 'app_name_mb'.tr;
    }else if(Store.clientId==Store.clientIdFYB){ 
      return 'app_name_fyb'.tr;
    }else if(Store.clientId==Store.clientIdPG){
      var m = Flavor.I.getObject(MERCHANT_NAME);
      if (m != null && (m is Map)) {
        var r = m[lang];
        if (r != null) return r;
        try {
          r = m.values.first;
        } catch (_) {}
        return r ?? '';
      }
      return '';
    }else{
      return 'app_name_ob'.tr;
    }
  }
}

extension ListUtil<T> on List<T> {
  T? safe(int index) {
    if (index >= 0 && index < length) {
      return this[index];
    }
    return null;
  }
}


import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart' hide Key;
import 'dart:math';
import 'package:archive/archive.dart';

class CryptUtilsHttp {
  // String? _key;
  // String? _iv;
  // GZipCodec _gzip;
  static CryptUtilsHttp? _instance;
  
  String key = '';

  String iv = '';

  CryptUtilsHttp.instance(String ikey, String ivv) {
    key = ikey;
    iv = ivv;
    // gzip = GZipCodec();
  }

  factory CryptUtilsHttp({required String key, required String iv}) {
    _instance = CryptUtilsHttp.instance(key, iv);
    return CryptUtilsHttp.instance(key, iv);

    // return _instance;
  }

  //加密前gzip压缩
  static List<int> zip(List<int> list) {
    return GZipEncoder().encode(list) ?? <int>[];
  }

  //解压缩
  static List<int> unzip(List<int> list) {
    return GZipDecoder().decodeBytes(list);
  }

  //
  //md5加密
  static String md5Encrypt(String text) {
    List<int> uint8list = utf8.encode(text);
    Digest md5result = md5.convert(uint8list);
    return md5result.toString();
  }

  //AES加密
  static dynamic aesEncrypt(
      {required List<int> encryptText, bool isZip = true}) {
    try {
      List<int> u8list = isZip ? zip(encryptText) : encryptText;
      Key key = Key.fromUtf8(_instance!.key);
      IV iv = IV.fromUtf8(_instance!.iv);
      Encrypter enCrypto =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      Encrypted encrypted = enCrypto.encryptBytes(u8list, iv: iv);
      return encrypted;
    } catch (err) {
      debugPrint('aes 加密失败:$err');
      return null;
    }
  }

  //AES解密
  static List<int> aesDecrypt(
      {required Uint8List encryptedText, bool isZip = true}) {
    try {
      List<int> u8list;
      var key = Key.fromUtf8(_instance!.key);
      IV iv = IV.fromUtf8(_instance!.iv);
      Encrypter enCrypto =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      Uint8List deCrypto = Uint8List.fromList(
          enCrypto.decryptBytes(Encrypted(encryptedText), iv: iv));
      if (isZip) {
        u8list = unzip(deCrypto);
      } else {
        u8list = deCrypto;
      }
      return u8list;
    } catch (err) {
      debugPrint('aes 解码失败:$err');
      return encryptedText;
    }
  }

  static String _randomBit(int len) {
    String scopeF = '123456789'; //首位
    String scopeC = '0123456789'; //中间
    String result = '';
    for (int i = 0; i < len; i++) {
      if (i == 0) {
        result = scopeF[Random().nextInt(scopeF.length)];
      } else {
        result = result + scopeC[Random().nextInt(scopeC.length)];
      }
    }
    return result;
  }

  /// 加密成功返回加密串，加密失败则返回params
  static CryptResultMap toCrypt(dynamic params) {
    // 解析参数为字符串
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    String nonce = _randomBit(18); //timestamp.toString();

    /// 加密串默认是空,只有是map才会加密params
    String jsonStr = '';
    if (params is Map) {
      jsonStr = jsonEncode(params);
    }
    // json字符串 aes加密
    /// 空字符串不做转换
    var aesEncrypted =
        jsonStr == '' ? '' : aesEncrypt(encryptText: utf8.encode(jsonStr));
    if (aesEncrypted != null) {
      /// 空字符串不做转换 临时写法，后期优化
      String uint8Str = aesEncrypted == '' ? '' : aesEncrypted.base64;
      // aes加密串 进行md5加密
      String md5 = md5Encrypt('${uint8Str}${_instance!.key}${nonce}$timestamp');
      //md5加密结果再次加密生成签名
      String sign = md5Encrypt(md5);

      return CryptResultMap(
          nonce: nonce,
          timestamp: timestamp,
          sign: sign,
          base64param: uint8Str);
    } else {
      return CryptResultMap(
          nonce: nonce,
          timestamp: timestamp,
          sign: jsonEncode(params),
          base64param: '');
    }
  }

  /// 解密返回的内容，失败则返回原始内容
  static dynamic deCrypt(String cryptString) {
    try {
      // base64 解码
      Uint8List deCryptList = base64Decode(cryptString);

      // aes 解码
      List<int> aesDeCryptList = aesDecrypt(encryptedText: deCryptList);

      // utf8 解码
      String deCryptString = utf8.decode(aesDeCryptList);

      var map = jsonDecode(deCryptString);
      return map;
    } catch (err) {
      debugPrint("deCrypt---解码失败: $err");
      return cryptString;
    }
  }
}

class CryptResultMap {
  CryptResultMap({
    required this.nonce,
    required this.timestamp,
    required this.sign,
    required this.base64param,
  });

  String nonce;
  String timestamp;
  String sign;
  String base64param;

  factory CryptResultMap.fromMap(Map<String, dynamic> json) => CryptResultMap(
        nonce: json["nonce"] == null ? null : json["nonce"],
        timestamp: json["timestamp"] == null ? null : json["timestamp"],
        sign: json["sign"] == null ? null : json["sign"],
        base64param: json["base64param"] == null ? null : json["base64param"],
      );

  Map<String, dynamic> toMap() => {
        "nonce": nonce == null ? null : nonce,
        "timestamp": timestamp == null ? null : timestamp,
        "sign": sign == null ? null : sign,
        "base64param": base64param == null ? null : base64param,
      };
}

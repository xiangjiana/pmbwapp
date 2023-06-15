import 'dart:io';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';

import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:flutter/cupertino.dart' hide Key;

class CryptUtils {
  String? _key;
  String? _iv;
  GZipCodec? _gzip;
  static CryptUtils? _instance;

  GZipCodec? get gzip => _gzip;

  String? get key => _key;

  String? get iv => _iv;

  CryptUtils.instance(String key, String iv) {
    _key = key;
    _iv = iv;
    _gzip = GZipCodec();
  }

  factory CryptUtils(String key, String iv) {
    _instance = CryptUtils.instance(key, iv);
    return CryptUtils.instance(key, iv);
  }

  //加密前gzip压缩
  static List<int> zip(List<int> list) {
    return _instance!.gzip!.encode(list);
  }

  //解压缩
  static List<int> unzip(List<int> list) {
    return _instance!.gzip!.decode(list);
  }

  //
  //md5加密
  static md5Encrypt(Map<String, dynamic> param) {
    List<int> uint8list = utf8.encode(jsonEncode(param));
    Digest md5result = md5.convert(uint8list);
    return md5result;
  }

  //AES加密
  static dynamic aesEncrypt(
      {required List<int> encryptText, bool isZip = true}) {
    try {
      List<int> u8list = isZip ? zip(encryptText) : encryptText;
      var key = Key.fromUtf8(_instance!.key!);
      var iv = IV.fromUtf8(_instance!.iv!);
      Encrypter enCrypto =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      Encrypted encrypted = enCrypto.encryptBytes(u8list, iv: iv);
      return encrypted;
    } catch (err) {
      debugPrint('aes 加密失败:$err');
      return encryptText;
    }
  }

  //AES解密
  static List<int>? aesDecrypt(
      {required Uint8List encryptedText, bool isZip = true}) {
    try {
      List<int> u8list;
      var key = Key.fromUtf8(_instance!.key!);
      var iv = IV.fromUtf8(_instance!.iv!);
      Encrypter enCrypto =
          Encrypter(AES(key, mode: AESMode.cbc, padding: 'PKCS7'));
      List<int> deCrypto = Uint8List.fromList(
          enCrypto.decryptBytes(Encrypted(encryptedText), iv: iv));
      u8list = isZip ? unzip(deCrypto) : deCrypto;
      return u8list;
    } catch (err) {
      debugPrint('aes 解码失败:$err');
      return encryptedText;
    }
  }
}

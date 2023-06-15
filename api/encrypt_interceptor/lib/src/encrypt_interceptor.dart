import 'dart:convert';
import 'dart:core';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:dio/dio.dart';
import 'package:encrypt/encrypt.dart';
import 'package:archive/archive.dart';

const String _encrypted = 'ob-encrypted';
const String _secretVersion = 'ob-secret-version';
const String _sign = 'ob-sign';
const String _nonce = 'ob-nonce';
const String _timestamp = 'ob-timestamp';

class EncryptInterceptor extends Interceptor {
  final String aesKey;
  final String aesVersion;
  final bool openEncrypt;
  final bool kIsWeb;

  late AppEncrypter _javEncrypter;

  EncryptInterceptor({
    this.aesKey = '',
    this.aesVersion = '1',
    this.openEncrypt = false,
    required this.kIsWeb,
  }) {
    _javEncrypter = AppEncrypter(aesKey,kIsWeb);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // jav网关，以下参数必定传
    //ob_client，merchant_id，ob_application，ob_secret_version，ob_timestamp，ob_nonce
    options.headers[_encrypted] = openEncrypt;
    options.headers[_secretVersion] = aesVersion;

    final timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    final nonce = _generateRandomDigits(18);
    options.headers[_nonce] = nonce;
    options.headers[_timestamp] = timestamp;

    if (!openEncrypt) {
      super.onRequest(options, handler);
      return;
    }
    if (options.extra.containsKey('retry')) {
      super.onRequest(options, handler);
      return;
    }
    options.data ??= {};
    if (options.data! is! FormData) {
      final encryptString = _javEncrypter.encryptRequest(options.data);
      final md5String = md5
          .convert(utf8.encode('$encryptString$aesKey$nonce$timestamp'))
          .toString();
      final sign = md5.convert(utf8.encode(md5String)).toString();
      options.responseType = ResponseType.plain;
      options.headers[_sign] = sign;
      options.data = encryptString;
    } else {
      options.headers[_nonce] = '';
      options.headers[_timestamp] =
          DateTime.now().millisecondsSinceEpoch.toString();
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (!openEncrypt) {
      super.onResponse(response, handler);
      return;
    }
    if (response.data != null && response.data is String && openEncrypt) {
      response.data = _javEncrypter.deCryptResponse(response.data);
    }
    handler.next(response);
  }

  String _generateRandomDigits(int len) {
    String scopeF = '123456789';
    String scopeC = '0123456789';
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
}

class AppEncrypter {
  final String aesKey;
  late GZipCodec _gZipCodec;
  late Encrypter _encrypter;
  final bool kIsWeb;

  AppEncrypter(
    this.aesKey,
    this.kIsWeb,
  ) {
    _gZipCodec = GZipCodec();
    _encrypter = Encrypter(
        AES(Key.fromUtf8(aesKey), mode: AESMode.cbc, padding: 'PKCS7'));
  }

  String encryptRequest(dynamic params) {
    String jsonString = params is String ? params : jsonEncode(params);
    final List<int> encryptList = utf8.encode(jsonString);
    List<int> zipList = <int>[];
    if (kIsWeb) {
      // H5需要差异化处理加解密压缩
      zipList = GZipEncoder().encode(encryptList) ?? <int>[];
    } else {
      zipList = _gZipCodec.encode(encryptList);
    }

    final Encrypted encrypted =
        _encrypter.encryptBytes(zipList, iv: IV.fromUtf8(aesKey));
    return encrypted.base64;
  }

  dynamic deCryptResponse(String cryptString) {
    final Uint8List deCryptList = base64Decode(cryptString);
    final List<int> aesDeCryptList = Uint8List.fromList(_encrypter
        .decryptBytes(Encrypted(deCryptList), iv: IV.fromUtf8(aesKey)));

    List<int> unzipList = <int>[];
    if (kIsWeb) {
      // H5需要差异化处理加解密解压缩
      unzipList = GZipDecoder().decodeBytes(aesDeCryptList);
    } else {
      unzipList = _gZipCodec.decode(aesDeCryptList);
    }

    final String deCryptString = utf8.decode(unzipList);
    final result = jsonDecode(deCryptString);
    return result;
  }
}

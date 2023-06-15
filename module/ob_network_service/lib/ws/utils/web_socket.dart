import 'dart:convert';
import 'dart:typed_data';

import 'package:encrypt/encrypt.dart';
import 'package:flutter/cupertino.dart';
import 'package:web_socket_channel/io.dart';
import 'crypt_utils.dart';
import 'evnent_bus.dart';

class WebSocketUtil {
  // ignore: unused_field
  static IOWebSocketChannel? _webSocket; //网络入口全局唯一
  static String hosts = '';
  static String key = '';
  static String iv = '';

  //链接socket
  static void initialization() {
    _webSocket = IOWebSocketChannel.connect(Uri.parse(hosts));
    debugPrint('连接成功');
    _webSocket?.stream.listen((data) => AesEncodeDataMonitorData(data));
  }

  //初始化解密key
  static void initialCryptKey() {
    CryptUtils(key, iv);
  }

  static bool closeConnect() {
    if (_webSocket != null) {
      _webSocket!.sink.close();
      _webSocket = null;
    }
    return true;
  }

  //AesEncodeDataMonitorData 监听数据
  static void AesEncodeDataMonitorData(dynamic data) {
    //解密
    var decryptoData = CryptUtils.aesDecrypt(encryptedText: data, isZip: false);
    //序列化编码
    Map<String, dynamic> decodeData = jsonDecode(utf8.decode(decryptoData!));
    //通知事件
    EventBusUtil.dispatch(decodeData['commandId'], decodeData['body']);

    debugPrint("收到一条数据>>>>>>>>${decodeData}");
  }

  //AesDecodeDataString 加密数据+发送数据
  static void AesEncodeDataString(dynamic data) {
    debugPrint("发送一条数据>>>>>>>>${jsonEncode(data)}");
    List<int> list = utf8.encode(jsonEncode(data));
    Encrypted crypto = CryptUtils.aesEncrypt(isZip: false, encryptText: list);
    if (_webSocket != null) {
      try {
        // debugPrint('发送中：' + message.toString());
        _webSocket!.sink.add(crypto);
      } catch (e) {
        debugPrint('发送消息失败，请检查网络连接~~~~~~~~');
        debugPrint('${e.toString()}');
      }
    }
  }

  //刷新链接
  static void refreshConnect() {
    if (closeConnect()) {
      initialization();
    }
  }
}

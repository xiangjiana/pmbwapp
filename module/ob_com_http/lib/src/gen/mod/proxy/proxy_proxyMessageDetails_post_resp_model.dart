import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMessageDetailsPostRespModel {
  ProxyProxyMessageDetailsPostRespModel({
    required this.content,
    required this.createAt,
    required this.id,
    required this.merchantId,
    required this.messageStatus,
    required this.title,
    required this.userId,
  });

  factory ProxyProxyMessageDetailsPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyMessageDetailsPostRespModel(
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        messageStatus: jsonRes['messageStatus'] == null
            ? 0
            : asT<int>("messageStatus", jsonRes['messageStatus'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
      );

  String content = '';
  String createAt = '';
  String id = '';
  String merchantId = '';
  int messageStatus = 0;
  String title = '';
  String userId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'createAt': createAt,
        'id': id,
        'merchantId': merchantId,
        'messageStatus': messageStatus,
        'title': title,
        'userId': userId,
      };
}

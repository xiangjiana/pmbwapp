import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMessageDetailsPostReqModel {
  ProxyProxyMessageDetailsPostReqModel({
    required this.messageId,
  });

  factory ProxyProxyMessageDetailsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyMessageDetailsPostReqModel(
        messageId: jsonRes['messageId '] == null
            ? ''
            : asT<String>("messageId ", jsonRes['messageId '])!,
      );

  String messageId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'messageId ': messageId,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMessageReadPostReqModel {
  ProxyProxyMessageReadPostReqModel({
    required this.messageIdList,
  });

  factory ProxyProxyMessageReadPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? messageIdList =
        jsonRes['messageIdList'] is List ? <String>[] : null;
    if (messageIdList != null) {
      for (final dynamic item in jsonRes['messageIdList']!) {
        if (item != null) {
          messageIdList.add(asT<String>("messageIdList", item)!);
        }
      }
    }
    return ProxyProxyMessageReadPostReqModel(
      messageIdList: messageIdList == null ? [] : messageIdList,
    );
  }

  List<String> messageIdList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'messageIdList': messageIdList,
      };
}

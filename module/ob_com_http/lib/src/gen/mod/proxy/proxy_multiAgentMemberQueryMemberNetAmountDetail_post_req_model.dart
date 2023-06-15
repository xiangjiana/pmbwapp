import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentMemberQueryMemberNetAmountDetailPostReqModel {
  ProxyMultiAgentMemberQueryMemberNetAmountDetailPostReqModel({
    required this.memberId,
    required this.parentProxyId,
    required this.staticDate,
    required this.staticDateType,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountDetailPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentMemberQueryMemberNetAmountDetailPostReqModel(
        memberId: jsonRes['memberId'] == null
            ? ''
            : asT<String>("memberId", jsonRes['memberId'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? ''
            : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
        staticDateType: jsonRes['staticDateType'] == null
            ? 0
            : asT<int>("staticDateType", jsonRes['staticDateType'])!,
      );

  String memberId = '';
  String parentProxyId = '';
  int staticDate = 0;
  int staticDateType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberId': memberId,
        'parentProxyId': parentProxyId,
        'staticDate': staticDate,
        'staticDateType': staticDateType,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameMultiAgentProxyQueryMemberNetAmountDetailDayPostReqModel {
  GameMultiAgentProxyQueryMemberNetAmountDetailDayPostReqModel({
    required this.memberId,
    required this.parentProxyId,
    required this.staticDate,
  });

  factory GameMultiAgentProxyQueryMemberNetAmountDetailDayPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameMultiAgentProxyQueryMemberNetAmountDetailDayPostReqModel(
        memberId: jsonRes['memberId'] == null
            ? '0'
            : asT<String>("memberId", jsonRes['memberId'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? '0'
            : asT<String>("parentProxyId", jsonRes['parentProxyId'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
      );

  String memberId = '0';
  String parentProxyId = '0';
  int staticDate = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberId': memberId,
        'parentProxyId': parentProxyId,
        'staticDate': staticDate,
      };
}

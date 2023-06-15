import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentMemberQueryMemberNetAmountPostReqModel {
  ProxyMultiAgentMemberQueryMemberNetAmountPostReqModel({
    required this.accountType,
    required this.memberChoose,
    required this.pageNum,
    required this.pageSize,
    required this.sortType,
    required this.staticDate,
    required this.staticDateType,
    required this.userName,
  });

  factory ProxyMultiAgentMemberQueryMemberNetAmountPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyMultiAgentMemberQueryMemberNetAmountPostReqModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        memberChoose: jsonRes['memberChoose'] == null
            ? 0
            : asT<int>("memberChoose", jsonRes['memberChoose'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        sortType: jsonRes['sortType'] == null
            ? 0
            : asT<int>("sortType", jsonRes['sortType'])!,
        staticDate: jsonRes['staticDate'] == null
            ? 0
            : asT<int>("staticDate", jsonRes['staticDate'])!,
        staticDateType: jsonRes['staticDateType'] == null
            ? 0
            : asT<int>("staticDateType", jsonRes['staticDateType'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int accountType = 0;
  int memberChoose = 0;
  int pageNum = 0;
  int pageSize = 0;
  int sortType = 0;
  int staticDate = 0;
  int staticDateType = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'memberChoose': memberChoose,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'sortType': sortType,
        'staticDate': staticDate,
        'staticDateType': staticDateType,
        'userName': userName,
      };
}

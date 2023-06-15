import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectMemberAccountPostReqModel {
  UserApiSelectMemberAccountPostReqModel({
    required this.clientType,
    required this.occurDtEnd,
    required this.occurDtStart,
    required this.pageNum,
    required this.pageSize,
  });

  factory UserApiSelectMemberAccountPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSelectMemberAccountPostReqModel(
        clientType: jsonRes['clientType'] == null
            ? 0
            : asT<int>("clientType", jsonRes['clientType'])!,
        occurDtEnd: jsonRes['occurDtEnd'] == null
            ? ''
            : asT<String>("occurDtEnd", jsonRes['occurDtEnd'])!,
        occurDtStart: jsonRes['occurDtStart'] == null
            ? ''
            : asT<String>("occurDtStart", jsonRes['occurDtStart'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  int clientType = 0;
  String occurDtEnd = '';
  String occurDtStart = '';
  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'clientType': clientType,
        'occurDtEnd': occurDtEnd,
        'occurDtStart': occurDtStart,
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}

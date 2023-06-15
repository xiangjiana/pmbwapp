import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2MemberGameRecordDetailPostReqModel {
  ProxySystem2MemberGameRecordDetailPostReqModel({
    required this.gameId,
    required this.pageNum,
    required this.pageSize,
  });

  factory ProxySystem2MemberGameRecordDetailPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2MemberGameRecordDetailPostReqModel(
        gameId: jsonRes['gameId'] == null
            ? ''
            : asT<String>("gameId", jsonRes['gameId'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  String gameId = '';
  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameId': gameId,
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}

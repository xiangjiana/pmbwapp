import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberGameRecordsPostReqModel {
  ProxyLowerMemberGameRecordsPostReqModel({
    required this.betStatus,
    required this.createAtEnd,
    required this.createAtStart,
    required this.gameCode,
    required this.id,
    required this.orderType,
    required this.pageNum,
    required this.pageSize,
    required this.userName,
  });

  factory ProxyLowerMemberGameRecordsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerMemberGameRecordsPostReqModel(
        betStatus: jsonRes['betStatus'] == null
            ? ''
            : asT<String>("betStatus", jsonRes['betStatus'])!,
        createAtEnd: jsonRes['createAtEnd'] == null
            ? ''
            : asT<String>("createAtEnd", jsonRes['createAtEnd'])!,
        createAtStart: jsonRes['createAtStart'] == null
            ? ''
            : asT<String>("createAtStart", jsonRes['createAtStart'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        orderType: jsonRes['orderType'] == null
            ? 0
            : asT<int>("orderType", jsonRes['orderType'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String betStatus = '';
  String createAtEnd = '';
  String createAtStart = '';
  String gameCode = '';
  String id = '';
  int orderType = 0;
  int pageNum = 0;
  int pageSize = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betStatus': betStatus,
        'createAtEnd': createAtEnd,
        'createAtStart': createAtStart,
        'gameCode': gameCode,
        'id': id,
        'orderType': orderType,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'userName': userName,
      };
}

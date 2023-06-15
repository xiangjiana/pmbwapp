import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyLowerMemberDiscountRecordsPostReqModel {
  ProxyLowerMemberDiscountRecordsPostReqModel({
    required this.id,
    required this.isTimeOrder,
    required this.pageNum,
    required this.pageSize,
    required this.playerName,
    required this.receiveTimeEnd,
    required this.receiveTimeStart,
    required this.type,
  });

  factory ProxyLowerMemberDiscountRecordsPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyLowerMemberDiscountRecordsPostReqModel(
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isTimeOrder: jsonRes['isTimeOrder'] == null
            ? false
            : asT<bool>("isTimeOrder", jsonRes['isTimeOrder'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        playerName: jsonRes['playerName'] == null
            ? ''
            : asT<String>("playerName", jsonRes['playerName'])!,
        receiveTimeEnd: jsonRes['receiveTimeEnd'] == null
            ? ''
            : asT<String>("receiveTimeEnd", jsonRes['receiveTimeEnd'])!,
        receiveTimeStart: jsonRes['receiveTimeStart'] == null
            ? ''
            : asT<String>("receiveTimeStart", jsonRes['receiveTimeStart'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  String id = '';
  bool isTimeOrder = false;
  int pageNum = 0;
  int pageSize = 0;
  String playerName = '';
  String receiveTimeEnd = '';
  String receiveTimeStart = '';
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'isTimeOrder': isTimeOrder,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'playerName': playerName,
        'receiveTimeEnd': receiveTimeEnd,
        'receiveTimeStart': receiveTimeStart,
        'type': type,
      };
}

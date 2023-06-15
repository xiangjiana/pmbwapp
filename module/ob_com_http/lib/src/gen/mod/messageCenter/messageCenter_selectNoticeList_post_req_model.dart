import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterSelectNoticeListPostReqModel {
  MessageCenterSelectNoticeListPostReqModel({
    required this.pageNum,
    required this.pageSize,
    required this.type,
  });

  factory MessageCenterSelectNoticeListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageCenterSelectNoticeListPostReqModel(
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int pageNum = 0;
  int pageSize = 0;
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'type': type,
      };
}

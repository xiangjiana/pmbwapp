import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FeedBackFeedBackListPostReqModel {
  FeedBackFeedBackListPostReqModel({
    required this.pageNum,
    required this.pageSize,
  });

  factory FeedBackFeedBackListPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      FeedBackFeedBackListPostReqModel(
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
      );

  int pageNum = 0;
  int pageSize = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
      };
}

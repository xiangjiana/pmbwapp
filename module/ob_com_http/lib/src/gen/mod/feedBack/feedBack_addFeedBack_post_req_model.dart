import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FeedBackAddFeedBackPostReqModel {
  FeedBackAddFeedBackPostReqModel({
    required this.deviceType,
    required this.problemType,
    required this.deviceTypeInfo,
    required this.url,
    required this.deviceNo,
    required this.problemDescribe,
  });

  factory FeedBackAddFeedBackPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      FeedBackAddFeedBackPostReqModel(
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        problemType: jsonRes['problemType'] == null
            ? 0
            : asT<int>("problemType", jsonRes['problemType'])!,
        deviceTypeInfo: jsonRes['deviceTypeInfo'] == null
            ? ''
            : asT<String>("deviceTypeInfo", jsonRes['deviceTypeInfo'])!,
        url: jsonRes['url'] == null ? '' : asT<String>("url", jsonRes['url'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        problemDescribe: jsonRes['problemDescribe'] == null
            ? ''
            : asT<String>("problemDescribe", jsonRes['problemDescribe'])!,
      );

  int deviceType = 0;
  int problemType = 0;
  String deviceTypeInfo = '';
  String url = '';
  String deviceNo = '';
  String problemDescribe = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
        'problemType': problemType,
        'deviceTypeInfo': deviceTypeInfo,
        'url': url,
        'deviceNo': deviceNo,
        'problemDescribe': problemDescribe,
      };
}

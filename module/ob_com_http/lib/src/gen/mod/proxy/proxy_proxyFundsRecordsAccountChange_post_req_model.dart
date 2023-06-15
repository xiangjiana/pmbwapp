import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyFundsRecordsAccountChangePostReqModel {
  ProxyProxyFundsRecordsAccountChangePostReqModel({
    required this.accountType,
    required this.occurDtEnd,
    required this.occurDtStart,
    required this.pageNum,
    required this.pageSize,
    required this.type,
  });

  factory ProxyProxyFundsRecordsAccountChangePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyFundsRecordsAccountChangePostReqModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
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
        type: jsonRes['type'] == null ? 0 : asT<int>("type", jsonRes['type'])!,
      );

  int accountType = 0;
  String occurDtEnd = '';
  String occurDtStart = '';
  int pageNum = 0;
  int pageSize = 0;
  int type = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'occurDtEnd': occurDtEnd,
        'occurDtStart': occurDtStart,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'type': type,
      };
}

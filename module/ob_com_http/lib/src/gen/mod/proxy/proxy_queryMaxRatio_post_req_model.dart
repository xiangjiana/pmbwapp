import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyQueryMaxRatioPostReqModel {
  ProxyQueryMaxRatioPostReqModel({
    required this.contractType,
    required this.policyTypeConfigId,
    required this.userName,
  });

  factory ProxyQueryMaxRatioPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyQueryMaxRatioPostReqModel(
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        policyTypeConfigId: jsonRes['policyTypeConfigId'] == null
            ? 0
            : asT<int>("policyTypeConfigId", jsonRes['policyTypeConfigId'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int contractType = 0;
  int policyTypeConfigId = 0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractType': contractType,
        'policyTypeConfigId': policyTypeConfigId,
        'userName': userName,
      };
}

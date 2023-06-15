import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractLowestContractProportionPostReqModel {
  ProxyProxyContractLowestContractProportionPostReqModel({
    required this.contractType,
    required this.parentProxyName,
    required this.rebateRatio,
    required this.userName,
  });

  factory ProxyProxyContractLowestContractProportionPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractLowestContractProportionPostReqModel(
        contractType: jsonRes['contractType'] == null
            ? 0
            : asT<int>("contractType", jsonRes['contractType'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        rebateRatio: jsonRes['rebateRatio'] == null
            ? 0.0
            : asT<double>("rebateRatio", jsonRes['rebateRatio'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  int contractType = 0;
  String parentProxyName = '';
  double rebateRatio = 0.0;
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'contractType': contractType,
        'parentProxyName': parentProxyName,
        'rebateRatio': rebateRatio,
        'userName': userName,
      };
}

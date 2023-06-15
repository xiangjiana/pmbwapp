import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyContractContractToBeSignedPostRespModel {
  ProxyProxyContractContractToBeSignedPostRespModel({
    required this.data,
  });

  factory ProxyProxyContractContractToBeSignedPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyContractContractToBeSignedPostRespModel(
        data: jsonRes['data'] == null
            ? false
            : asT<bool>("data", jsonRes['data'])!,
      );

  bool data = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

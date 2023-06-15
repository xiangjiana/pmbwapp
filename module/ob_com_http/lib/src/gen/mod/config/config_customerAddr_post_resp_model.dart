import 'dart:convert';

import '../../../../ob_com_http.dart';


// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigCustomerAddrPostRespModel {
  ConfigCustomerAddrPostRespModel({
    required this.merchantId,
    required this.merchantCode,
    required this.memberUrl,
    required this.proxyUrl,
  });

  factory ConfigCustomerAddrPostRespModel.fromJson(Map<String, dynamic> jsonRes) => ConfigCustomerAddrPostRespModel(
    merchantId: jsonRes['merchantId'] == null
        ? 0
        : asT<int>("merchantId", jsonRes['merchantId'])!,
    merchantCode: jsonRes['merchantCode'] == null
        ? ''
        : asT<String>("merchantCode", jsonRes['merchantCode'])!,
    memberUrl: jsonRes['memberUrl'] == null
        ? ''
        : asT<String>("memberUrl", jsonRes['memberUrl'])!,
    proxyUrl: jsonRes['proxyUrl'] == null
        ? ''
        : asT<String>("proxyUrl", jsonRes['proxyUrl'])!,
  );

  int merchantId = 0;
  String merchantCode = '';
  String memberUrl = '';
  String proxyUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'merchantId': merchantId,
    'merchantCode': merchantCode,
    'memberUrl': memberUrl,
    'proxyUrl': proxyUrl,
  };
}



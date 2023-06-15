import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ValetRechargeGenerateRechargePostRespModel {
  ValetRechargeGenerateRechargePostRespModel({
    required this.customerUrl,
    required this.valetCode,
  });

  factory ValetRechargeGenerateRechargePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ValetRechargeGenerateRechargePostRespModel(
        customerUrl: jsonRes['customerUrl'] == null
            ? ''
            : asT<String>("customerUrl", jsonRes['customerUrl'])!,
        valetCode: jsonRes['valetCode'] == null
            ? 0
            : asT<int>("valetCode", jsonRes['valetCode'])!,
      );

  String customerUrl = '';
  int valetCode = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'customerUrl': customerUrl,
        'valetCode': valetCode,
      };
}

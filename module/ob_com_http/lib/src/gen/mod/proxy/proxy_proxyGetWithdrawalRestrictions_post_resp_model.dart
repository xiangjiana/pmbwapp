import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyGetWithdrawalRestrictionsPostRespModel {
  ProxyProxyGetWithdrawalRestrictionsPostRespModel({
    required this.dayWithdrawalRestrictions,
    required this.maxWithdrawalRestrictions,
    required this.minWithdrawalRestrictions,
  });

  factory ProxyProxyGetWithdrawalRestrictionsPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyGetWithdrawalRestrictionsPostRespModel(
        dayWithdrawalRestrictions: jsonRes['dayWithdrawalRestrictions'] == null
            ? 0
            : asT<int>("dayWithdrawalRestrictions",
                jsonRes['dayWithdrawalRestrictions'])!,
        maxWithdrawalRestrictions: jsonRes['maxWithdrawalRestrictions'] == null
            ? 0
            : asT<int>("maxWithdrawalRestrictions",
                jsonRes['maxWithdrawalRestrictions'])!,
        minWithdrawalRestrictions: jsonRes['minWithdrawalRestrictions'] == null
            ? 0
            : asT<int>("minWithdrawalRestrictions",
                jsonRes['minWithdrawalRestrictions'])!,
      );

  int dayWithdrawalRestrictions = 0;
  int maxWithdrawalRestrictions = 0;
  int minWithdrawalRestrictions = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dayWithdrawalRestrictions': dayWithdrawalRestrictions,
        'maxWithdrawalRestrictions': maxWithdrawalRestrictions,
        'minWithdrawalRestrictions': minWithdrawalRestrictions,
      };
}

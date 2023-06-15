import 'dart:convert';
import '../../utils/type_convert.dart';

T? asT<T>(String key, dynamic value) {
  // if (value is T) {
  //   return value;
  // }
  return asTFix(key, value, CustomTrace(StackTrace.current));
}

class TypayGetVirtualRatePostRespModel {
  TypayGetVirtualRatePostRespModel({
    required this.memberDepositRate,
    required this.memberWithdrawRate,
    required this.proxyDepositRate,
  });

  factory TypayGetVirtualRatePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      TypayGetVirtualRatePostRespModel(
        memberDepositRate: jsonRes['memberDepositRate'] == null
            ? 0.0
            : asT<double>("memberDepositRate", jsonRes['memberDepositRate'])!,
        memberWithdrawRate: jsonRes['memberWithdrawRate'] == null
            ? 0.0
            : asT<double>("memberWithdrawRate", jsonRes['memberWithdrawRate'])!,
        proxyDepositRate: jsonRes['proxyDepositRate'] == null
            ? 0.0
            : asT<double>("proxyDepositRate", jsonRes['proxyDepositRate'])!,
      );

  double memberDepositRate = 0.0;
  double memberWithdrawRate = 0.0;
  double proxyDepositRate = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberDepositRate': memberDepositRate,
        'memberWithdrawRate': memberWithdrawRate,
        'proxyDepositRate': proxyDepositRate,
      };
}

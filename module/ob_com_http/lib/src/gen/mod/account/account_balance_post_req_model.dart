import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccountBalancePostReqModel {
  AccountBalancePostReqModel({
    required this.accountType,
  });

  factory AccountBalancePostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      AccountBalancePostReqModel(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
      );

  int accountType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
      };
}

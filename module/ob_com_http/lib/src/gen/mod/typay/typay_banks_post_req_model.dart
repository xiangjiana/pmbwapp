import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayBanksPostReqModel {
  TypayBanksPostReqModel({
    required this.clientType,
  });

  factory TypayBanksPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      TypayBanksPostReqModel(
        clientType: jsonRes['client_type'] == null
            ? 0
            : asT<int>("client_type", jsonRes['client_type'])!,
      );

  int clientType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'client_type': clientType,
      };
}

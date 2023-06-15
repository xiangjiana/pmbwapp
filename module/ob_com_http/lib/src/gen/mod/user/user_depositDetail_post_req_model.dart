import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserDepositDetailPostReqModel {
  UserDepositDetailPostReqModel({
    required this.merchantOrderId,
  });

  factory UserDepositDetailPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserDepositDetailPostReqModel(
        merchantOrderId: jsonRes['merchantOrderId'] == null
            ? ''
            : asT<String>("merchantOrderId", jsonRes['merchantOrderId'])!,
      );

  String merchantOrderId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'merchantOrderId': merchantOrderId,
      };
}

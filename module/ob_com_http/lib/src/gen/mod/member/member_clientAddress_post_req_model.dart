import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberClientAddressPostReqModel {
  MemberClientAddressPostReqModel({
    required this.merchantId,
  });

  factory MemberClientAddressPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberClientAddressPostReqModel(
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
      );

  String merchantId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'merchantId': merchantId,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2OrderEatOrderPostReqModel {
  ProxySystem2OrderEatOrderPostReqModel({
    required this.orderId,
  });

  factory ProxySystem2OrderEatOrderPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2OrderEatOrderPostReqModel(
        orderId: jsonRes['orderId'] == null
            ? ''
            : asT<String>("orderId", jsonRes['orderId'])!,
      );

  String orderId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderId': orderId,
      };
}

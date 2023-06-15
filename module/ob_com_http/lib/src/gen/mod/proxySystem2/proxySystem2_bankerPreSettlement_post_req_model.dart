import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerPreSettlementPostReqModel {
  ProxySystem2BankerPreSettlementPostReqModel({
    required this.month,
  });

  factory ProxySystem2BankerPreSettlementPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2BankerPreSettlementPostReqModel(
        month: jsonRes['month'] == null
            ? ''
            : asT<String>("month", jsonRes['month'])!,
      );

  String month = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'month': month,
      };
}

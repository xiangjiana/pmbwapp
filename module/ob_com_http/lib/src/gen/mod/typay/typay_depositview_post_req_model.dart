import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayDepositviewPostReqModel {
  TypayDepositviewPostReqModel({
    required this.merchantId,
    required this.merchantOrderId,
    required this.remark,
  });

  factory TypayDepositviewPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      TypayDepositviewPostReqModel(
        merchantId: jsonRes['merchant_id'] == null
            ? 0
            : asT<int>("merchant_id", jsonRes['merchant_id'])!,
        merchantOrderId: jsonRes['merchant_order_id'] == null
            ? ''
            : asT<String>("merchant_order_id", jsonRes['merchant_order_id'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  int merchantId = 0;
  String merchantOrderId = '';
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'merchant_id': merchantId,
        'merchant_order_id': merchantOrderId,
        'remark': remark,
      };
}

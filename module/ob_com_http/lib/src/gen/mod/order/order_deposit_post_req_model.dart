import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class OrderDepositPostReqModel {
  OrderDepositPostReqModel({
    required this.bankCode,
    required this.deviceNo,
    required this.deviceType,
    required this.orderAmount,
    required this.payType,
  });

  factory OrderDepositPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      OrderDepositPostReqModel(
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0
            : asT<int>("orderAmount", jsonRes['orderAmount'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
      );

  String bankCode = '';
  String deviceNo = '';
  int deviceType = 0;
  int orderAmount = 0;
  int payType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCode': bankCode,
        'deviceNo': deviceNo,
        'deviceType': deviceType,
        'orderAmount': orderAmount,
        'payType': payType,
      };
}

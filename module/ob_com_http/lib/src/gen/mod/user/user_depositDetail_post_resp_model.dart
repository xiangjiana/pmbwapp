import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserDepositDetailPostRespModel {
  UserDepositDetailPostRespModel({
    required this.orderAmount,
    required this.orderStatus,
    required this.payType,
    required this.bizType,
    required this.createdAt,
    required this.merchantOrderId,
    required this.thirdOrderNo,
    required this.remark,
  });

  factory UserDepositDetailPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserDepositDetailPostRespModel(
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        merchantOrderId: jsonRes['merchantOrderId'] == null
            ? ''
            : asT<String>("merchantOrderId", jsonRes['merchantOrderId'])!,
        thirdOrderNo: jsonRes['thirdOrderNo'] == null
            ? ''
            : asT<String>("thirdOrderNo", jsonRes['thirdOrderNo'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  double orderAmount = 0.0;
  int orderStatus = 0;
  int payType = 0;
  int bizType = 0;
  String createdAt = '';
  String merchantOrderId = '';
  String thirdOrderNo = '';
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'payType': payType,
        'bizType': bizType,
        'createdAt': createdAt,
        'merchantOrderId': merchantOrderId,
        'thirdOrderNo': thirdOrderNo,
        'remark': remark,
      };
}

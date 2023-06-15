import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayDepositviewPostRespModel {
  TypayDepositviewPostRespModel({
    required this.bankCode,
    required this.merchantId,
    required this.merchantOrderId,
    required this.payAmt,
    required this.payMessage,
    required this.payPaidAmt,
    required this.payResult,
    required this.payType,
    required this.remark,
    required this.sign,
    required this.typayOrderId,
    required this.userPaidCardno,
    required this.userPaidName,
  });

  factory TypayDepositviewPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      TypayDepositviewPostRespModel(
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        merchantOrderId: jsonRes['merchantOrderId'] == null
            ? ''
            : asT<String>("merchantOrderId", jsonRes['merchantOrderId'])!,
        payAmt: jsonRes['payAmt'] == null
            ? 0.0
            : asT<double>("payAmt", jsonRes['payAmt'])!,
        payMessage: jsonRes['payMessage'] == null
            ? 0
            : asT<int>("payMessage", jsonRes['payMessage'])!,
        payPaidAmt: jsonRes['payPaidAmt'] == null
            ? 0.0
            : asT<double>("payPaidAmt", jsonRes['payPaidAmt'])!,
        payResult: jsonRes['payResult'] == null
            ? ''
            : asT<String>("payResult", jsonRes['payResult'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        sign: jsonRes['sign'] == null
            ? ''
            : asT<String>("sign", jsonRes['sign'])!,
        typayOrderId: jsonRes['typayOrderId'] == null
            ? ''
            : asT<String>("typayOrderId", jsonRes['typayOrderId'])!,
        userPaidCardno: jsonRes['userPaidCardno'] == null
            ? ''
            : asT<String>("userPaidCardno", jsonRes['userPaidCardno'])!,
        userPaidName: jsonRes['userPaidName'] == null
            ? ''
            : asT<String>("userPaidName", jsonRes['userPaidName'])!,
      );

  String bankCode = '';
  int merchantId = 0;
  String merchantOrderId = '';
  double payAmt = 0.0;
  int payMessage = 0;
  double payPaidAmt = 0.0;
  String payResult = '';
  int payType = 0;
  String remark = '';
  String sign = '';
  String typayOrderId = '';
  String userPaidCardno = '';
  String userPaidName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCode': bankCode,
        'merchantId': merchantId,
        'merchantOrderId': merchantOrderId,
        'payAmt': payAmt,
        'payMessage': payMessage,
        'payPaidAmt': payPaidAmt,
        'payResult': payResult,
        'payType': payType,
        'remark': remark,
        'sign': sign,
        'typayOrderId': typayOrderId,
        'userPaidCardno': userPaidCardno,
        'userPaidName': userPaidName,
      };
}

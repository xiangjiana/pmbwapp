import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserDepositPostRespModel {
  UserDepositPostRespModel({
    required this.bankCode,
    required this.bankName,
    required this.ownerName,
    required this.bank,
    required this.linkType,
    required this.merchantOrderId,
    required this.payAmt,
    required this.payChannel,
    required this.payChannelIndex,
    required this.payMessage,
    required this.payResult,
    required this.payType,
    required this.qrUrl,
    required this.qrUrlOffline,
    required this.remark,
    required this.thirdOrderNo,
    required this.typayOrderId,
  });

  factory UserDepositPostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserDepositPostRespModel(
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        bankName: jsonRes['bankName'] == null
            ? ''
            : asT<String>("bankName", jsonRes['bankName'])!,
        bank: jsonRes['bank'] == null
            ? ''
            : asT<String>("bank", jsonRes['bank'])!,
        ownerName: jsonRes['ownerName'] == null
            ? ''
            : asT<String>("ownerName", jsonRes['ownerName'])!,
        linkType: jsonRes['linkType'] == null
            ? 0
            : asT<int>("linkType", jsonRes['linkType'])!,
        merchantOrderId: jsonRes['merchantOrderId'] == null
            ? ''
            : asT<String>("merchantOrderId", jsonRes['merchantOrderId'])!,
        payAmt: jsonRes['payAmt'] == null
            ? 0.0
            : asT<double>("payAmt", jsonRes['payAmt'])!,
        payChannel: jsonRes['payChannel'] == null
            ? ''
            : asT<String>("payChannel", jsonRes['payChannel'])!,
        payChannelIndex: jsonRes['payChannelIndex'] == null
            ? 0
            : asT<int>("payChannelIndex", jsonRes['payChannelIndex'])!,
        payMessage: jsonRes['payMessage'] == null
            ? 0
            : asT<int>("payMessage", jsonRes['payMessage'])!,
        payResult: jsonRes['payResult'] == null
            ? ''
            : asT<String>("payResult", jsonRes['payResult'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
        qrUrl: jsonRes['qrUrl'] == null
            ? ''
            : asT<String>("qrUrl", jsonRes['qrUrl'])!,
        qrUrlOffline: jsonRes['qrUrlOffline'] == null
            ? ''
            : asT<String>("qrUrlOffline", jsonRes['qrUrlOffline'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        thirdOrderNo: jsonRes['thirdOrderNo'] == null
            ? ''
            : asT<String>("thirdOrderNo", jsonRes['thirdOrderNo'])!,
        typayOrderId: jsonRes['typayOrderId'] == null
            ? ''
            : asT<String>("typayOrderId", jsonRes['typayOrderId'])!,
      );

  String bankCode = '';
  String bankName = '';
  String bank = '';
  String ownerName = '';
  int linkType = 0;
  String merchantOrderId = '';
  double payAmt = 0.0;
  String payChannel = '';
  int payChannelIndex = 0;
  int payMessage = 0;
  String payResult = '';
  int payType = 0;
  String qrUrl = '';
  String qrUrlOffline = '';
  String remark = '';
  String thirdOrderNo = '';
  String typayOrderId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCode': bankCode,
        'bankName': bankName,
        'bank': bank,
        'ownerName': ownerName,
        'linkType': linkType,
        'merchantOrderId': merchantOrderId,
        'payAmt': payAmt,
        'payChannel': payChannel,
        'payChannelIndex': payChannelIndex,
        'payMessage': payMessage,
        'payResult': payResult,
        'payType': payType,
        'qrUrl': qrUrl,
        'qrUrlOffline': qrUrlOffline,
        'remark': remark,
        'thirdOrderNo': thirdOrderNo,
        'typayOrderId': typayOrderId,
      };
}

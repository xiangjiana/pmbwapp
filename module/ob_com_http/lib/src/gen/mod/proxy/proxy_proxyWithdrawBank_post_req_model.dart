import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyWithdrawBankPostReqModel {
  ProxyProxyWithdrawBankPostReqModel({
    required this.bankReqDTO,
    required this.deviceNo,
    required this.orderAmount,
    required this.payPassword,
  });

  factory ProxyProxyWithdrawBankPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyWithdrawBankPostReqModel(
        bankReqDTO: jsonRes["bankReqDTO"] == null
            ? BankReqDTO.fromJson({})
            : BankReqDTO.fromJson(asT<Map<String, dynamic>>(
                "bankReqDTO", jsonRes["bankReqDTO"])!),
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        payPassword: jsonRes['payPassword'] == null
            ? ''
            : asT<String>("payPassword", jsonRes['payPassword'])!,
      );

  BankReqDTO bankReqDTO;
  String deviceNo = '';
  double orderAmount = 0.0;
  String payPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankReqDTO': bankReqDTO,
        'deviceNo': deviceNo,
        'orderAmount': orderAmount,
        'payPassword': payPassword,
      };
}

class BankReqDTO {
  BankReqDTO({
    required this.bankAddress,
    required this.bankCode,
    required this.bankName,
    required this.cardNumber,
    required this.cardholderName,
    required this.city,
    required this.province,
  });

  factory BankReqDTO.fromJson(Map<String, dynamic> jsonRes) => BankReqDTO(
        bankAddress: jsonRes['bankAddress'] == null
            ? ''
            : asT<String>("bankAddress", jsonRes['bankAddress'])!,
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        bankName: jsonRes['bankName'] == null
            ? ''
            : asT<String>("bankName", jsonRes['bankName'])!,
        cardNumber: jsonRes['cardNumber'] == null
            ? ''
            : asT<String>("cardNumber", jsonRes['cardNumber'])!,
        cardholderName: jsonRes['cardholderName'] == null
            ? ''
            : asT<String>("cardholderName", jsonRes['cardholderName'])!,
        city: jsonRes['city'] == null
            ? ''
            : asT<String>("city", jsonRes['city'])!,
        province: jsonRes['province'] == null
            ? ''
            : asT<String>("province", jsonRes['province'])!,
      );

  String bankAddress = '';
  String bankCode = '';
  String bankName = '';
  String cardNumber = '';
  String cardholderName = '';
  String city = '';
  String province = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankAddress': bankAddress,
        'bankCode': bankCode,
        'bankName': bankName,
        'cardNumber': cardNumber,
        'cardholderName': cardholderName,
        'city': city,
        'province': province,
      };
}

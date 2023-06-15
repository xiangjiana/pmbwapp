import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyValidateBankPostReqModel {
  ProxyProxyValidateBankPostReqModel({
    required this.bankAddress,
    required this.bankCode,
    required this.bankName,
    required this.cardNumber,
    required this.cardholderName,
    required this.city,
    required this.province,
  });

  factory ProxyProxyValidateBankPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyProxyValidateBankPostReqModel(
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

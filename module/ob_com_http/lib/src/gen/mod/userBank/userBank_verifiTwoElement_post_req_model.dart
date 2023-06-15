import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankVerifiTwoElementPostReqModel {
  UserBankVerifiTwoElementPostReqModel({
    required this.cardNumber,
    required this.cardholderName,
  });

  factory UserBankVerifiTwoElementPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserBankVerifiTwoElementPostReqModel(
        cardNumber: jsonRes['cardNumber'] == null
            ? ''
            : asT<String>("cardNumber", jsonRes['cardNumber'])!,
        cardholderName: jsonRes['cardholderName'] == null
            ? ''
            : asT<String>("cardholderName", jsonRes['cardholderName'])!,
      );

  String cardNumber = '';
  String cardholderName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cardNumber': cardNumber,
        'cardholderName': cardholderName,
      };
}

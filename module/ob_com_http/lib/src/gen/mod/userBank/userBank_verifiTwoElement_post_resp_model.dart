import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankVerifiTwoElementPostRespModel {
  UserBankVerifiTwoElementPostRespModel({
    required this.bankId,
    required this.bankLogo,
    required this.bankName,
    required this.bankPhone,
    required this.bankUrl,
    required this.cardType,
    required this.code,
    required this.desc,
  });

  factory UserBankVerifiTwoElementPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserBankVerifiTwoElementPostRespModel(
        bankId: jsonRes['bankId'] == null
            ? ''
            : asT<String>("bankId", jsonRes['bankId'])!,
        bankLogo: jsonRes['bankLogo'] == null
            ? ''
            : asT<String>("bankLogo", jsonRes['bankLogo'])!,
        bankName: jsonRes['bankName'] == null
            ? ''
            : asT<String>("bankName", jsonRes['bankName'])!,
        bankPhone: jsonRes['bankPhone'] == null
            ? ''
            : asT<String>("bankPhone", jsonRes['bankPhone'])!,
        bankUrl: jsonRes['bankUrl'] == null
            ? ''
            : asT<String>("bankUrl", jsonRes['bankUrl'])!,
        cardType: jsonRes['cardType'] == null
            ? ''
            : asT<String>("cardType", jsonRes['cardType'])!,
        code: jsonRes['code'] == null ? 0 : asT<int>("code", jsonRes['code'])!,
        desc: jsonRes['desc'] == null
            ? ''
            : asT<String>("desc", jsonRes['desc'])!,
      );

  String bankId = '';
  String bankLogo = '';
  String bankName = '';
  String bankPhone = '';
  String bankUrl = '';
  String cardType = '';
  int code = 0;
  String desc = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankId': bankId,
        'bankLogo': bankLogo,
        'bankName': bankName,
        'bankPhone': bankPhone,
        'bankUrl': bankUrl,
        'cardType': cardType,
        'code': code,
        'desc': desc,
      };
}

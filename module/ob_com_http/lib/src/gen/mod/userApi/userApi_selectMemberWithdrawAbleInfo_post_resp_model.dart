import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectMemberWithdrawAbleInfoPostRespModel {
  UserApiSelectMemberWithdrawAbleInfoPostRespModel({
    required this.bankCardMaxAmount,
    required this.bankCardMinAmount,
    required this.dateNum,
    required this.dateWithdrawAbleAmount,
    required this.virtualCardMaxAmount,
    required this.virtualCardMinAmount,
    required this.isWithdrawalByBank,
  });

  factory UserApiSelectMemberWithdrawAbleInfoPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSelectMemberWithdrawAbleInfoPostRespModel(
        bankCardMaxAmount: jsonRes['bankCardMaxAmount'] == null
            ? 0.0
            : asT<double>("bankCardMaxAmount", jsonRes['bankCardMaxAmount'])!,
        bankCardMinAmount: jsonRes['bankCardMinAmount'] == null
            ? 0.0
            : asT<double>("bankCardMinAmount", jsonRes['bankCardMinAmount'])!,
        dateNum: jsonRes['dateNum'] == null
            ? 0
            : asT<int>("dateNum", jsonRes['dateNum'])!,
        dateWithdrawAbleAmount: jsonRes['dateWithdrawAbleAmount'] == null
            ? 0.0
            : asT<double>(
                "dateWithdrawAbleAmount", jsonRes['dateWithdrawAbleAmount'])!,
        virtualCardMaxAmount: jsonRes['virtualCardMaxAmount'] == null
            ? 0.0
            : asT<double>(
                "virtualCardMaxAmount", jsonRes['virtualCardMaxAmount'])!,
        virtualCardMinAmount: jsonRes['virtualCardMinAmount'] == null
            ? 0.0
            : asT<double>(
                "virtualCardMinAmount", jsonRes['virtualCardMinAmount'])!,
        isWithdrawalByBank: jsonRes['isWithdrawalByBank'] == null
            ? 0.0
            : asT<double>("isWithdrawalByBank", jsonRes['isWithdrawalByBank'])!,
      );

  double bankCardMaxAmount = 0.0;
  double bankCardMinAmount = 0.0;
  int dateNum = 0;
  double dateWithdrawAbleAmount = 0.0;
  double virtualCardMaxAmount = 0.0;
  double virtualCardMinAmount = 0.0;
  double isWithdrawalByBank = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCardMaxAmount': bankCardMaxAmount,
        'bankCardMinAmount': bankCardMinAmount,
        'dateNum': dateNum,
        'dateWithdrawAbleAmount': dateWithdrawAbleAmount,
        'virtualCardMaxAmount': virtualCardMaxAmount,
        'virtualCardMinAmount': virtualCardMinAmount,
        'isWithdrawalByBank': isWithdrawalByBank,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectVipLevelPostRespModel {
  UserApiSelectVipLevelPostRespModel({
    required this.bjValidBetsCurr,
    required this.bjValidBetsLave,
    required this.bjValidBetsTotal,
    required this.depositAmountCurr,
    required this.depositAmountLave,
    required this.depositAmountTotal,
    required this.experience,
    required this.grade,
    required this.validBetsCurr,
    required this.validBetsLave,
    required this.validBetsTotal,
    required this.vipGradeId,
  });

  factory UserApiSelectVipLevelPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiSelectVipLevelPostRespModel(
        bjValidBetsCurr: jsonRes['bjValidBetsCurr'] == null
            ? 0.0
            : asT<double>("bjValidBetsCurr", jsonRes['bjValidBetsCurr'])!,
        bjValidBetsLave: jsonRes['bjValidBetsLave'] == null
            ? 0.0
            : asT<double>("bjValidBetsLave", jsonRes['bjValidBetsLave'])!,
        bjValidBetsTotal: jsonRes['bjValidBetsTotal'] == null
            ? 0
            : asT<int>("bjValidBetsTotal", jsonRes['bjValidBetsTotal'])!,
        depositAmountCurr: jsonRes['depositAmountCurr'] == null
            ? 0.0
            : asT<double>("depositAmountCurr", jsonRes['depositAmountCurr'])!,
        depositAmountLave: jsonRes['depositAmountLave'] == null
            ? 0.0
            : asT<double>("depositAmountLave", jsonRes['depositAmountLave'])!,
        depositAmountTotal: jsonRes['depositAmountTotal'] == null
            ? 0
            : asT<int>("depositAmountTotal", jsonRes['depositAmountTotal'])!,
        experience: jsonRes['experience'] == null
            ? ''
            : asT<String>("experience", jsonRes['experience'])!,
        grade: jsonRes['grade'] == null
            ? ''
            : asT<String>("grade", jsonRes['grade'])!,
        validBetsCurr: jsonRes['validBetsCurr'] == null
            ? 0.0
            : asT<double>("validBetsCurr", jsonRes['validBetsCurr'])!,
        validBetsLave: jsonRes['validBetsLave'] == null
            ? 0.0
            : asT<double>("validBetsLave", jsonRes['validBetsLave'])!,
        validBetsTotal: jsonRes['validBetsTotal'] == null
            ? 0
            : asT<int>("validBetsTotal", jsonRes['validBetsTotal'])!,
        vipGradeId: jsonRes['vipGradeId'] == null
            ? ''
            : asT<String>("vipGradeId", jsonRes['vipGradeId'])!,
      );

  double bjValidBetsCurr = 0.0;
  double bjValidBetsLave = 0.0;
  int bjValidBetsTotal = 0;
  double depositAmountCurr = 0.0;
  double depositAmountLave = 0.0;
  int depositAmountTotal = 0;
  String experience = '';
  String grade = '';
  double validBetsCurr = 0.0;
  double validBetsLave = 0.0;
  int validBetsTotal = 0;
  String vipGradeId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bjValidBetsCurr': bjValidBetsCurr,
        'bjValidBetsLave': bjValidBetsLave,
        'bjValidBetsTotal': bjValidBetsTotal,
        'depositAmountCurr': depositAmountCurr,
        'depositAmountLave': depositAmountLave,
        'depositAmountTotal': depositAmountTotal,
        'experience': experience,
        'grade': grade,
        'validBetsCurr': validBetsCurr,
        'validBetsLave': validBetsLave,
        'validBetsTotal': validBetsTotal,
        'vipGradeId': vipGradeId,
      };
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VipInfoResp {
  VipInfoResp({
    required this.bjValidBetsCurr,
    required this.bjValidBetsLave,
    required this.bjValidBetsTotal,
    required this.depositAmountCurr,
    required this.depositAmountLave,
    required this.depositAmountTotal,
    this.experience = "",
    this.grade = "",
    this.nextVipGradeName = "",
    required this.validBetsCurr,
    required this.validBetsLave,
    required this.validBetsTotal,
    this.vipGradeId = "",
    required this.vipSerialNum,
  });

  final num bjValidBetsCurr;
  final num bjValidBetsLave;
  final num bjValidBetsTotal;
  final num depositAmountCurr;
  final num depositAmountLave;
  final num depositAmountTotal;
  final String experience;
  final String grade;
  final String nextVipGradeName;
  final num validBetsCurr;
  final num validBetsLave;
  final num validBetsTotal;
  final String vipGradeId;
  final int vipSerialNum;
}

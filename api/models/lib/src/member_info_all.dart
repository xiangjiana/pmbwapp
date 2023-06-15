import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/src/member_info.dart';

@jsonSerializable
class MemberInfoAll {
  MemberInfoAll({
    required this.memberInfoVO,
    required this.profitAndLossRespDto,
    required this.vipInfoVO,
    required this.agentCustomerUrl,
    required this.memberCustomerUrl,
  });

  MemberInfo memberInfoVO;
  ProfitAndLossRespDto profitAndLossRespDto;
  VipInfoVo vipInfoVO;
  String agentCustomerUrl;
  String memberCustomerUrl;
}

@jsonSerializable
class VipInfoVo {
  VipInfoVo({
    required this.bjValidBetsCurr,
    required this.bjValidBetsLave,
    required this.bjValidBetsTotal,
    required this.depositAmountCurr,
    required this.depositAmountLave,
    required this.depositAmountTotal,
    required this.experience,
    required this.grade,
    required this.nextVipGradeName,
    required this.validBetsCurr,
    required this.validBetsLave,
    required this.validBetsTotal,
    required this.vipGradeId,
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
  final num vipSerialNum;
}

@jsonSerializable
class ProfitAndLossRespDto {
  ProfitAndLossRespDto({
    required this.todayProfit,
  });

  final num todayProfit;
}

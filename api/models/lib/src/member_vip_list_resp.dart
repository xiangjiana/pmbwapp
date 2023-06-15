import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberVipListResp {
  MemberVipListResp({
    listGrade,
    listIn,
    listPromotion,
    listRebate,
    required this.vipPromotionState,
    required this.updatedAt,
  }) {
    this.listGrade = listGrade.cast<Grade>();
    this.listIn = listIn.cast<In>();
    this.listPromotion = listPromotion.cast<Promotion>();
    this.listRebate = listRebate.cast<Rebate>();
  }

  late final List<Grade> listGrade;
  late final List<In> listIn;
  late final List<Promotion> listPromotion;
  late final List<Rebate> listRebate;
  final int vipPromotionState;
  final String updatedAt;
}

@jsonSerializable
class Rebate {
  Rebate({
    required this.accessInfo,
    required this.configVipRebate,
    required this.createdAt,
    required this.createdBy,
    required this.defaultType,
    required this.gameId,
    required this.gameName,
    required this.id,
    required this.merchantId,
    required this.sign,
    required this.updatedAt,
    required this.updatedBy,
    required this.venueCode,
    required this.venueId,
    required this.venueName,
  });

  final String accessInfo;
  final String configVipRebate;
  final String createdAt;
  final String createdBy;
  final int defaultType;
  final num gameId;
  final String gameName;
  final num id;
  final num merchantId;
  final String sign;
  final String updatedAt;
  final String updatedBy;
  final String venueCode;
  final num venueId;
  final String venueName;
}

@jsonSerializable
class Promotion {
  Promotion({
    required this.bonusRatio,
    this.gameName = "",
    required this.highestBonus,
    required this.id,
    required this.lowestTransferQuota,
    required this.merchantId,
    required this.participateNum,
    this.participateVenue = "",
    required this.state,
    this.vipGradeName = "",
    this.vipSerialNum = "",
    required this.waterMultiple,
  });

  final num bonusRatio;
  final String gameName;
  final num highestBonus;
  final num id;
  final num lowestTransferQuota;
  final num merchantId;
  final int participateNum;
  final String participateVenue;
  final int state;
  String vipGradeName;
  final String vipSerialNum;
  final int waterMultiple;
}

@jsonSerializable
class In {
  In({
    required this.aboveMonthRedEnvelope,
    required this.belowMonthRedEnvelope,
    required this.birthdayBonus,
    required this.dailyRebateCap,
    required this.dayWithdrawalNum,
    required this.dayWithdrawalQuota,
    required this.depositLimit,
    required this.id,
    required this.upgradeBonus,
    this.vipGradeName = "",
    this.vipSerialNum = "",
  });

  final num aboveMonthRedEnvelope;
  final num belowMonthRedEnvelope;
  final num birthdayBonus;
  final double dailyRebateCap;
  final int dayWithdrawalNum;
  final num dayWithdrawalQuota;
  num depositLimit;
  final num id;
  final num upgradeBonus;
  String vipGradeName;
  final String vipSerialNum;
}

@jsonSerializable
class Grade {
  Grade({
    required this.id,
    required this.merchantId,
    required this.relegationValidPeriod,
    required this.relegationWater,
    required this.tatalValidWater,
    required this.totalDeposit,
    this.vipGradeName = "",
    this.vipSerialNum = "",
  });

  final num id;
  final num merchantId;
  final int relegationValidPeriod;
  final num relegationWater;
  final num tatalValidWater;
  final num totalDeposit;
  String vipGradeName;
  final String vipSerialNum;
}

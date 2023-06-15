import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSelectVipInfoPostRespModel {
  UserApiSelectVipInfoPostRespModel({
    required this.listGrade,
    required this.listIn,
    required this.listPromotion,
    required this.listRebate,
    required this.vipPromotionState,
    required this.updatedAt,
  });

  factory UserApiSelectVipInfoPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ListGrade>? listGrade =
        jsonRes['listGrade'] is List ? <ListGrade>[] : null;
    if (listGrade != null) {
      for (final dynamic item in jsonRes['listGrade']!) {
        if (item != null) {
          listGrade.add(ListGrade.fromJson(
              asT<Map<String, dynamic>>("listGrade", item)!));
        }
      }
    }

    final List<ListIn>? listIn = jsonRes['listIn'] is List ? <ListIn>[] : null;
    if (listIn != null) {
      for (final dynamic item in jsonRes['listIn']!) {
        if (item != null) {
          listIn
              .add(ListIn.fromJson(asT<Map<String, dynamic>>("listIn", item)!));
        }
      }
    }

    final List<ListPromotion>? listPromotion =
        jsonRes['listPromotion'] is List ? <ListPromotion>[] : null;
    if (listPromotion != null) {
      for (final dynamic item in jsonRes['listPromotion']!) {
        if (item != null) {
          listPromotion.add(ListPromotion.fromJson(
              asT<Map<String, dynamic>>("listPromotion", item)!));
        }
      }
    }

    final List<ListRebate>? listRebate =
        jsonRes['listRebate'] is List ? <ListRebate>[] : null;
    if (listRebate != null) {
      for (final dynamic item in jsonRes['listRebate']!) {
        if (item != null) {
          listRebate.add(ListRebate.fromJson(
              asT<Map<String, dynamic>>("listRebate", item)!));
        }
      }
    }
    final int? vipPromotionState =
        jsonRes['vipPromotionState'] is int ? jsonRes['vipPromotionState'] : null;
    final String? updatedAt =
    jsonRes['updatedAt'] is String ? jsonRes['updatedAt'] : null;
    return UserApiSelectVipInfoPostRespModel(
      listGrade: listGrade == null ? [] : listGrade,
      listIn: listIn == null ? [] : listIn,
      listPromotion: listPromotion == null ? [] : listPromotion,
      listRebate: listRebate == null ? [] : listRebate,
      vipPromotionState: vipPromotionState == null ? 1 : vipPromotionState,
      updatedAt: updatedAt == null ? '' : updatedAt,
    );
  }

  List<ListGrade> listGrade;
  List<ListIn> listIn;
  List<ListPromotion> listPromotion;
  List<ListRebate> listRebate;
  int vipPromotionState;
  String updatedAt;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'listGrade': listGrade,
        'listIn': listIn,
        'listPromotion': listPromotion,
        'listRebate': listRebate,
        'vipPromotionState': vipPromotionState,
        'updatedAt': updatedAt,
      };
}

class ListGrade {
  ListGrade({
    required this.id,
    required this.merchantId,
    required this.relegationValidPeriod,
    required this.relegationWater,
    required this.tatalValidWater,
    required this.totalDeposit,
    required this.vipGradeName,
    required this.vipSerialNum,
  });

  factory ListGrade.fromJson(Map<String, dynamic> jsonRes) => ListGrade(
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        relegationValidPeriod: jsonRes['relegationValidPeriod'] == null
            ? 0
            : asT<int>(
                "relegationValidPeriod", jsonRes['relegationValidPeriod'])!,
        relegationWater: jsonRes['relegationWater'] == null
            ? 0.0
            : asT<double>("relegationWater", jsonRes['relegationWater'])!,
        tatalValidWater: jsonRes['tatalValidWater'] == null
            ? 0.0
            : asT<double>("tatalValidWater", jsonRes['tatalValidWater'])!,
        totalDeposit: jsonRes['totalDeposit'] == null
            ? 0.0
            : asT<double>("totalDeposit", jsonRes['totalDeposit'])!,
        vipGradeName: jsonRes['vipGradeName'] == null
            ? ''
            : asT<String>("vipGradeName", jsonRes['vipGradeName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? ''
            : asT<String>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );

  int id = 0;
  int merchantId = 0;
  int relegationValidPeriod = 0;
  double relegationWater = 0.0;
  double tatalValidWater = 0.0;
  double totalDeposit = 0.0;
  String vipGradeName = '';
  String vipSerialNum = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'merchantId': merchantId,
        'relegationValidPeriod': relegationValidPeriod,
        'relegationWater': relegationWater,
        'tatalValidWater': tatalValidWater,
        'totalDeposit': totalDeposit,
        'vipGradeName': vipGradeName,
        'vipSerialNum': vipSerialNum,
      };
}

class ListIn {
  ListIn({
    required this.dailyRebateCap,
    required this.depositLimit,
    required this.aboveMonthRedEnvelope,
    required this.belowMonthRedEnvelope,
    required this.birthdayBonus,
    required this.dayWithdrawalNum,
    required this.dayWithdrawalQuota,
    required this.id,
    required this.upgradeBonus,
    required this.vipGradeName,
    required this.vipSerialNum,
  });

  factory ListIn.fromJson(Map<String, dynamic> jsonRes) => ListIn(
        dailyRebateCap: jsonRes['dailyRebateCap'] == null
            ? 0.0
            : asT<double>("dailyRebateCap", jsonRes['dailyRebateCap'])!,
        depositLimit: jsonRes['depositLimit'] == null
            ? 0.0
            : asT<double>("depositLimit", jsonRes['depositLimit'])!,
        aboveMonthRedEnvelope: jsonRes['aboveMonthRedEnvelope'] == null
            ? 0.0
            : asT<double>(
                "aboveMonthRedEnvelope", jsonRes['aboveMonthRedEnvelope'])!,
        belowMonthRedEnvelope: jsonRes['belowMonthRedEnvelope'] == null
            ? 0.0
            : asT<double>(
                "belowMonthRedEnvelope", jsonRes['belowMonthRedEnvelope'])!,
        birthdayBonus: jsonRes['birthdayBonus'] == null
            ? 0.0
            : asT<double>("birthdayBonus", jsonRes['birthdayBonus'])!,
        dayWithdrawalNum: jsonRes['dayWithdrawalNum'] == null
            ? 0
            : asT<int>("dayWithdrawalNum", jsonRes['dayWithdrawalNum'])!,
        dayWithdrawalQuota: jsonRes['dayWithdrawalQuota'] == null
            ? 0.0
            : asT<double>("dayWithdrawalQuota", jsonRes['dayWithdrawalQuota'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        upgradeBonus: jsonRes['upgradeBonus'] == null
            ? 0.0
            : asT<double>("upgradeBonus", jsonRes['upgradeBonus'])!,
        vipGradeName: jsonRes['vipGradeName'] == null
            ? ''
            : asT<String>("vipGradeName", jsonRes['vipGradeName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? ''
            : asT<String>("vipSerialNum", jsonRes['vipSerialNum'])!,
      );
  double dailyRebateCap = 0.0;
  double depositLimit = 0.0;
  double aboveMonthRedEnvelope = 0.0;
  double belowMonthRedEnvelope = 0.0;
  double birthdayBonus = 0.0;
  int dayWithdrawalNum = 0;
  double dayWithdrawalQuota = 0.0;
  int id = 0;
  double upgradeBonus = 0.0;
  String vipGradeName = '';
  String vipSerialNum = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'aboveMonthRedEnvelope': aboveMonthRedEnvelope,
        'belowMonthRedEnvelope': belowMonthRedEnvelope,
        'birthdayBonus': birthdayBonus,
        'dayWithdrawalNum': dayWithdrawalNum,
        'dayWithdrawalQuota': dayWithdrawalQuota,
        'id': id,
        'upgradeBonus': upgradeBonus,
        'vipGradeName': vipGradeName,
        'vipSerialNum': vipSerialNum,
      };
}

class ListPromotion {
  ListPromotion({
    required this.bonusRatio,
    required this.gameName,
    required this.highestBonus,
    required this.id,
    required this.lowestTransferQuota,
    required this.merchantId,
    required this.participateNum,
    required this.participateVenue,
    required this.vipGradeName,
    required this.vipSerialNum,
    required this.waterMultiple,
  });

  factory ListPromotion.fromJson(Map<String, dynamic> jsonRes) => ListPromotion(
        bonusRatio: jsonRes['bonusRatio'] == null
            ? 0.0
            : asT<double>("bonusRatio", jsonRes['bonusRatio'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        highestBonus: jsonRes['highestBonus'] == null
            ? 0.0
            : asT<double>("highestBonus", jsonRes['highestBonus'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        lowestTransferQuota: jsonRes['lowestTransferQuota'] == null
            ? 0.0
            : asT<double>(
                "lowestTransferQuota", jsonRes['lowestTransferQuota'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        participateNum: jsonRes['participateNum'] == null
            ? 0
            : asT<int>("participateNum", jsonRes['participateNum'])!,
        participateVenue: jsonRes['participateVenue'] == null
            ? ''
            : asT<String>("participateVenue", jsonRes['participateVenue'])!,
        vipGradeName: jsonRes['vipGradeName'] == null
            ? ''
            : asT<String>("vipGradeName", jsonRes['vipGradeName'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? ''
            : asT<String>("vipSerialNum", jsonRes['vipSerialNum'])!,
        waterMultiple: jsonRes['waterMultiple'] == null
            ? 0
            : asT<int>("waterMultiple", jsonRes['waterMultiple'])!,
      );

  double bonusRatio = 0.0;
  String gameName = '';
  double highestBonus = 0.0;
  int id = 0;
  double lowestTransferQuota = 0.0;
  int merchantId = 0;
  int participateNum = 0;
  String participateVenue = '';
  String vipGradeName = '';
  String vipSerialNum = '';
  int waterMultiple = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bonusRatio': bonusRatio,
        'gameName': gameName,
        'highestBonus': highestBonus,
        'id': id,
        'lowestTransferQuota': lowestTransferQuota,
        'merchantId': merchantId,
        'participateNum': participateNum,
        'participateVenue': participateVenue,
        'vipGradeName': vipGradeName,
        'vipSerialNum': vipSerialNum,
        'waterMultiple': waterMultiple,
      };
}

class ListRebate {
  ListRebate({
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
    required this.venueId,
    required this.venueName,
  });

  factory ListRebate.fromJson(Map<String, dynamic> jsonRes) => ListRebate(
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
        configVipRebate: jsonRes['configVipRebate'] == null
            ? ''
            : asT<String>("configVipRebate", jsonRes['configVipRebate'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        defaultType: jsonRes['defaultType'] == null
            ? 0
            : asT<int>("defaultType", jsonRes['defaultType'])!,
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        sign: jsonRes['sign'] == null
            ? ''
            : asT<String>("sign", jsonRes['sign'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        venueId: jsonRes['venueId'] == null
            ? 0
            : asT<int>("venueId", jsonRes['venueId'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
      );

  String accessInfo = '';
  String configVipRebate = '';
  String createdAt = '';
  String createdBy = '';
  int defaultType = 0;
  int gameId = 0;
  String gameName = '';
  int id = 0;
  int merchantId = 0;
  String sign = '';
  String updatedAt = '';
  String updatedBy = '';
  int venueId = 0;
  String venueName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accessInfo': accessInfo,
        'configVipRebate': configVipRebate,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'defaultType': defaultType,
        'gameId': gameId,
        'gameName': gameName,
        'id': id,
        'merchantId': merchantId,
        'sign': sign,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
        'venueId': venueId,
        'venueName': venueName,
      };
}

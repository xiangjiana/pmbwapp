import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameRecordQueryGamePostRespModel {
  GameRecordQueryGamePostRespModel({
    required this.betAmountTotal,
    required this.validBetAmountTotal,
    required this.countTotal,
    required this.gameTypeNames,
    required this.metas,
    required this.netAmountTotal,
  });

  factory GameRecordQueryGamePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? gameTypeNames =
        jsonRes['gameTypeNames'] is List ? <String>[] : null;
    if (gameTypeNames != null) {
      for (final dynamic item in jsonRes['gameTypeNames']!) {
        if (item != null) {
          gameTypeNames.add(asT<String>("gameTypeNames", item)!);
        }
      }
    }

    final List<GameRecordQueryGamePostRespModelMetas>? metas =
        jsonRes['metas'] is List
            ? <GameRecordQueryGamePostRespModelMetas>[]
            : null;
    if (metas != null) {
      for (final dynamic item in jsonRes['metas']!) {
        if (item != null) {
          metas.add(GameRecordQueryGamePostRespModelMetas.fromJson(
              asT<Map<String, dynamic>>("metas", item)!));
        }
      }
    }
    return GameRecordQueryGamePostRespModel(
      betAmountTotal: jsonRes['betAmountTotal'] == null
          ? 0.0
          : asT<double>("betAmountTotal", jsonRes['betAmountTotal'])!,
      validBetAmountTotal: jsonRes['validBetAmountTotal'] == null
          ? 0.0
          : asT<double>("validBetAmountTotal", jsonRes['validBetAmountTotal'])!,
      countTotal: jsonRes['countTotal'] == null
          ? 0
          : asT<int>("countTotal", jsonRes['countTotal'])!,
      gameTypeNames: gameTypeNames == null ? [] : gameTypeNames,
      metas: metas == null ? [] : metas,
      netAmountTotal: jsonRes['netAmountTotal'] == null
          ? 0.0
          : asT<double>("netAmountTotal", jsonRes['netAmountTotal'])!,
    );
  }

  double betAmountTotal = 0.0;
  double validBetAmountTotal = 0.0;
  int countTotal = 0;
  List<String> gameTypeNames;
  List<GameRecordQueryGamePostRespModelMetas> metas;
  double netAmountTotal = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmountTotal': betAmountTotal,
        'validBetAmountTotal': validBetAmountTotal,
        'countTotal': countTotal,
        'gameTypeNames': gameTypeNames,
        'metas': metas,
        'netAmountTotal': netAmountTotal,
      };
}

class GameRecordQueryGamePostRespModelMetas {
  GameRecordQueryGamePostRespModelMetas({
    required this.date,
    required this.gameRecords,
  });

  factory GameRecordQueryGamePostRespModelMetas.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameRecordQueryGamePostRespModelGameRecords>? gameRecords =
        jsonRes['gameRecords'] is List
            ? <GameRecordQueryGamePostRespModelGameRecords>[]
            : null;
    if (gameRecords != null) {
      for (final dynamic item in jsonRes['gameRecords']!) {
        if (item != null) {
          gameRecords.add(GameRecordQueryGamePostRespModelGameRecords.fromJson(
              asT<Map<String, dynamic>>("gameRecords", item)!));
        }
      }
    }
    return GameRecordQueryGamePostRespModelMetas(
      date:
          jsonRes['date'] == null ? '' : asT<String>("date", jsonRes['date'])!,
      gameRecords: gameRecords == null ? [] : gameRecords,
    );
  }

  String date = '';
  List<GameRecordQueryGamePostRespModelGameRecords> gameRecords;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'date': date,
        'gameRecords': gameRecords,
      };
}

class GameRecordQueryGamePostRespModelGameRecords {
  GameRecordQueryGamePostRespModelGameRecords({
    required this.betAmount,
    required this.validBetAmount,
    required this.createAt,
    required this.details,
    required this.gameTypeName,
    required this.netAmount,
    required this.obBetStatus,
    required this.optionName,
    required this.orderNo,
    required this.betContent,
    required this.id,
    required this.generatedId,
    required this.createAtString,
  });

  factory GameRecordQueryGamePostRespModelGameRecords.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameRecordQueryGamePostRespModelDetails>? details =
        jsonRes['details'] is List
            ? <GameRecordQueryGamePostRespModelDetails>[]
            : null;
    if (details != null) {
      for (final dynamic item in jsonRes['details']!) {
        if (item != null) {
          details.add(GameRecordQueryGamePostRespModelDetails.fromJson(
              asT<Map<String, dynamic>>("details", item)!));
        }
      }
    }
    return GameRecordQueryGamePostRespModelGameRecords(
      betAmount: jsonRes['betAmount'] == null
          ? 0.0
          : asT<double>("betAmount", jsonRes['betAmount'])!,
      validBetAmount: jsonRes['validBetAmount'] == null
          ? 0.0
          : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
      createAt: jsonRes['createAt'] == null
          ? ''
          : asT<String>("createAt", jsonRes['createAt'])!,
      details: details == null ? [] : details,
      gameTypeName: jsonRes['gameTypeName'] == null
          ? ''
          : asT<String>("gameTypeName", jsonRes['gameTypeName'])!,
      netAmount: jsonRes['netAmount'] == null
          ? 0.0
          : asT<double>("netAmount", jsonRes['netAmount'])!,
      obBetStatus: jsonRes['obBetStatus'] == null
          ? ''
          : asT<String>("obBetStatus", jsonRes['obBetStatus'])!,
      optionName: jsonRes['optionName'] == null
          ? ''
          : asT<String>("optionName", jsonRes['optionName'])!,
      orderNo: jsonRes['orderNo'] == null
          ? ''
          : asT<String>("orderNo", jsonRes['orderNo'])!,
      betContent: jsonRes['betContent'] == null
          ? ''
          : asT<String>("betContent", jsonRes['betContent'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      generatedId: jsonRes['generatedId'] == null
          ? ''
          : asT<String>("generatedId", jsonRes['generatedId'])!,
      createAtString: jsonRes['createAtString'] == null
          ? ''
          : asT<String>("createAtString", jsonRes['createAtString'])!,
    );
  }

  double betAmount = 0.0;
  double validBetAmount = 0.0;
  String createAt = '';
  List<GameRecordQueryGamePostRespModelDetails> details;
  String gameTypeName = '';
  double netAmount = 0.0;
  String obBetStatus = '';
  String optionName = '';
  String orderNo = '';
  String betContent = '';
  String id = '';
  String generatedId = '';
  String createAtString = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'validBetAmount': validBetAmount,
        'createAt': createAt,
        'details': details,
        'gameTypeName': gameTypeName,
        'netAmount': netAmount,
        'obBetStatus': obBetStatus,
        'optionName': optionName,
        'orderNo': orderNo,
        'betContent': betContent,
        'id': id,
        'generatedId': generatedId,
        'createAtString': createAtString,
      };
}

class GameRecordQueryGamePostRespModelDetails {
  GameRecordQueryGamePostRespModelDetails({
    required this.matchInfo,
    required this.matchName,
    required this.matchResult,
    required this.playName,
    required this.playOptionName,
    required this.sportName,
  });

  factory GameRecordQueryGamePostRespModelDetails.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameRecordQueryGamePostRespModelDetails(
        matchInfo: jsonRes['matchInfo'] == null
            ? ''
            : asT<String>("matchInfo", jsonRes['matchInfo'])!,
        matchName: jsonRes['matchName'] == null
            ? ''
            : asT<String>("matchName", jsonRes['matchName'])!,
        matchResult: jsonRes['matchResult'] == null
            ? ''
            : asT<String>("matchResult", jsonRes['matchResult'])!,
        playName: jsonRes['playName'] == null
            ? ''
            : asT<String>("playName", jsonRes['playName'])!,
        playOptionName: jsonRes['playOptionName'] == null
            ? ''
            : asT<String>("playOptionName", jsonRes['playOptionName'])!,
        sportName: jsonRes['sportName'] == null
            ? ''
            : asT<String>("sportName", jsonRes['sportName'])!,
      );

  String matchInfo = '';
  String matchName = '';
  String matchResult = '';
  String playName = '';
  String playOptionName = '';
  String sportName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'matchInfo': matchInfo,
        'matchName': matchName,
        'matchResult': matchResult,
        'playName': playName,
        'playOptionName': playOptionName,
        'sportName': sportName,
      };
}

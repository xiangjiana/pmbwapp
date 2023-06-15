import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryRecommendByGameIdPostRespModel {
  GameQueryRecommendByGameIdPostRespModel({
    required this.data,
  });

  factory GameQueryRecommendByGameIdPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameQueryRecommendByGameIdPostRespModelData>? data = jsonRes['data'] is List ? <GameQueryRecommendByGameIdPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameQueryRecommendByGameIdPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryRecommendByGameIdPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameQueryRecommendByGameIdPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameQueryRecommendByGameIdPostRespModelData {
  GameQueryRecommendByGameIdPostRespModelData({
    required this.bo,
    required this.cnName,
    required this.count,
    required this.enName,
    required this.gameIcon,
    required this.gameId,
    required this.gameName,
    required this.id,
    required this.isPassOff,
    required this.liveSupport,
    required this.matchCnTeam,
    required this.matchEnTeam,
    required this.matchId,
    required this.matchTeam,
    required this.odds,
    required this.round,
    required this.score,
    required this.sortCode,
    required this.status,
    required this.suspended,
    required this.teamIcon,
    required this.teamId,
    required this.timeTicket,
    required this.tournamentCnName,
    required this.tournamentShortName,
    required this.userVideoUrl,
    required this.isLive,
    required this.visible,
  });

  factory GameQueryRecommendByGameIdPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameQueryRecommendByGameIdPostRespModelOdds>? odds = jsonRes['odds'] is List ? <GameQueryRecommendByGameIdPostRespModelOdds>[] : null;
    if (odds != null) {
      for (final dynamic item in jsonRes['odds']!) {
        if (item != null) {
          odds.add(GameQueryRecommendByGameIdPostRespModelOdds.fromJson(asT<Map<String, dynamic>>("odds", item)!));
        }
      }
    }
    return GameQueryRecommendByGameIdPostRespModelData(
      bo: jsonRes['bo'] == null ? 0 : asT<int>("bo", jsonRes['bo'])!,
      cnName: jsonRes['cn_name'] == null
          ? ''
          : asT<String>("cn_name", jsonRes['cn_name'])!,
      count:
          jsonRes['count'] == null ? 0 : asT<int>("count", jsonRes['count'])!,
      enName: jsonRes['en_name'] == null
          ? ''
          : asT<String>("en_name", jsonRes['en_name'])!,
      gameIcon: jsonRes['game_icon'] == null
          ? ''
          : asT<String>("game_icon", jsonRes['game_icon'])!,
      gameId: jsonRes['game_id'] == null
          ? ''
          : asT<String>("game_id", jsonRes['game_id'])!,
      gameName: jsonRes['game_name'] == null
          ? ''
          : asT<String>("game_name", jsonRes['game_name'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      isPassOff: jsonRes['is_pass_off'] == null
          ? 0
          : asT<int>("is_pass_off", jsonRes['is_pass_off'])!,
      liveSupport: jsonRes['live_support'] == null
          ? 0
          : asT<int>("live_support", jsonRes['live_support'])!,
      matchCnTeam: jsonRes['match_cn_team'] == null
          ? ''
          : asT<String>("match_cn_team", jsonRes['match_cn_team'])!,
      matchEnTeam: jsonRes['match_en_team'] == null
          ? ''
          : asT<String>("match_en_team", jsonRes['match_en_team'])!,
      matchId: jsonRes['match_id'] == null
          ? ''
          : asT<String>("match_id", jsonRes['match_id'])!,
      matchTeam: jsonRes['match_team'] == null
          ? ''
          : asT<String>("match_team", jsonRes['match_team'])!,
      odds: odds == null ? [] : odds,
      round:
          jsonRes['round'] == null ? 0 : asT<int>("round", jsonRes['round'])!,
      score: jsonRes['score'] == null
          ? ''
          : asT<String>("score", jsonRes['score'])!,
      sortCode: jsonRes['sort_code'] == null
          ? 0
          : asT<int>("sort_code", jsonRes['sort_code'])!,
      status: jsonRes['status'] == null
          ? 0
          : asT<int>("status", jsonRes['status'])!,
      suspended: jsonRes['suspended'] == null
          ? 0
          : asT<int>("suspended", jsonRes['suspended'])!,
      teamIcon: jsonRes['team_icon'] == null
          ? ''
          : asT<String>("team_icon", jsonRes['team_icon'])!,
      teamId: jsonRes['team_id'] == null
          ? ''
          : asT<String>("team_id", jsonRes['team_id'])!,
      timeTicket: jsonRes['time_ticket'] == null
          ? 0
          : asT<int>("time_ticket", jsonRes['time_ticket'])!,
      tournamentCnName: jsonRes['tournament_cn_name'] == null
          ? ''
          : asT<String>("tournament_cn_name", jsonRes['tournament_cn_name'])!,
      tournamentShortName: jsonRes['tournament_short_name'] == null
          ? ''
          : asT<String>(
              "tournament_short_name", jsonRes['tournament_short_name'])!,
      userVideoUrl: jsonRes['user_video_url'] == null
          ? ''
          : asT<String>("user_video_url", jsonRes['user_video_url'])!,
      isLive: jsonRes['is_live'] == null
          ? 0
          : asT<int>("is_live", jsonRes['is_live'])!,
      visible: jsonRes['visible'] == null
          ? 0
          : asT<int>("visible", jsonRes['visible'])!,
    );
  }

  int bo = 0;
  String cnName = '';
  int count = 0;
  String enName = '';
  String gameIcon = '';
  String gameId = '';
  String gameName = '';
  String id = '';
  int isPassOff = 0;
  int liveSupport = 0;
  String matchCnTeam = '';
  String matchEnTeam = '';
  String matchId = '';
  String matchTeam = '';
  List<GameQueryRecommendByGameIdPostRespModelOdds> odds;
  int round = 0;
  String score = '';
  int sortCode = 0;
  int status = 0;
  int suspended = 0;
  String teamIcon = '';
  String teamId = '';
  int timeTicket = 0;
  String tournamentCnName = '';
  String tournamentShortName = '';
  String userVideoUrl = '';
  int isLive = 0;
  int visible = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bo': bo,
        'cn_name': cnName,
        'count': count,
        'en_name': enName,
        'game_icon': gameIcon,
        'game_id': gameId,
        'game_name': gameName,
        'id': id,
        'is_pass_off': isPassOff,
        'live_support': liveSupport,
        'match_cn_team': matchCnTeam,
        'match_en_team': matchEnTeam,
        'match_id': matchId,
        'match_team': matchTeam,
        'odds': odds,
        'round': round,
        'score': score,
        'sort_code': sortCode,
        'status': status,
        'suspended': suspended,
        'team_icon': teamIcon,
        'team_id': teamId,
        'time_ticket': timeTicket,
        'tournament_cn_name': tournamentCnName,
        'tournament_short_name': tournamentShortName,
        'user_video_url': userVideoUrl,
        'is_live': isLive,
        'visible': visible,
      };
}

class GameQueryRecommendByGameIdPostRespModelOdds {
  GameQueryRecommendByGameIdPostRespModelOdds({
    required this.enName,
    required this.id,
    required this.isWinner,
    required this.marketId,
    required this.name,
    required this.odd,
    required this.sortId,
    required this.suspended,
    required this.visible,
  });

  factory GameQueryRecommendByGameIdPostRespModelOdds.fromJson(Map<String, dynamic> jsonRes) => GameQueryRecommendByGameIdPostRespModelOdds(
        enName: jsonRes['en_name'] == null
            ? ''
            : asT<String>("en_name", jsonRes['en_name'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isWinner: jsonRes['is_winner'] == null
            ? ''
            : asT<String>("is_winner", jsonRes['is_winner'])!,
        marketId: jsonRes['market_id'] == null
            ? ''
            : asT<String>("market_id", jsonRes['market_id'])!,
        name: jsonRes['name'] == null
            ? ''
            : asT<String>("name", jsonRes['name'])!,
        odd: jsonRes['odd'] == null ? '' : asT<String>("odd", jsonRes['odd'])!,
        sortId: jsonRes['sort_id'] == null
            ? ''
            : asT<String>("sort_id", jsonRes['sort_id'])!,
        suspended: jsonRes['suspended'] == null
            ? ''
            : asT<String>("suspended", jsonRes['suspended'])!,
        visible: jsonRes['visible'] == null
            ? ''
            : asT<String>("visible", jsonRes['visible'])!,
      );

  String enName = '';
  String id = '';
  String isWinner = '';
  String marketId = '';
  String name = '';
  String odd = '';
  String sortId = '';
  String suspended = '';
  String visible = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'en_name': enName,
        'id': id,
        'is_winner': isWinner,
        'market_id': marketId,
        'name': name,
        'odd': odd,
        'sort_id': sortId,
        'suspended': suspended,
        'visible': visible,
      };
}

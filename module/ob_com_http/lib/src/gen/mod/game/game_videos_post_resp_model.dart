import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameVideosPostRespModel {
  GameVideosPostRespModel({
    required this.data,
  });

  factory GameVideosPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<GameVideosPostRespModelData>? data = jsonRes['data'] is List ? <GameVideosPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameVideosPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameVideosPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameVideosPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameVideosPostRespModelData {
  GameVideosPostRespModelData({
    required this.anchorId,
    required this.gameCode,
    required this.liveIcon,
    required this.liveInfo,
    required this.liveName,
    required this.liveUrl,
    required this.mid,
    required this.referUrl,
    required this.tableId,
  });

  factory GameVideosPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? liveUrl =
        jsonRes['liveUrl'] is List ? <String>[] : null;
    if (liveUrl != null) {
      for (final dynamic item in jsonRes['liveUrl']!) {
        if (item != null) {
          liveUrl.add(asT<String>("liveUrl", item)!);
        }
      }
    }
    return GameVideosPostRespModelData(
      anchorId: jsonRes['anchorId'] == null
          ? 0
          : asT<int>("anchorId", jsonRes['anchorId'])!,
      gameCode: jsonRes['gameCode'] == null
          ? ''
          : asT<String>("gameCode", jsonRes['gameCode'])!,
      liveIcon: jsonRes['liveIcon'] == null
          ? ''
          : asT<String>("liveIcon", jsonRes['liveIcon'])!,
      liveInfo: jsonRes['liveInfo'] == null
          ? ''
          : asT<String>("liveInfo", jsonRes['liveInfo'])!,
      liveName: jsonRes['liveName'] == null
          ? ''
          : asT<String>("liveName", jsonRes['liveName'])!,
      liveUrl: liveUrl == null ? [] : liveUrl,
      mid: jsonRes['mid'] == null ? '' : asT<String>("mid", jsonRes['mid'])!,
      referUrl: jsonRes['referUrl'] == null
          ? ''
          : asT<String>("referUrl", jsonRes['referUrl'])!,
      tableId: jsonRes['tableId'] == null
          ? 0
          : asT<int>("tableId", jsonRes['tableId'])!,
    );
  }

  int anchorId = 0;
  String gameCode = '';
  String liveIcon = '';
  String liveInfo = '';
  String liveName = '';
  List<String> liveUrl;
  String mid = '';
  String referUrl = '';
  int tableId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'anchorId': anchorId,
        'gameCode': gameCode,
        'liveIcon': liveIcon,
        'liveInfo': liveInfo,
        'liveName': liveName,
        'liveUrl': liveUrl,
        'mid': mid,
        'referUrl': referUrl,
        'tableId': tableId,
      };
}

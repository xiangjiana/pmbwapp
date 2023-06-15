import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameModuleGetGameModulePostRespModel {
  GameModuleGetGameModulePostRespModel({
    required this.data,
  });

  factory GameModuleGetGameModulePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<GameModuleGetGameModulePostRespModelData>? data = jsonRes['data'] is List ? <GameModuleGetGameModulePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(GameModuleGetGameModulePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameModuleGetGameModulePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<GameModuleGetGameModulePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class GameModuleGetGameModulePostRespModelData {
  GameModuleGetGameModulePostRespModelData({
    required this.allGameNum,
    required this.assortId,
    required this.commonId,
    required this.description,
    required this.displayOrder,
    required this.mainTitleInfo,
    required this.moduleCaption,
    required this.moduleDesc,
    required this.moduleId,
    required this.scrollingNum,
    required this.sort,
    required this.subTitleInfo,
  });

  factory GameModuleGetGameModulePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => GameModuleGetGameModulePostRespModelData(
        allGameNum: jsonRes['allGameNum'] == null
            ? 0
            : asT<int>("allGameNum", jsonRes['allGameNum'])!,
        assortId: jsonRes['assortId'] == null
            ? 0
            : asT<int>("assortId", jsonRes['assortId'])!,
        commonId: jsonRes['commonId'] == null
            ? 0
            : asT<int>("commonId", jsonRes['commonId'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        displayOrder: jsonRes['displayOrder'] == null
            ? 0
            : asT<int>("displayOrder", jsonRes['displayOrder'])!,
        mainTitleInfo: jsonRes['mainTitleInfo'] == null
            ? ''
            : asT<String>("mainTitleInfo", jsonRes['mainTitleInfo'])!,
        moduleCaption: jsonRes['moduleCaption'] == null
            ? ''
            : asT<String>("moduleCaption", jsonRes['moduleCaption'])!,
        moduleDesc: jsonRes['moduleDesc'] == null
            ? ''
            : asT<String>("moduleDesc", jsonRes['moduleDesc'])!,
        moduleId: jsonRes['moduleId'] == null
            ? 0
            : asT<int>("moduleId", jsonRes['moduleId'])!,
        scrollingNum: jsonRes['scrollingNum'] == null
            ? 0
            : asT<int>("scrollingNum", jsonRes['scrollingNum'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        subTitleInfo: jsonRes['subTitleInfo'] == null
            ? ''
            : asT<String>("subTitleInfo", jsonRes['subTitleInfo'])!,
      );

  int allGameNum = 0;
  int assortId = 0;
  int commonId = 0;
  String description = '';
  int displayOrder = 0;
  String mainTitleInfo = '';
  String moduleCaption = '';
  String moduleDesc = '';
  int moduleId = 0;
  int scrollingNum = 0;
  int sort = 0;
  String subTitleInfo = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'allGameNum': allGameNum,
        'assortId': assortId,
        'commonId': commonId,
        'description': description,
        'displayOrder': displayOrder,
        'mainTitleInfo': mainTitleInfo,
        'moduleCaption': moduleCaption,
        'moduleDesc': moduleDesc,
        'moduleId': moduleId,
        'scrollingNum': scrollingNum,
        'sort': sort,
        'subTitleInfo': subTitleInfo,
      };
}

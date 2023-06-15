import 'dart:convert';

import '../../../../ob_com_http.dart';


// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryMerchantDyNewPostRespModel {
  GameQueryMerchantDyNewPostRespModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory GameQueryMerchantDyNewPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<Data>? data = jsonRes['data'] is List ? <Data>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(Data.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryMerchantDyNewPostRespModel(
      code: jsonRes['code'] == null ? 0 : asT<int>("code", jsonRes['code'])!,
      msg: jsonRes['msg'] == null ? '' : asT<String>("msg", jsonRes['msg'])!,
      data: data == null ? [] : data,
    );
  }

  int code = 0;
  String msg = '';
  List<Data> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'msg': msg,
        'data': data,
      };
}

class Data {
  Data({
    required this.gameId,
    required this.venueCode,
    required this.gameName,
    required this.accessInfo,
    required this.iconStatus,
    required this.supportTerminals,
    required this.iconUrl,
    required this.description,
    required this.remark,
    required this.status,
    required this.createdBy,
    required this.createdAt,
    required this.updatedBy,
    required this.updatedAt,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) => Data(
        gameId: jsonRes['gameId'] == null
            ? 0
            : asT<int>("gameId", jsonRes['gameId'])!,
        venueCode: jsonRes['venueCode'] == null
            ? ''
            : asT<String>("venueCode", jsonRes['venueCode'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        accessInfo: jsonRes['accessInfo'] == null
            ? ''
            : asT<String>("accessInfo", jsonRes['accessInfo'])!,
        iconStatus: jsonRes['iconStatus'] == null
            ? 0
            : asT<int>("iconStatus", jsonRes['iconStatus'])!,
        supportTerminals: jsonRes['supportTerminals'] == null
            ? ''
            : asT<String>("supportTerminals", jsonRes['supportTerminals'])!,
        iconUrl: jsonRes['iconUrl'] == null
            ? ''
            : asT<String>("iconUrl", jsonRes['iconUrl'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
      );

  int gameId = 0;
  String venueCode = '';
  String gameName = '';
  String accessInfo = '';
  int iconStatus = 0;
  String supportTerminals = '';
  String iconUrl = '';
  String description = '';
  String remark = '';
  int status = 0;
  String createdBy = '';
  String createdAt = '';
  String updatedBy = '';
  String updatedAt = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gameId': gameId,
        'venueCode': venueCode,
        'gameName': gameName,
        'accessInfo': accessInfo,
        'iconStatus': iconStatus,
        'supportTerminals': supportTerminals,
        'iconUrl': iconUrl,
        'description': description,
        'remark': remark,
        'status': status,
        'createdBy': createdBy,
        'createdAt': createdAt,
        'updatedBy': updatedBy,
        'updatedAt': updatedAt,
      };
}

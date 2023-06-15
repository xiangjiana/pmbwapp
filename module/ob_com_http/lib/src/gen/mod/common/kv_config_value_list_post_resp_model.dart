import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class KvConfigValueListPostRespModel {
  KvConfigValueListPostRespModel({
    required this.data,
  });

  factory KvConfigValueListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<KvConfigValuePostRespModel>? data =
        jsonRes['data'] is List
            ? <KvConfigValuePostRespModel>[]
            : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(KvConfigValuePostRespModel.fromJson(
              asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return KvConfigValueListPostRespModel(
      data: data ?? [],
    );
  }

  List<KvConfigValuePostRespModel> data = <KvConfigValuePostRespModel>[];

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class KvConfigValuePostRespModel {
  KvConfigValuePostRespModel({
    required this.appId,
    required this.description,
    required this.id,
    required this.k,
    required this.module,
    required this.tag,
    required this.v,
    required this.valueType,
  });

  factory KvConfigValuePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      KvConfigValuePostRespModel(
        appId: jsonRes['appId'] == null
            ? 0
            : asT<int>("appId", jsonRes['appId'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        id: jsonRes['id'] == null
            ? 0
            : asT<int>("id", jsonRes['id'])!,
        k: jsonRes['k'] == null ? '' : asT<String>("k", jsonRes['k'])!,
        module: jsonRes['module'] == null
            ? ''
            : asT<String>("module", jsonRes['module'])!,
        tag: jsonRes['tag'] == null
            ? ''
            : asT<String>("tag", jsonRes['tag'])!,
        v: jsonRes['v'] == null
            ? ''
            : asT<String>("v", jsonRes['v'])!,
        valueType: jsonRes['valueType'] == null
            ? ''
            : asT<String>("valueType", jsonRes['valueType'])!,
      );

  int appId = 0;
  String description = '';
  int id = 0;
  String k = '';
  String module = '';
  String tag = '';
  String v = '';
  String valueType = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'appId': appId,
    'description': description,
    'id': id,
    'k': k,
    'tag': tag,
    'v': v,
    'valueType': valueType,
  };
}

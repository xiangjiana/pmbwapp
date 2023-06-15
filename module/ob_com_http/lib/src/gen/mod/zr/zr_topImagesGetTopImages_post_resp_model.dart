import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ZrTopImagesGetTopImagesPostRespModel {
  ZrTopImagesGetTopImagesPostRespModel({
    required this.data,
  });

  factory ZrTopImagesGetTopImagesPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ZrTopImagesGetTopImagesPostRespModelData>? data = jsonRes['data'] is List ? <ZrTopImagesGetTopImagesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ZrTopImagesGetTopImagesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ZrTopImagesGetTopImagesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ZrTopImagesGetTopImagesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ZrTopImagesGetTopImagesPostRespModelData {
  ZrTopImagesGetTopImagesPostRespModelData({
    required this.id,
    required this.topImageUrl,
  });

  factory ZrTopImagesGetTopImagesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ZrTopImagesGetTopImagesPostRespModelData(
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        topImageUrl: jsonRes['topImageUrl'] == null
            ? ''
            : asT<String>("topImageUrl", jsonRes['topImageUrl'])!,
      );

  String id = '';
  String topImageUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'topImageUrl': topImageUrl,
      };
}

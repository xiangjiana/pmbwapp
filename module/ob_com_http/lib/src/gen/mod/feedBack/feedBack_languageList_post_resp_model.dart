import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class FeedBackLanguageListPostReqModel {
  FeedBackLanguageListPostReqModel({
    required this.data,
  });

  factory FeedBackLanguageListPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<FeedBackLanguageListPostReqModelData>? data =
        jsonRes['data'] is List
            ? <FeedBackLanguageListPostReqModelData>[]
            : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(FeedBackLanguageListPostReqModelData.fromJson(
              asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return FeedBackLanguageListPostReqModel(
      data: data == null ? [] : data,
    );
  }

  List<FeedBackLanguageListPostReqModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class FeedBackLanguageListPostReqModelData {
  FeedBackLanguageListPostReqModelData({
    required this.langCode,
    required this.langName,
  });

  factory FeedBackLanguageListPostReqModelData.fromJson(
          Map<String, dynamic> jsonRes) =>
      FeedBackLanguageListPostReqModelData(
        langCode: jsonRes['langCode'] == null
            ? ''
            : asT<String>("langCode", jsonRes['langCode'])!,
        langName: jsonRes['langName'] == null
            ? ''
            : asT<String>("langName", jsonRes['langName'])!,
      );

  String langCode = '';
  String langName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'langCode': langCode,
        'langName': langName,
      };
}

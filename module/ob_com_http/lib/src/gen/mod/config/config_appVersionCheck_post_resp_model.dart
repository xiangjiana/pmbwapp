import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigAppVersionCheckPostRespModel {
  ConfigAppVersionCheckPostRespModel({
    required this.data,
  });

  factory ConfigAppVersionCheckPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ConfigAppVersionCheckPostRespModel(
        data: jsonRes["data"] == null
            ? ConfigAppVersionCheckPostRespModelData.fromJson({})
            : ConfigAppVersionCheckPostRespModelData.fromJson(
                asT<Map<String, dynamic>>("data", jsonRes["data"])!),
      );

  ConfigAppVersionCheckPostRespModelData data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ConfigAppVersionCheckPostRespModelData {
  ConfigAppVersionCheckPostRespModelData({
    required this.content,
    required this.downloadUrl,
    required this.title,
    required this.updateType,
    required this.version,
  });

  factory ConfigAppVersionCheckPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ConfigAppVersionCheckPostRespModelData(
        content: jsonRes['content'] == null
            ? ''
            : asT<String>("content", jsonRes['content'])!,
        downloadUrl: jsonRes['downloadUrl'] == null
            ? ''
            : asT<String>("downloadUrl", jsonRes['downloadUrl'])!,
        title: jsonRes['title'] == null
            ? ''
            : asT<String>("title", jsonRes['title'])!,
        updateType: jsonRes['updateType'] == null
            ? 0
            : asT<int>("updateType", jsonRes['updateType'])!,
        version: jsonRes['version'] == null
            ? ''
            : asT<String>("version", jsonRes['version'])!,
      );

  String content = '';
  String downloadUrl = '';
  String title = '';
  int updateType = 0;
  String version = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'content': content,
        'downloadUrl': downloadUrl,
        'title': title,
        'updateType': updateType,
        'version': version,
      };
}

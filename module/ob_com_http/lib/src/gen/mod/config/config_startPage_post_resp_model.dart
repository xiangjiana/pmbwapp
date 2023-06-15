import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigStartPagePostRespModel {
  ConfigStartPagePostRespModel({
    required this.data,
  });

  factory ConfigStartPagePostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<ConfigStartPagePostRespModelData>? data = jsonRes['data'] is List ? <ConfigStartPagePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ConfigStartPagePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ConfigStartPagePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ConfigStartPagePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ConfigStartPagePostRespModelData {
  ConfigStartPagePostRespModelData({
    required this.clientType,
    required this.configType,
    required this.flashTime,
    required this.id,
    required this.loadStatus,
    required this.merchantId,
    required this.pageName,
    required this.pictureUrl,
    required this.remark,
    required this.status,
  });

  factory ConfigStartPagePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ConfigStartPagePostRespModelData(
        clientType: jsonRes['clientType'] == null
            ? 0
            : asT<int>("clientType", jsonRes['clientType'])!,
        configType: jsonRes['configType'] == null
            ? 0
            : asT<int>("configType", jsonRes['configType'])!,
        flashTime: jsonRes['flashTime'] == null
            ? ''
            : asT<String>("flashTime", jsonRes['flashTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        loadStatus: jsonRes['loadStatus'] == null
            ? 0
            : asT<int>("loadStatus", jsonRes['loadStatus'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        pageName: jsonRes['pageName'] == null
            ? ''
            : asT<String>("pageName", jsonRes['pageName'])!,
        pictureUrl: jsonRes['pictureUrl'] == null
            ? ''
            : asT<String>("pictureUrl", jsonRes['pictureUrl'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
      );

  int clientType = 0;
  int configType = 0;
  String flashTime = '';
  String id = '';
  int loadStatus = 0;
  String merchantId = '';
  String pageName = '';
  String pictureUrl = '';
  String remark = '';
  int status = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'clientType': clientType,
        'configType': configType,
        'flashTime': flashTime,
        'id': id,
        'loadStatus': loadStatus,
        'merchantId': merchantId,
        'pageName': pageName,
        'pictureUrl': pictureUrl,
        'remark': remark,
        'status': status,
      };
}

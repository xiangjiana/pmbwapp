import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountTagPostRespModel {
  DiscountTagPostRespModel({
    required this.data,
  });

  factory DiscountTagPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<DiscountTagPostRespModelData>? data = jsonRes['data'] is List ? <DiscountTagPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(DiscountTagPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return DiscountTagPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<DiscountTagPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'data': data,
  };
}

class DiscountTagPostRespModelData {
  DiscountTagPostRespModelData({
    required this.id,
    required this.merchantId,
    required this.activityName,
    required this.activityType,
    required this.remark,
    required this.activitySort,
    required this.activityStatus,
  });

  factory DiscountTagPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => DiscountTagPostRespModelData(
    id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
    merchantId: jsonRes['merchantId'] == null
        ? ''
        : asT<String>("merchantId", jsonRes['merchantId'])!,
    activityName: jsonRes['activityName'] == null
        ? ''
        : asT<String>("activityName", jsonRes['activityName'])!,
    activityType: jsonRes['activityType'] == null
        ? ''
        : asT<String>("activityType", jsonRes['activityType'])!,
    remark: jsonRes['remark'] == null
        ? ''
        : asT<String>("remark", jsonRes['remark'])!,
    activitySort: jsonRes['activitySort'] == null ? 0 : asT<int>("activitySort", jsonRes['activitySort'])!,
    activityStatus: jsonRes['activityStatus'] == null
        ? 0
        : asT<int>("activityStatus", jsonRes['activityStatus'])!,
  );

  String id = '';
  String merchantId = '';
  String activityName = '';
  String activityType = '';
  String remark = '';
  int activitySort = 0;
  int activityStatus = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'merchantId': merchantId,
    'activityName': activityName,
    'activityType': activityType,
    'remark': remark,
    'activitySort': activitySort,
    'activityStatus': activityStatus,
  };
}

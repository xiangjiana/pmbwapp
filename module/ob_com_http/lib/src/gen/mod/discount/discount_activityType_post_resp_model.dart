import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountActivityTypePostRespModel {
  DiscountActivityTypePostRespModel({
    required this.data,
  });

  factory DiscountActivityTypePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<DiscountActivityTypePostRespModelData>? data = jsonRes['data'] is List ? <DiscountActivityTypePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(DiscountActivityTypePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return DiscountActivityTypePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<DiscountActivityTypePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class DiscountActivityTypePostRespModelData {
  DiscountActivityTypePostRespModelData({
    required this.activityName,
    required this.activitySort,
    required this.activityType,
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory DiscountActivityTypePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => DiscountActivityTypePostRespModelData(
        activityName: jsonRes['activityName'] == null
            ? ''
            : asT<String>("activityName", jsonRes['activityName'])!,
        activitySort: jsonRes['activitySort'] == null
            ? 0
            : asT<int>("activitySort", jsonRes['activitySort'])!,
        activityType: jsonRes['activityType'] == null
            ? 0
            : asT<int>("activityType", jsonRes['activityType'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String activityName = '';
  int activitySort = 0;
  int activityType = 0;
  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityName': activityName,
        'activitySort': activitySort,
        'activityType': activityType,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

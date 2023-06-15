import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountVipPostRespModel {
  DiscountVipPostRespModel({
    required this.data,
  });

  factory DiscountVipPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<DiscountVipPostRespModelData>? data = jsonRes['data'] is List ? <DiscountVipPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(DiscountVipPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return DiscountVipPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<DiscountVipPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class DiscountVipPostRespModelData {
  DiscountVipPostRespModelData({
    required this.activityAppType,
    required this.activityDownAt,
    required this.activityEnterPicture,
    required this.activityForwordLink,
    required this.activityName,
    required this.activityPrescription,
    required this.activityShareLink,
    required this.activitySharePicture,
    required this.activityTitle,
    required this.activityType,
    required this.activityUpAt,
    required this.activityUserType,
    required this.id,
    required this.merchantId,
    required this.sort,
    required this.status,
    required this.statusExpired,
  });

  factory DiscountVipPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => DiscountVipPostRespModelData(
        activityAppType: jsonRes['activityAppType'] == null
            ? ''
            : asT<String>("activityAppType", jsonRes['activityAppType'])!,
        activityDownAt: jsonRes['activityDownAt'] == null
            ? ''
            : asT<String>("activityDownAt", jsonRes['activityDownAt'])!,
        activityEnterPicture: jsonRes['activityEnterPicture'] == null
            ? ''
            : asT<String>(
                "activityEnterPicture", jsonRes['activityEnterPicture'])!,
        activityForwordLink: jsonRes['activityForwordLink'] == null
            ? ''
            : asT<String>(
                "activityForwordLink", jsonRes['activityForwordLink'])!,
        activityName: jsonRes['activityName'] == null
            ? ''
            : asT<String>("activityName", jsonRes['activityName'])!,
        activityPrescription: jsonRes['activityPrescription'] == null
            ? 0
            : asT<int>(
                "activityPrescription", jsonRes['activityPrescription'])!,
        activityShareLink: jsonRes['activityShareLink'] == null
            ? ''
            : asT<String>("activityShareLink", jsonRes['activityShareLink'])!,
        activitySharePicture: jsonRes['activitySharePicture'] == null
            ? ''
            : asT<String>(
                "activitySharePicture", jsonRes['activitySharePicture'])!,
        activityTitle: jsonRes['activityTitle'] == null
            ? ''
            : asT<String>("activityTitle", jsonRes['activityTitle'])!,
        activityType: jsonRes['activityType'] == null
            ? 0
            : asT<int>("activityType", jsonRes['activityType'])!,
        activityUpAt: jsonRes['activityUpAt'] == null
            ? ''
            : asT<String>("activityUpAt", jsonRes['activityUpAt'])!,
        activityUserType: jsonRes['activityUserType'] == null
            ? ''
            : asT<String>("activityUserType", jsonRes['activityUserType'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        statusExpired: jsonRes['statusExpired'] == null
            ? 0
            : asT<int>("statusExpired", jsonRes['statusExpired'])!,
      );

  String activityAppType = '';
  String activityDownAt = '';
  String activityEnterPicture = '';
  String activityForwordLink = '';
  String activityName = '';
  int activityPrescription = 0;
  String activityShareLink = '';
  String activitySharePicture = '';
  String activityTitle = '';
  int activityType = 0;
  String activityUpAt = '';
  String activityUserType = '';
  String id = '';
  String merchantId = '';
  int sort = 0;
  int status = 0;
  int statusExpired = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityAppType': activityAppType,
        'activityDownAt': activityDownAt,
        'activityEnterPicture': activityEnterPicture,
        'activityForwordLink': activityForwordLink,
        'activityName': activityName,
        'activityPrescription': activityPrescription,
        'activityShareLink': activityShareLink,
        'activitySharePicture': activitySharePicture,
        'activityTitle': activityTitle,
        'activityType': activityType,
        'activityUpAt': activityUpAt,
        'activityUserType': activityUserType,
        'id': id,
        'merchantId': merchantId,
        'sort': sort,
        'status': status,
        'statusExpired': statusExpired,
      };
}

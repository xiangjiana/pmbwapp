import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ObDiscountActivityQueryDiscountActivityPostRespModel {
  ObDiscountActivityQueryDiscountActivityPostRespModel({
    required this.configDiscountActivityDTO,
    required this.obConfigActivityVip,
  });

  factory ObDiscountActivityQueryDiscountActivityPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ConfigDiscountActivityDTO>? configDiscountActivityDTO =
        jsonRes['configDiscountActivityDTO'] is List
            ? <ConfigDiscountActivityDTO>[]
            : null;
    if (configDiscountActivityDTO != null) {
      for (final dynamic item in jsonRes['configDiscountActivityDTO']!) {
        if (item != null) {
          configDiscountActivityDTO.add(ConfigDiscountActivityDTO.fromJson(
              asT<Map<String, dynamic>>("configDiscountActivityDTO", item)!));
        }
      }
    }

    final List<ObConfigActivityVip>? obConfigActivityVip =
        jsonRes['obConfigActivityVip'] is List ? <ObConfigActivityVip>[] : null;
    if (obConfigActivityVip != null) {
      for (final dynamic item in jsonRes['obConfigActivityVip']!) {
        if (item != null) {
          obConfigActivityVip.add(ObConfigActivityVip.fromJson(
              asT<Map<String, dynamic>>("obConfigActivityVip", item)!));
        }
      }
    }
    return ObDiscountActivityQueryDiscountActivityPostRespModel(
      configDiscountActivityDTO:
          configDiscountActivityDTO == null ? [] : configDiscountActivityDTO,
      obConfigActivityVip:
          obConfigActivityVip == null ? [] : obConfigActivityVip,
    );
  }

  List<ConfigDiscountActivityDTO> configDiscountActivityDTO;
  List<ObConfigActivityVip> obConfigActivityVip;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'configDiscountActivityDTO': configDiscountActivityDTO,
        'obConfigActivityVip': obConfigActivityVip,
      };
}

class ConfigDiscountActivityDTO {
  ConfigDiscountActivityDTO({
    required this.activityTagName,
    required this.id,
    required this.obConfigDiscountActivity,
  });

  factory ConfigDiscountActivityDTO.fromJson(Map<String, dynamic> jsonRes) {
    final List<ObConfigDiscountActivity>? obConfigDiscountActivity =
        jsonRes['obConfigDiscountActivity'] is List
            ? <ObConfigDiscountActivity>[]
            : null;
    if (obConfigDiscountActivity != null) {
      for (final dynamic item in jsonRes['obConfigDiscountActivity']!) {
        if (item != null) {
          obConfigDiscountActivity.add(ObConfigDiscountActivity.fromJson(
              asT<Map<String, dynamic>>("obConfigDiscountActivity", item)!));
        }
      }
    }
    return ConfigDiscountActivityDTO(
      activityTagName: jsonRes['activityTagName'] == null
          ? ''
          : asT<String>("activityTagName", jsonRes['activityTagName'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      obConfigDiscountActivity:
          obConfigDiscountActivity == null ? [] : obConfigDiscountActivity,
    );
  }

  String activityTagName = '';
  String id = '';
  List<ObConfigDiscountActivity> obConfigDiscountActivity;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityTagName': activityTagName,
        'id': id,
        'obConfigDiscountActivity': obConfigDiscountActivity,
      };
}

class ObConfigDiscountActivity {
  ObConfigDiscountActivity({
    required this.activityAppType,
    required this.activityDiscountScale,
    required this.activityDiscountType,
    required this.activityEndAt,
    required this.activityEnterPicture,
    required this.activityForwordLink,
    required this.activityGiveMaxMoney,
    required this.activityName,
    required this.activityPictureDownAt,
    required this.activityPictureUpAt,
    required this.activityPrescription,
    required this.activityRechargeMoney,
    required this.activityShareLink,
    required this.activitySharePicture,
    required this.activityStartAt,
    required this.activityTitle,
    required this.activityType,
    required this.activityUserType,
    required this.activityWashCodeTimes,
    required this.createdAt,
    required this.createdBy,
    required this.discountTagId,
    required this.id,
    required this.merchantId,
    required this.sort,
    required this.status,
    required this.updatedAt,
    required this.updatedBy,
    required this.venueOrPayType,
  });

  factory ObConfigDiscountActivity.fromJson(Map<String, dynamic> jsonRes) =>
      ObConfigDiscountActivity(
        activityAppType: jsonRes['activityAppType'] == null
            ? ''
            : asT<String>("activityAppType", jsonRes['activityAppType'])!,
        activityDiscountScale: jsonRes['activityDiscountScale'] == null
            ? ''
            : asT<String>(
                "activityDiscountScale", jsonRes['activityDiscountScale'])!,
        activityDiscountType: jsonRes['activityDiscountType'] == null
            ? 0
            : asT<int>(
                "activityDiscountType", jsonRes['activityDiscountType'])!,
        activityEndAt: jsonRes['activityEndAt'] == null
            ? ''
            : asT<String>("activityEndAt", jsonRes['activityEndAt'])!,
        activityEnterPicture: jsonRes['activityEnterPicture'] == null
            ? ''
            : asT<String>(
                "activityEnterPicture", jsonRes['activityEnterPicture'])!,
        activityForwordLink: jsonRes['activityForwordLink'] == null
            ? ''
            : asT<String>(
                "activityForwordLink", jsonRes['activityForwordLink'])!,
        activityGiveMaxMoney: jsonRes['activityGiveMaxMoney'] == null
            ? 0
            : asT<int>(
                "activityGiveMaxMoney", jsonRes['activityGiveMaxMoney'])!,
        activityName: jsonRes['activityName'] == null
            ? ''
            : asT<String>("activityName", jsonRes['activityName'])!,
        activityPictureDownAt: jsonRes['activityPictureDownAt'] == null
            ? ''
            : asT<String>(
                "activityPictureDownAt", jsonRes['activityPictureDownAt'])!,
        activityPictureUpAt: jsonRes['activityPictureUpAt'] == null
            ? ''
            : asT<String>(
                "activityPictureUpAt", jsonRes['activityPictureUpAt'])!,
        activityPrescription: jsonRes['activityPrescription'] == null
            ? 0
            : asT<int>(
                "activityPrescription", jsonRes['activityPrescription'])!,
        activityRechargeMoney: jsonRes['activityRechargeMoney'] == null
            ? 0
            : asT<int>(
                "activityRechargeMoney", jsonRes['activityRechargeMoney'])!,
        activityShareLink: jsonRes['activityShareLink'] == null
            ? ''
            : asT<String>("activityShareLink", jsonRes['activityShareLink'])!,
        activitySharePicture: jsonRes['activitySharePicture'] == null
            ? ''
            : asT<String>(
                "activitySharePicture", jsonRes['activitySharePicture'])!,
        activityStartAt: jsonRes['activityStartAt'] == null
            ? ''
            : asT<String>("activityStartAt", jsonRes['activityStartAt'])!,
        activityTitle: jsonRes['activityTitle'] == null
            ? ''
            : asT<String>("activityTitle", jsonRes['activityTitle'])!,
        activityType: jsonRes['activityType'] == null
            ? 0
            : asT<int>("activityType", jsonRes['activityType'])!,
        activityUserType: jsonRes['activityUserType'] == null
            ? ''
            : asT<String>("activityUserType", jsonRes['activityUserType'])!,
        activityWashCodeTimes: jsonRes['activityWashCodeTimes'] == null
            ? ''
            : asT<String>(
                "activityWashCodeTimes", jsonRes['activityWashCodeTimes'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        discountTagId: jsonRes['discountTagId'] == null
            ? ''
            : asT<String>("discountTagId", jsonRes['discountTagId'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        venueOrPayType: jsonRes['venueOrPayType'] == null
            ? ''
            : asT<String>("venueOrPayType", jsonRes['venueOrPayType'])!,
      );

  String activityAppType = '';
  String activityDiscountScale = '';
  int activityDiscountType = 0;
  String activityEndAt = '';
  String activityEnterPicture = '';
  String activityForwordLink = '';
  int activityGiveMaxMoney = 0;
  String activityName = '';
  String activityPictureDownAt = '';
  String activityPictureUpAt = '';
  int activityPrescription = 0;
  int activityRechargeMoney = 0;
  String activityShareLink = '';
  String activitySharePicture = '';
  String activityStartAt = '';
  String activityTitle = '';
  int activityType = 0;
  String activityUserType = '';
  String activityWashCodeTimes = '';
  String createdAt = '';
  String createdBy = '';
  String discountTagId = '';
  String id = '';
  String merchantId = '';
  int sort = 0;
  int status = 0;
  String updatedAt = '';
  String updatedBy = '';
  String venueOrPayType = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'activityAppType': activityAppType,
        'activityDiscountScale': activityDiscountScale,
        'activityDiscountType': activityDiscountType,
        'activityEndAt': activityEndAt,
        'activityEnterPicture': activityEnterPicture,
        'activityForwordLink': activityForwordLink,
        'activityGiveMaxMoney': activityGiveMaxMoney,
        'activityName': activityName,
        'activityPictureDownAt': activityPictureDownAt,
        'activityPictureUpAt': activityPictureUpAt,
        'activityPrescription': activityPrescription,
        'activityRechargeMoney': activityRechargeMoney,
        'activityShareLink': activityShareLink,
        'activitySharePicture': activitySharePicture,
        'activityStartAt': activityStartAt,
        'activityTitle': activityTitle,
        'activityType': activityType,
        'activityUserType': activityUserType,
        'activityWashCodeTimes': activityWashCodeTimes,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'discountTagId': discountTagId,
        'id': id,
        'merchantId': merchantId,
        'sort': sort,
        'status': status,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
        'venueOrPayType': venueOrPayType,
      };
}

class ObConfigActivityVip {
  ObConfigActivityVip({
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
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.sort,
    required this.updatedAt,
    required this.updatedBy,
    required this.vipStatus,
  });

  factory ObConfigActivityVip.fromJson(Map<String, dynamic> jsonRes) =>
      ObConfigActivityVip(
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
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        vipStatus: jsonRes['vipStatus'] == null
            ? 0
            : asT<int>("vipStatus", jsonRes['vipStatus'])!,
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
  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  int sort = 0;
  String updatedAt = '';
  String updatedBy = '';
  int vipStatus = 0;

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
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'sort': sort,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
        'vipStatus': vipStatus,
      };
}

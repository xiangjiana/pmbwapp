import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigBannerPostRespModel {
  ConfigBannerPostRespModel({
    required this.data,
  });

  factory ConfigBannerPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<ConfigBannerPostRespModelData>? data = jsonRes['data'] is List ? <ConfigBannerPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ConfigBannerPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ConfigBannerPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ConfigBannerPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ConfigBannerPostRespModelData {
  ConfigBannerPostRespModelData({
    required this.areaType,
    required this.bannerName,
    required this.bannerTime,
    required this.bannerValidity,
    required this.clientType,
    required this.downTime,
    required this.gameCode,
    required this.id,
    required this.isLink,
    required this.linkTarget,
    required this.merchantId,
    required this.pictureUrl,
    required this.sort,
    required this.status,
    required this.targetUrl,
    required this.upTime,
  });

  factory ConfigBannerPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ConfigBannerPostRespModelData(
        areaType: jsonRes['areaType'] == null
            ? 0
            : asT<int>("areaType", jsonRes['areaType'])!,
        bannerName: jsonRes['bannerName'] == null
            ? ''
            : asT<String>("bannerName", jsonRes['bannerName'])!,
        bannerTime: jsonRes['bannerTime'] == null
            ? ''
            : asT<String>("bannerTime", jsonRes['bannerTime'])!,
        bannerValidity: jsonRes['bannerValidity'] == null
            ? 0
            : asT<int>("bannerValidity", jsonRes['bannerValidity'])!,
        clientType: jsonRes['clientType'] == null
            ? 0
            : asT<int>("clientType", jsonRes['clientType'])!,
        downTime: jsonRes['downTime'] == null
            ? ''
            : asT<String>("downTime", jsonRes['downTime'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isLink: jsonRes['isLink'] == null
            ? 0
            : asT<int>("isLink", jsonRes['isLink'])!,
        linkTarget: jsonRes['linkTarget'] == null
            ? 0
            : asT<int>("linkTarget", jsonRes['linkTarget'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        pictureUrl: jsonRes['pictureUrl'] == null
            ? ''
            : asT<String>("pictureUrl", jsonRes['pictureUrl'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        targetUrl: jsonRes['targetUrl'] == null
            ? ''
            : asT<String>("targetUrl", jsonRes['targetUrl'])!,
        upTime: jsonRes['upTime'] == null
            ? ''
            : asT<String>("upTime", jsonRes['upTime'])!,
      );

  int areaType = 0;
  String bannerName = '';
  String bannerTime = '';
  int bannerValidity = 0;
  int clientType = 0;
  String downTime = '';
  String gameCode = '';
  String id = '';
  int isLink = 0;
  int linkTarget = 0;
  String merchantId = '';
  String pictureUrl = '';
  int sort = 0;
  int status = 0;
  String targetUrl = '';
  String upTime = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'areaType': areaType,
        'bannerName': bannerName,
        'bannerTime': bannerTime,
        'bannerValidity': bannerValidity,
        'clientType': clientType,
        'downTime': downTime,
        'gameCode': gameCode,
        'id': id,
        'isLink': isLink,
        'linkTarget': linkTarget,
        'merchantId': merchantId,
        'pictureUrl': pictureUrl,
        'sort': sort,
        'status': status,
        'targetUrl': targetUrl,
        'upTime': upTime,
      };
}

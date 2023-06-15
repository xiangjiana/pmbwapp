import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ConfigClientConfigAllPostRespModel {
  ConfigClientConfigAllPostRespModel({
    required this.bankCodeDtoList,
    required this.configAnnouncementList,
    required this.configBannerRespDTOList,
    required this.configDictInfoList,
    required this.configPublicResourcesList,
    required this.configStartPageList,
    required this.configStartPageRespDTOList,
    required this.registerDefaultVentureCode,
    required this.payMerchant,
  });

  factory ConfigClientConfigAllPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<BankCodeDtoList>? bankCodeDtoList = jsonRes['bankCodeDtoList'] is List ? <BankCodeDtoList>[] : null;
    if (bankCodeDtoList != null) {
      for (final dynamic item in jsonRes['bankCodeDtoList']!) {
        if (item != null) {
          bankCodeDtoList.add(BankCodeDtoList.fromJson(asT<Map<String, dynamic>>("bankCodeDtoList", item)!));
        }
      }
    }

    final List<ConfigAnnouncementList>? configAnnouncementList =
        jsonRes['configAnnouncementList'] is List ? <ConfigAnnouncementList>[] : null;
    if (configAnnouncementList != null) {
      for (final dynamic item in jsonRes['configAnnouncementList']!) {
        if (item != null) {
          configAnnouncementList
              .add(ConfigAnnouncementList.fromJson(asT<Map<String, dynamic>>("configAnnouncementList", item)!));
        }
      }
    }

    final List<ConfigBannerRespDTOList>? configBannerRespDTOList =
        jsonRes['configBannerRespDTOList'] is List ? <ConfigBannerRespDTOList>[] : null;
    if (configBannerRespDTOList != null) {
      for (final dynamic item in jsonRes['configBannerRespDTOList']!) {
        if (item != null) {
          configBannerRespDTOList
              .add(ConfigBannerRespDTOList.fromJson(asT<Map<String, dynamic>>("configBannerRespDTOList", item)!));
        }
      }
    }

    final List<ConfigDictInfoList>? configDictInfoList =
        jsonRes['configDictInfoList'] is List ? <ConfigDictInfoList>[] : null;
    if (configDictInfoList != null) {
      for (final dynamic item in jsonRes['configDictInfoList']!) {
        if (item != null) {
          configDictInfoList.add(ConfigDictInfoList.fromJson(asT<Map<String, dynamic>>("configDictInfoList", item)!));
        }
      }
    }

    final List<ConfigPublicResourcesList>? configPublicResourcesList =
        jsonRes['configPublicResourcesList'] is List ? <ConfigPublicResourcesList>[] : null;
    if (configPublicResourcesList != null) {
      for (final dynamic item in jsonRes['configPublicResourcesList']!) {
        if (item != null) {
          configPublicResourcesList
              .add(ConfigPublicResourcesList.fromJson(asT<Map<String, dynamic>>("configPublicResourcesList", item)!));
        }
      }
    }

    final List<ConfigStartPageList>? configStartPageList =
        jsonRes['configStartPageList'] is List ? <ConfigStartPageList>[] : null;
    if (configStartPageList != null) {
      for (final dynamic item in jsonRes['configStartPageList']!) {
        if (item != null) {
          configStartPageList
              .add(ConfigStartPageList.fromJson(asT<Map<String, dynamic>>("configStartPageList", item)!));
        }
      }
    }

    final List<ConfigStartPageRespDTOList>? configStartPageRespDTOList =
        jsonRes['configStartPageRespDTOList'] is List ? <ConfigStartPageRespDTOList>[] : null;
    if (configStartPageRespDTOList != null) {
      for (final dynamic item in jsonRes['configStartPageRespDTOList']!) {
        if (item != null) {
          configStartPageRespDTOList
              .add(ConfigStartPageRespDTOList.fromJson(asT<Map<String, dynamic>>("configStartPageRespDTOList", item)!));
        }
      }
    }
    return ConfigClientConfigAllPostRespModel(
      bankCodeDtoList: bankCodeDtoList == null ? [] : bankCodeDtoList,
      configAnnouncementList: configAnnouncementList == null ? [] : configAnnouncementList,
      configBannerRespDTOList: configBannerRespDTOList == null ? [] : configBannerRespDTOList,
      configDictInfoList: configDictInfoList == null ? [] : configDictInfoList,
      configPublicResourcesList: configPublicResourcesList == null ? [] : configPublicResourcesList,
      configStartPageList: configStartPageList == null ? [] : configStartPageList,
      configStartPageRespDTOList: configStartPageRespDTOList == null ? [] : configStartPageRespDTOList,
      registerDefaultVentureCode: jsonRes['registerDefaultVentureCode'] == null
          ? ''
          : asT<String>("registerDefaultVentureCode", jsonRes['registerDefaultVentureCode'])!,
      payMerchant: jsonRes['payMerchant'] == null
          ? ''
          : asT<String>("payMerchant", jsonRes['payMerchant'])!,
    );
  }

  List<BankCodeDtoList> bankCodeDtoList;
  List<ConfigAnnouncementList> configAnnouncementList;
  List<ConfigBannerRespDTOList> configBannerRespDTOList;
  List<ConfigDictInfoList> configDictInfoList;
  List<ConfigPublicResourcesList> configPublicResourcesList;
  List<ConfigStartPageList> configStartPageList;
  List<ConfigStartPageRespDTOList> configStartPageRespDTOList;
  String registerDefaultVentureCode;
  String payMerchant;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCodeDtoList': bankCodeDtoList,
        'configAnnouncementList': configAnnouncementList,
        'configBannerRespDTOList': configBannerRespDTOList,
        'configDictInfoList': configDictInfoList,
        'configPublicResourcesList': configPublicResourcesList,
        'configStartPageList': configStartPageList,
        'configStartPageRespDTOList': configStartPageRespDTOList,
        'registerDefaultVentureCode': registerDefaultVentureCode,
        'payMerchant': payMerchant,
      };
}

class BankCodeDtoList {
  BankCodeDtoList({
    required this.bankCode,
    required this.bankName,
  });

  factory BankCodeDtoList.fromJson(Map<String, dynamic> jsonRes) => BankCodeDtoList(
        bankCode: jsonRes['bankCode'] == null ? '' : asT<String>("bankCode", jsonRes['bankCode'])!,
        bankName: jsonRes['bankName'] == null ? '' : asT<String>("bankName", jsonRes['bankName'])!,
      );

  String bankCode = '';
  String bankName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCode': bankCode,
        'bankName': bankName,
      };
}

class ConfigAnnouncementList {
  ConfigAnnouncementList({
    required this.announcementAging,
    required this.announcementContent,
    required this.announcementTitle,
    required this.createdAt,
    required this.createdBy,
    required this.downTime,
    required this.id,
    required this.merchantId,
    required this.status,
    required this.tag,
    required this.terminal,
    required this.upTime,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory ConfigAnnouncementList.fromJson(Map<String, dynamic> jsonRes) => ConfigAnnouncementList(
        announcementAging:
            jsonRes['announcementAging'] == null ? 0 : asT<int>("announcementAging", jsonRes['announcementAging'])!,
        announcementContent: jsonRes['announcementContent'] == null
            ? ''
            : asT<String>("announcementContent", jsonRes['announcementContent'])!,
        announcementTitle:
            jsonRes['announcementTitle'] == null ? '' : asT<String>("announcementTitle", jsonRes['announcementTitle'])!,
        createdAt: jsonRes['createdAt'] == null ? '' : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null ? '' : asT<String>("createdBy", jsonRes['createdBy'])!,
        downTime: jsonRes['downTime'] == null ? '' : asT<String>("downTime", jsonRes['downTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
        status: jsonRes['status'] == null ? 0 : asT<int>("status", jsonRes['status'])!,
        tag: jsonRes['tag'] == null ? 0 : asT<int>("tag", jsonRes['tag'])!,
        terminal: jsonRes['terminal'] == null ? '' : asT<String>("terminal", jsonRes['terminal'])!,
        upTime: jsonRes['upTime'] == null ? '' : asT<String>("upTime", jsonRes['upTime'])!,
        updatedAt: jsonRes['updatedAt'] == null ? '' : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null ? '' : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  int announcementAging = 0;
  String announcementContent = '';
  String announcementTitle = '';
  String createdAt = '';
  String createdBy = '';
  String downTime = '';
  String id = '';
  String merchantId = '';
  int status = 0;
  int tag = 0;
  String terminal = '';
  String upTime = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'announcementAging': announcementAging,
        'announcementContent': announcementContent,
        'announcementTitle': announcementTitle,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'downTime': downTime,
        'id': id,
        'merchantId': merchantId,
        'status': status,
        'tag': tag,
        'terminal': terminal,
        'upTime': upTime,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

class ConfigBannerRespDTOList {
  ConfigBannerRespDTOList({
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
    required this.venueType,
    required this.gameId,
  });

  factory ConfigBannerRespDTOList.fromJson(Map<String, dynamic> jsonRes) => ConfigBannerRespDTOList(
        areaType: jsonRes['areaType'] == null ? 0 : asT<int>("areaType", jsonRes['areaType'])!,
        bannerName: jsonRes['bannerName'] == null ? '' : asT<String>("bannerName", jsonRes['bannerName'])!,
        bannerTime: jsonRes['bannerTime'] == null ? '' : asT<String>("bannerTime", jsonRes['bannerTime'])!,
        bannerValidity: jsonRes['bannerValidity'] == null ? 0 : asT<int>("bannerValidity", jsonRes['bannerValidity'])!,
        clientType: jsonRes['clientType'] == null ? 0 : asT<int>("clientType", jsonRes['clientType'])!,
        downTime: jsonRes['downTime'] == null ? '' : asT<String>("downTime", jsonRes['downTime'])!,
        gameCode: jsonRes['gameCode'] == null ? '' : asT<String>("gameCode", jsonRes['gameCode'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isLink: jsonRes['isLink'] == null ? 0 : asT<int>("isLink", jsonRes['isLink'])!,
        linkTarget: jsonRes['linkTarget'] == null ? 0 : asT<int>("linkTarget", jsonRes['linkTarget'])!,
        merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
        pictureUrl: jsonRes['pictureUrl'] == null ? '' : asT<String>("pictureUrl", jsonRes['pictureUrl'])!,
        sort: jsonRes['sort'] == null ? 0 : asT<int>("sort", jsonRes['sort'])!,
        status: jsonRes['status'] == null ? 0 : asT<int>("status", jsonRes['status'])!,
        targetUrl: jsonRes['targetUrl'] == null ? '' : asT<String>("targetUrl", jsonRes['targetUrl'])!,
        upTime: jsonRes['upTime'] == null ? '' : asT<String>("upTime", jsonRes['upTime'])!,
        venueType: jsonRes['venueType'] == null ? '' : asT<String>("venueType", jsonRes['venueType'])!,
        gameId: jsonRes['gameId'] == null ? '' : asT<String>("gameId", jsonRes['gameId'])!,
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
  String venueType = '';
  String gameId = '';

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
        'venueType': venueType,
        'gameId': gameId,
      };
}

class ConfigDictInfoList {
  ConfigDictInfoList({
    required this.description,
    required this.key,
    required this.value,
  });

  factory ConfigDictInfoList.fromJson(Map<String, dynamic> jsonRes) => ConfigDictInfoList(
        description: jsonRes['description'] == null ? '' : asT<String>("description", jsonRes['description'])!,
        key: jsonRes['key'] == null ? '' : asT<String>("key", jsonRes['key'])!,
        value: jsonRes['value'] == null ? '' : asT<String>("value", jsonRes['value'])!,
      );

  String description = '';
  String key = '';
  String value = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'description': description,
        'key': key,
        'value': value,
      };
}

class ConfigPublicResourcesList {
  ConfigPublicResourcesList({
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.remark,
    required this.resourcesType,
    required this.resourcesUrl,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory ConfigPublicResourcesList.fromJson(Map<String, dynamic> jsonRes) => ConfigPublicResourcesList(
        createdAt: jsonRes['createdAt'] == null ? '' : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null ? '' : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
        remark: jsonRes['remark'] == null ? '' : asT<String>("remark", jsonRes['remark'])!,
        resourcesType: jsonRes['resourcesType'] == null ? 0 : asT<int>("resourcesType", jsonRes['resourcesType'])!,
        resourcesUrl: jsonRes['resourcesUrl'] == null ? '' : asT<String>("resourcesUrl", jsonRes['resourcesUrl'])!,
        updatedAt: jsonRes['updatedAt'] == null ? '' : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null ? '' : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String remark = '';
  int resourcesType = 0;
  String resourcesUrl = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'remark': remark,
        'resourcesType': resourcesType,
        'resourcesUrl': resourcesUrl,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

class ConfigStartPageList {
  ConfigStartPageList({
    required this.clientType,
    required this.configType,
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.loadStatus,
    required this.merchantId,
    required this.pageName,
    required this.pictureUrl,
    required this.remark,
    required this.status,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory ConfigStartPageList.fromJson(Map<String, dynamic> jsonRes) => ConfigStartPageList(
        clientType: jsonRes['clientType'] == null ? 0 : asT<int>("clientType", jsonRes['clientType'])!,
        configType: jsonRes['configType'] == null ? 0 : asT<int>("configType", jsonRes['configType'])!,
        createdAt: jsonRes['createdAt'] == null ? '' : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null ? '' : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        loadStatus: jsonRes['loadStatus'] == null ? 0 : asT<int>("loadStatus", jsonRes['loadStatus'])!,
        merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
        pageName: jsonRes['pageName'] == null ? '' : asT<String>("pageName", jsonRes['pageName'])!,
        pictureUrl: jsonRes['pictureUrl'] == null ? '' : asT<String>("pictureUrl", jsonRes['pictureUrl'])!,
        remark: jsonRes['remark'] == null ? '' : asT<String>("remark", jsonRes['remark'])!,
        status: jsonRes['status'] == null ? 0 : asT<int>("status", jsonRes['status'])!,
        updatedAt: jsonRes['updatedAt'] == null ? '' : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null ? '' : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  int clientType = 0;
  int configType = 0;
  String createdAt = '';
  String createdBy = '';
  String id = '';
  int loadStatus = 0;
  String merchantId = '';
  String pageName = '';
  String pictureUrl = '';
  String remark = '';
  int status = 0;
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'clientType': clientType,
        'configType': configType,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'loadStatus': loadStatus,
        'merchantId': merchantId,
        'pageName': pageName,
        'pictureUrl': pictureUrl,
        'remark': remark,
        'status': status,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

class ConfigStartPageRespDTOList {
  ConfigStartPageRespDTOList({
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

  factory ConfigStartPageRespDTOList.fromJson(Map<String, dynamic> jsonRes) => ConfigStartPageRespDTOList(
        clientType: jsonRes['clientType'] == null ? 0 : asT<int>("clientType", jsonRes['clientType'])!,
        configType: jsonRes['configType'] == null ? 0 : asT<int>("configType", jsonRes['configType'])!,
        flashTime: jsonRes['flashTime'] == null ? '' : asT<String>("flashTime", jsonRes['flashTime'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        loadStatus: jsonRes['loadStatus'] == null ? 0 : asT<int>("loadStatus", jsonRes['loadStatus'])!,
        merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
        pageName: jsonRes['pageName'] == null ? '' : asT<String>("pageName", jsonRes['pageName'])!,
        pictureUrl: jsonRes['pictureUrl'] == null ? '' : asT<String>("pictureUrl", jsonRes['pictureUrl'])!,
        remark: jsonRes['remark'] == null ? '' : asT<String>("remark", jsonRes['remark'])!,
        status: jsonRes['status'] == null ? 0 : asT<int>("status", jsonRes['status'])!,
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

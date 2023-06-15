import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/models.dart';

@jsonSerializable
class ClientConfigResp {
  ClientConfigResp({
    bankCodeDtoList,
    configAnnouncementList,
    configBannerRespDTOList,
    configDictInfoList,
    configStartPageRespDTOList,
    required this.payMerchant,
    required this.registerDefaultVentureCode,
  })  {
    this.bankCodeDtoList = bankCodeDtoList.cast<BankDto>();
    this.configAnnouncementList = configAnnouncementList.cast<ObConfigAnnouncement>();
    this.configBannerRespDTOList = configBannerRespDTOList.cast<ConfigBannerRespDTO>();
    this.configDictInfoList = configDictInfoList.cast<ConfigDictInfoDTO>();
    this.configStartPageRespDTOList = configStartPageRespDTOList.cast<ConfigStartPageRespDTO>();
  }

  late final List<BankDto> bankCodeDtoList;
  late final List<ObConfigAnnouncement> configAnnouncementList;
  late final List<ConfigBannerRespDTO> configBannerRespDTOList;
  late final List<ConfigDictInfoDTO> configDictInfoList;
  late final List<ConfigStartPageRespDTO> configStartPageRespDTOList;
  final String payMerchant;
  final String registerDefaultVentureCode;
}

@jsonSerializable
class BankDto {
  BankDto({
    required this.bankCode,
    required this.bankName,
  });

  final String bankCode;
  final String bankName;
}

@jsonSerializable
class ConfigBannerRespDTO {
  ConfigBannerRespDTO({
    required this.areaType,
    required this.bannerName,
    required this.bannerTime,
    required this.bannerValidity,
    required this.clientType,
    required this.downTime,
    required this.gameCode,
    required this.gameId,
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
  });

  final int areaType;
  final String bannerName;
  final String bannerTime;
  final int bannerValidity;
  final int clientType;
  final String downTime;
  final String gameCode;
  final num gameId;
  final String id;
  final int isLink;
  final int linkTarget;
  final String merchantId;
  final String pictureUrl;
  final int sort;
  final int status;
  final String targetUrl;
  final String upTime;
  final String venueType;
}

@jsonSerializable
class ConfigDictInfoDTO {
  ConfigDictInfoDTO({
    required this.description,
    required this.key,
    required this.value,
  });

  final String description;
  final String key;
  final String value;
}

@jsonSerializable
class ConfigStartPageRespDTO {
  ConfigStartPageRespDTO({
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

  final int clientType;
  final int configType;
  final String flashTime;
  final String id;
  final int loadStatus;
  final String merchantId;
  final String pageName;
  final String pictureUrl;
  final String remark;
  final int status;
}

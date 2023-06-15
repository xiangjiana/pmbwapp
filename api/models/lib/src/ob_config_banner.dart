import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ObConfigBanner{

  ObConfigBanner({
    required this.areaType,
    required this.bannerName,
    required this.bannerStatus,
    required this.bannerValidity,
    required this.clientType,
    required this.createdAt,
    required this.createdBy,
    required this.downTime,
    required this.gameCode,
    required this.gameId,
    required this.gameName,
    required this.id,
    required this.isLink,
    required this.linkTarget,
    required this.merchantId,
    required this.pictureUrl,
    required this.pictureUrlEn,
    required this.pictureUrlTh,
    required this.pictureUrlVn,
    required this.sort,
    required this.targetUrl,
    required this.upTime,
    required this.updatedAt,
    required this.updatedBy,
    required this.venueType,
  });

  final int areaType;
  final String bannerName;
  final int bannerStatus;
  final int bannerValidity;
  final int clientType;
  final String createdAt;
  final String createdBy;
  final String downTime;
  final String gameCode;
  final num gameId;
  final String gameName;
  final String id;
  final int isLink;
  final int linkTarget;
  final String merchantId;
  final String pictureUrl;
  final String pictureUrlEn;
  final String pictureUrlTh;
  final String pictureUrlVn;
  final int sort;
  final String targetUrl;
  final String upTime;
  final String updatedAt;
  final String updatedBy;
  final String venueType;
}
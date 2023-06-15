import 'package:dart_json_mapper/dart_json_mapper.dart';

/// clientType : 0
/// configType : 0
/// createdAt : "string"
/// createdBy : "string"
/// id : "string"
/// loadStatus : 0
/// merchantId : "string"
/// pageName : "string"
/// pageStatus : 0
/// pictureUrl : "string"
/// remark : "string"
/// updatedAt : "string"
/// updatedBy : "string"
/// venueCode : "string"
/// venueId : 0
/// venueName : "string"
@jsonSerializable
class ConfigStartPage {
  ConfigStartPage({
    required this.clientType,
    required this.configType,
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.loadStatus,
    required this.merchantId,
    required this.pageName,
    required this.pageStatus,
    required this.pictureUrl,
    required this.remark,
    required this.updatedAt,
    required this.updatedBy,
    required this.venueCode,
    required this.venueId,
    required this.venueName,
  });

  final int clientType;
  final int configType;
  final String createdAt;
  final String createdBy;
  final String id;
  final int loadStatus;
  final String merchantId;
  final String pageName;
  final int pageStatus;
  final String pictureUrl;
  final String remark;
  final String updatedAt;
  final String updatedBy;
  final String venueCode;
  final int venueId;
  final String venueName;
}

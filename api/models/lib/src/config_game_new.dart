import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ConfigGameNew {
  ConfigGameNew({
    required this.accessInfo,
    required this.createdAt,
    required this.createdBy,
    required this.description,
    required this.gameId,
    required this.gameName,
    required this.iconStatus,
    required this.iconUrl,
    required this.remark,
    required this.status,
    required this.supportTerminals,
    required this.updatedAt,
    required this.updatedBy,
    required this.venueCode,
    required this.venueTypeCode,
    required this.collectStatus,
  });

  final String accessInfo;
  final String createdAt;
  final String createdBy;
  final String description;
  final num gameId;
  num collectStatus;
  final String gameName;
  final num iconStatus;
  final String iconUrl;
  final String remark;
  final num status;
  final String supportTerminals;
  final String updatedAt;
  final String updatedBy;
  final String venueCode;
  final String venueTypeCode;
}

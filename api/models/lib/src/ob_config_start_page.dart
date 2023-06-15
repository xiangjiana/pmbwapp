import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ObConfigStartPage{
  ObConfigStartPage({
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
  final int clientType;
  final int configType;
  final String createdAt;
  final String createdBy;
  final String id;
  final int loadStatus;
  final String merchantId;
  final String pageName;
  final String pictureUrl;
  final String remark;
  final int status;
  final String updatedAt;
  final String updatedBy;
}
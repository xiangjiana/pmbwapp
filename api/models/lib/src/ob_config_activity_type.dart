import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ObConfigActivityType {
  ObConfigActivityType({
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

  final String activityName;
  final int activitySort;
  final int activityType;
  final String createdAt;
  final String createdBy;
  final String id;
  final String merchantId;
  final String updatedAt;
  final String updatedBy;
}

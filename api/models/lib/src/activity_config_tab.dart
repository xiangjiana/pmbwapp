import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ActivityConfigTab {
  ActivityConfigTab({
    required this.activityName,
    required this.activitySort,
    required this.activityStatus,
    required this.activityType,
    required this.id,
    required this.merchantId,
    required this.remark,
  });

  final String activityName;
  final int activitySort;
  final int activityStatus;
  final int activityType;
  final String id;
  final String merchantId;
  final String remark;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BwMessageBonusDetail {
  BwMessageBonusDetail({
    required this.billAmount,
    required this.bonusAmount,
    required this.bonusStatus,
    required this.bonusType,
    required this.businessId,
    required this.createdAt,
    required this.id,
    required this.merchantId,
    required this.receiveTime,
    required this.remark,
    required this.userId,
  });

  final num billAmount;
  final num bonusAmount;
  final int bonusStatus;
  final int bonusType;
  final String businessId;
  final String createdAt;
  final String id;
  final String merchantId;
  final String receiveTime;
  final String remark;
  final String userId;
}

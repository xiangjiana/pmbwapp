import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DepositDetails {
  DepositDetails({
    required this.appStatus,
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.orderStatus,
    required this.payMerchant,
    required this.payType,
    required this.remark,
  });

  final int appStatus;
  final int bizType;
  final String createdAt;
  final String id;
  final int orderAmount;
  final int orderStatus;
  final int payMerchant;
  final int payType;
  final String remark;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class WithDrawOrderParam {
  WithDrawOrderParam({
    required this.accountId,
    required this.deviceNo,
    required this.deviceType,
    required this.orderAmount,
    this.payPassword,
    required this.withdrawType,
  });

  final String accountId;
  final String deviceNo;
  final String deviceType;
  final String orderAmount;
  final String? payPassword;
  final String withdrawType;
}

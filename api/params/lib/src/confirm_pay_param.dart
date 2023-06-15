import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ConfirmPayParam {
  ConfirmPayParam({
    required this.bankId,
    this.channelId,
    required this.deviceNo,
    this.inGameDeposit,
    required this.paidAmount,
    this.realName,
    this.virtualProtocol,
    this.bizType,
    this.clientType,
  });

  final int bankId;
  final String? channelId;
  final String deviceNo;
  final int? inGameDeposit;
  final double paidAmount;
  final String? realName;
  final String? virtualProtocol;
  final int? clientType;
  final int? bizType;

}

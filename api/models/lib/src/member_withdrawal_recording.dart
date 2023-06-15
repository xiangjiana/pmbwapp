import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberWithdrawalRecording {
  MemberWithdrawalRecording({
    required this.daily,
    required this.details,
  });

  final String daily;
  final List<MemberPayTypeWithdrawal> details;
}

@jsonSerializable
class MemberPayTypeWithdrawal {
  MemberPayTypeWithdrawal({
    required this.appStatus,
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.orderStatus,
    required this.payMerchant,
    required this.remark,
    required this.thirdOrderNo,
    required this.withdrawAccountNo,
    required this.withdrawBank,
    required this.withdrawBankAddress,
    required this.withdrawInfo,
    required this.withdrawType,
  });

  final num appStatus;
  final num bizType;
  final String createdAt;
  final String id;
  final num orderAmount;
  final num orderStatus;
  final num payMerchant;
  final String remark;
  final String thirdOrderNo;
  final String withdrawAccountNo;
  final String withdrawBank;
  final String withdrawBankAddress;
  final String withdrawInfo;
  final num withdrawType;
}

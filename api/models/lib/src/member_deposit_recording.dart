import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberDepositRecording {
  MemberDepositRecording({
    details,
    required this.daily,
  }){
    this.details = details.cast<MemberpayTypeDepositDetails>();
  }

  final String daily;
  late final List<MemberpayTypeDepositDetails> details;
}

@jsonSerializable
class MemberpayTypeDepositDetails {
  MemberpayTypeDepositDetails({
    required this.appStatus,
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.payMerchant,
    required this.payType,
    required this.realAmount,
    required this.remark,
    required this.thirdOrderNo,
  });

  final num appStatus;
  final num bizType;
  final String createdAt;
  final String id;
  final num orderAmount;
  final num payMerchant;
  final num payType;
  final num realAmount;
  final String remark;
  final String thirdOrderNo;
}

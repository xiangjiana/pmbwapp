import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserBankCard {
  UserBankCard({
    required this.accountType,
    required this.bankBranch,
    required this.bankCode,
    required this.bankName,
    required this.bindNum,
    required this.bindStatus,
    required this.bindUserName,
    required this.blacklistStatus,
    required this.cardNumber,
    required this.city,
    required this.cnName,
    required this.createdAt,
    required this.createdBy,
    required this.dataType,
    required this.id,
    required this.isUsed,
    required this.merchantId,
    required this.province,
    required this.proxyWithdrawalFailNum,
    required this.proxyWithdrawalSuccessNum,
    required this.proxyWithdrawalTotalAmount,
    required this.realName,
    required this.remark,
    required this.sign,
    required this.status,
    required this.updatedAt,
    required this.updatedBy,
    required this.userId,
    required this.virtualAddress,
    required this.virtualKind,
    required this.virtualProtocol,
    required this.windControlId,
    required this.windControlName,
    required this.withdrawalFailNum,
    required this.withdrawalSuccessNum,
    required this.withdrawalTime,
    required this.withdrawalTotalAmount,
  });

  final int accountType;
  final String bankBranch;
  final String bankCode;
  final String bankName;
  final int bindNum;
  final int bindStatus;
  final String bindUserName;
  final int blacklistStatus;
  final String cardNumber;
  final String city;
  final String cnName;
  final String createdAt;
  final String createdBy;
  final int dataType;
  final String id;
  final int isUsed;
  final String merchantId;
  final String province;
  final int proxyWithdrawalFailNum;
  final int proxyWithdrawalSuccessNum;
  final num proxyWithdrawalTotalAmount;
  final String realName;
  final String remark;
  final String sign;
  final int status;
  final String updatedAt;
  final String updatedBy;
  final String userId;
  final String virtualAddress;
  final String virtualKind;
  final String virtualProtocol;
  final String windControlId;
  final String windControlName;
  final int withdrawalFailNum;
  final int withdrawalSuccessNum;
  final String withdrawalTime;
  final num withdrawalTotalAmount;
}

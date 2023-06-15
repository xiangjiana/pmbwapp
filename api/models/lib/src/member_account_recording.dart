import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberAccountRecording {
  MemberAccountRecording({
    required this.accountLockStatus,
    required this.amount,
    required this.appType,
    required this.bizType,
    required this.changeAfter,
    required this.changeBefore,
    required this.changeType,
    required this.createdAt,
    required this.currency,
    required this.eventId,
    required this.eventTime,
    required this.gameLockStatus,
    required this.id,
    required this.loginLockStatus,
    required this.merchantId,
    required this.merchantName,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.realName,
    required this.remark,
    required this.sign,
    required this.transType,
    required this.userId,
    required this.userName,
    required this.userType,
    required this.vipLevel,
    required this.walletType,
    required this.windControlId,
    required this.windControlName,
  });

  final int accountLockStatus;
  final double amount;
  final int appType;
  final int bizType;
  final double changeAfter;
  final double changeBefore;
  final int changeType;
  final String createdAt;
  final String currency;
  final String eventId;
  final String eventTime;
  final int gameLockStatus;
  final int id;
  final int loginLockStatus;
  final int merchantId;
  final String merchantName;
  final int parentProxyId;
  final String parentProxyName;
  final String realName;
  final String remark;
  final String sign;
  final int transType;
  final int userId;
  final String userName;
  final int userType;
  final int vipLevel;
  final int walletType;
  final int windControlId;
  final String windControlName;
}
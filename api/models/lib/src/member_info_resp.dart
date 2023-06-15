import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberInfoResp {
  MemberInfoResp({
    required this.accountType,
    required this.activityOnlyFlag,
    required this.balance,
    required this.birthday,
    required this.createdAt,
    required this.creditLevel,
    required this.currency,
    required this.email,
    required this.firstDeposit,
    required this.firstDepositDatetime,
    required this.gameLockStatus,
    required this.gender,
    required this.id,
    required this.invitationCode,
    required this.ipAttribution,
    required this.labelId,
    required this.labelName,
    required this.lastDeposit,
    required this.lastDepositTime,
    required this.lastLoginDatetime,
    required this.lastLoginDeviceNo,
    required this.lastLoginIp,
    required this.lastWithdrawTime,
    required this.loginLockStatus,
    required this.merchantId,
    required this.merchantName,
    required this.merchantPath,
    required this.mobile,
    required this.needChgPwd,
    required this.noTransfer,
    required this.parentMerchantId,
    required this.parentMerchantPath,
    required this.parentProxyId,
    required this.parentProxyLevel,
    required this.parentProxyLevelName,
    required this.parentProxyName,
    required this.parentProxyPath,
    required this.password,
    required this.paymentLockStatus,
    required this.realName,
    required this.registerDeviceNo,
    required this.registerDeviceType,
    required this.registerIp,
    required this.remark,
    required this.salt,
    required this.topImagesUrl,
    required this.topMerchantId,
    required this.topMerchantName,
    required this.topProxyId,
    required this.topProxyName,
    required this.totalBigWithdrawNum,
    required this.totalDeposit,
    required this.totalDepositNum,
    required this.totalWithdraw,
    required this.totalWithdrawNum,
    required this.transforNum,
    required this.updatedAt,
    required this.userName,
    required this.vipExperience,
    required this.vipId,
    required this.vipLevel,
    required this.windControlId,
    required this.windControlName,
  });

  int accountType;
  final int activityOnlyFlag;
  final num balance;
  final String birthday;
  final String createdAt;
  final int creditLevel;
  final String currency;
  final String email;
  final num firstDeposit;
  final String firstDepositDatetime;
  final int gameLockStatus;
  final int gender;
  final String id;
  final String invitationCode;
  final String ipAttribution;
  final num labelId;
  final String labelName;
  final num lastDeposit;
  final String lastDepositTime;
  final String lastLoginDatetime;
  final String lastLoginDeviceNo;
  final String lastLoginIp;
  final String lastWithdrawTime;
  final int loginLockStatus;
  final String merchantId;
  final String merchantName;
  final String merchantPath;
  final String mobile;
  final int needChgPwd;
  final int noTransfer;
  final String parentMerchantId;
  final String parentMerchantPath;
  final num parentProxyId;
  final int parentProxyLevel;
  final String parentProxyLevelName;
  final String parentProxyName;
  final String parentProxyPath;
  final String password;
  final int paymentLockStatus;
  final String realName;
  final String registerDeviceNo;
  final int registerDeviceType;
  final String registerIp;
  final String remark;
  final String salt;
  final String topImagesUrl;
  final String topMerchantId;
  final String topMerchantName;
  final num topProxyId;
  final String topProxyName;
  final int totalBigWithdrawNum;
  final num totalDeposit;
  final int totalDepositNum;
  final num totalWithdraw;
  final int totalWithdrawNum;
  final int transforNum;
  final String updatedAt;
  final String userName;
  final num vipExperience;
  final num vipId;
  final int vipLevel;
  final num windControlId;
  final String windControlName;
}

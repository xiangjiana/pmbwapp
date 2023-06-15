import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberInfo {
  MemberInfo({
    required this.accountStatus,
    required this.accountType,
    required this.appId,
    required this.applyInfo,
    required this.applyName,
    required this.birth,
    required this.birthday,
    required this.bounsTimestamp,
    required this.createDt,
    required this.deviceNo,
    required this.deviceType,
    required this.email,
    required this.entryAuthority,
    required this.firstDepositAmount,
    required this.firstDepositTime,
    required this.firstWithdrawAmount,
    required this.firstWithdrawTime,
    required this.gameLockStatus,
    required this.gender,
    required this.id,
    required this.ipAttribution,
    required this.labelId,
    required this.labelName,
    required this.lastDepositId,
    required this.lastDepositTime,
    required this.lastLoginIp,
    required this.lastLoginTime,
    required this.lastWithdrawId,
    required this.lastWithdrawTime,
    required this.levelId,
    required this.loginLockStatus,
    required this.merchantCode,
    required this.merchantId,
    required this.mobile,
    required this.noTransfer,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.parentProxyPath,
    required this.password,
    required this.paymentLockStatus,
    required this.realName,
    required this.registerIp,
    required this.registerPhone,
    required this.registerReference,
    required this.salt,
    required this.status,
    required this.topImagesUrl,
    required this.totalDepositAmount,
    required this.totalDepositNum,
    required this.totalWithdrawAmount,
    required this.totalWithdrawNum,
    required this.transforNum,
    required this.unacclaimBounsTotal,
    required this.unreadMessageTotal,
    required this.updateDt,
    required this.userName,
    required this.vipExperienceVal,
    required this.vipId,
    required this.vipLevel,
    required this.vipSerialNum,
    required this.windControlId,
    required this.windControlName,
  });

  final int accountStatus;
  final int accountType;
  final int appId;
  final String applyInfo;
  final String applyName;
  final String birth;
  final String birthday;
  final String bounsTimestamp;
  final String createDt;
  final String deviceNo;
  final int deviceType;
  final String email;
  final String entryAuthority;
  final int firstDepositAmount;
  final String firstDepositTime;
  final int firstWithdrawAmount;
  final String firstWithdrawTime;
  final int gameLockStatus;
  final int gender;
  final String id;
  final String ipAttribution;
  final int labelId;
  final String labelName;
  final int lastDepositId;
  final String lastDepositTime;
  final String lastLoginIp;
  final String lastLoginTime;
  final int lastWithdrawId;
  final String lastWithdrawTime;
  final int levelId;
  final int loginLockStatus;
  final String merchantCode;
  final int merchantId;
  final String mobile;
  final int noTransfer;
  final int parentProxyId;
  final String parentProxyName;
  final String parentProxyPath;
  final String password;
  final int paymentLockStatus;
  final String realName;
  final String registerIp;
  final String registerPhone;
  final String registerReference;
  final String salt;
  final int status;
  final String topImagesUrl;
  final int totalDepositAmount;
  final int totalDepositNum;
  final int totalWithdrawAmount;
  final int totalWithdrawNum;
  final int transforNum;
  final int unacclaimBounsTotal;
  final int unreadMessageTotal;
  final String updateDt;
  final String userName;
  final int vipExperienceVal;
  final int vipId;
  final int vipLevel;
  final int vipSerialNum;
  final int windControlId;
  final String windControlName;
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserLoginPostRespModel {
  UserLoginPostRespModel({
    required this.memberInfo,
    required this.token,
  });

  factory UserLoginPostRespModel.fromJson(Map<String, dynamic> jsonRes) =>
      UserLoginPostRespModel(
        memberInfo: jsonRes["memberInfo"] == null
            ? UserLoginPostRespModelMemberInfo.fromJson({})
            : UserLoginPostRespModelMemberInfo.fromJson(
                asT<Map<String, dynamic>>(
                    "memberInfo", jsonRes["memberInfo"])!),
        token: jsonRes['token'] == null
            ? ''
            : asT<String>("token", jsonRes['token'])!,
      );

  UserLoginPostRespModelMemberInfo memberInfo;
  String token = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberInfo': memberInfo,
        'token': token,
      };
}

class UserLoginPostRespModelMemberInfo {
  UserLoginPostRespModelMemberInfo({
    required this.accountStatus,
    required this.accountType,
    required this.applyInfo,
    required this.applyName,
    required this.birth,
    required this.birthday,
    required this.createDt,
    required this.deviceNo,
    required this.deviceType,
    required this.email,
    required this.firstDepositAmount,
    required this.firstDepositTime,
    required this.firstWithdrawAmount,
    required this.firstWithdrawTime,
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
    required this.merchantCode,
    required this.merchantId,
    required this.mobile,
    required this.newOldType,
    required this.noTransfer,
    required this.parentProxyId,
    required this.parentProxyName,
    required this.parentProxyPath,
    required this.password,
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
    required this.updateDt,
    required this.userName,
    required this.vipExperienceVal,
    required this.vipId,
    required this.vipSerialNum,
    required this.windControlId,
    required this.windControlName,
  });

  factory UserLoginPostRespModelMemberInfo.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserLoginPostRespModelMemberInfo(
        accountStatus: jsonRes['accountStatus'] == null
            ? 0
            : asT<int>("accountStatus", jsonRes['accountStatus'])!,
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        applyInfo: jsonRes['applyInfo'] == null
            ? ''
            : asT<String>("applyInfo", jsonRes['applyInfo'])!,
        applyName: jsonRes['applyName'] == null
            ? ''
            : asT<String>("applyName", jsonRes['applyName'])!,
        birth: jsonRes['birth'] == null
            ? ''
            : asT<String>("birth", jsonRes['birth'])!,
        birthday: jsonRes['birthday'] == null
            ? ''
            : asT<String>("birthday", jsonRes['birthday'])!,
        createDt: jsonRes['createDt'] == null
            ? ''
            : asT<String>("createDt", jsonRes['createDt'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        email: jsonRes['email'] == null
            ? ''
            : asT<String>("email", jsonRes['email'])!,
        firstDepositAmount: jsonRes['firstDepositAmount'] == null
            ? 0.0
            : asT<double>("firstDepositAmount", jsonRes['firstDepositAmount'])!,
        firstDepositTime: jsonRes['firstDepositTime'] == null
            ? ''
            : asT<String>("firstDepositTime", jsonRes['firstDepositTime'])!,
        firstWithdrawAmount: jsonRes['firstWithdrawAmount'] == null
            ? 0.0
            : asT<double>(
                "firstWithdrawAmount", jsonRes['firstWithdrawAmount'])!,
        firstWithdrawTime: jsonRes['firstWithdrawTime'] == null
            ? ''
            : asT<String>("firstWithdrawTime", jsonRes['firstWithdrawTime'])!,
        gender: jsonRes['gender'] == null
            ? 0
            : asT<int>("gender", jsonRes['gender'])!,
        id: jsonRes['id'] == null ? '0' : asT<String>("id", jsonRes['id'])!,
        ipAttribution: jsonRes['ipAttribution'] == null
            ? ''
            : asT<String>("ipAttribution", jsonRes['ipAttribution'])!,
        labelId: jsonRes['labelId'] == null
            ? 0
            : asT<int>("labelId", jsonRes['labelId'])!,
        labelName: jsonRes['labelName'] == null
            ? ''
            : asT<String>("labelName", jsonRes['labelName'])!,
        lastDepositId: jsonRes['lastDepositId'] == null
            ? 0
            : asT<int>("lastDepositId", jsonRes['lastDepositId'])!,
        lastDepositTime: jsonRes['lastDepositTime'] == null
            ? ''
            : asT<String>("lastDepositTime", jsonRes['lastDepositTime'])!,
        lastLoginIp: jsonRes['lastLoginIp'] == null
            ? ''
            : asT<String>("lastLoginIp", jsonRes['lastLoginIp'])!,
        lastLoginTime: jsonRes['lastLoginTime'] == null
            ? ''
            : asT<String>("lastLoginTime", jsonRes['lastLoginTime'])!,
        lastWithdrawId: jsonRes['lastWithdrawId'] == null
            ? 0
            : asT<int>("lastWithdrawId", jsonRes['lastWithdrawId'])!,
        lastWithdrawTime: jsonRes['lastWithdrawTime'] == null
            ? ''
            : asT<String>("lastWithdrawTime", jsonRes['lastWithdrawTime'])!,
        levelId: jsonRes['levelId'] == null
            ? 0
            : asT<int>("levelId", jsonRes['levelId'])!,
        merchantCode: jsonRes['merchantCode'] == null
            ? ''
            : asT<String>("merchantCode", jsonRes['merchantCode'])!,
        merchantId: jsonRes['merchantId'] == null
            ? '0'
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        mobile: jsonRes['mobile'] == null
            ? ''
            : asT<String>("mobile", jsonRes['mobile'])!,
        newOldType: jsonRes['newOldType'] == null
            ? 0
            : asT<int>("newOldType", jsonRes['newOldType'])!,
        noTransfer: jsonRes['noTransfer'] == null
            ? 0
            : asT<int>("noTransfer", jsonRes['noTransfer'])!,
        parentProxyId: jsonRes['parentProxyId'] == null
            ? 0
            : asT<int>("parentProxyId", jsonRes['parentProxyId'])!,
        parentProxyName: jsonRes['parentProxyName'] == null
            ? ''
            : asT<String>("parentProxyName", jsonRes['parentProxyName'])!,
        parentProxyPath: jsonRes['parentProxyPath'] == null
            ? ''
            : asT<String>("parentProxyPath", jsonRes['parentProxyPath'])!,
        password: jsonRes['password'] == null
            ? ''
            : asT<String>("password", jsonRes['password'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        registerIp: jsonRes['registerIp'] == null
            ? ''
            : asT<String>("registerIp", jsonRes['registerIp'])!,
        registerPhone: jsonRes['registerPhone'] == null
            ? ''
            : asT<String>("registerPhone", jsonRes['registerPhone'])!,
        registerReference: jsonRes['registerReference'] == null
            ? ''
            : asT<String>("registerReference", jsonRes['registerReference'])!,
        salt: jsonRes['salt'] == null
            ? ''
            : asT<String>("salt", jsonRes['salt'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        topImagesUrl: jsonRes['topImagesUrl'] == null
            ? ''
            : asT<String>("topImagesUrl", jsonRes['topImagesUrl'])!,
        totalDepositAmount: jsonRes['totalDepositAmount'] == null
            ? 0.0
            : asT<double>("totalDepositAmount", jsonRes['totalDepositAmount'])!,
        totalDepositNum: jsonRes['totalDepositNum'] == null
            ? 0
            : asT<int>("totalDepositNum", jsonRes['totalDepositNum'])!,
        totalWithdrawAmount: jsonRes['totalWithdrawAmount'] == null
            ? 0.0
            : asT<double>(
                "totalWithdrawAmount", jsonRes['totalWithdrawAmount'])!,
        totalWithdrawNum: jsonRes['totalWithdrawNum'] == null
            ? 0
            : asT<int>("totalWithdrawNum", jsonRes['totalWithdrawNum'])!,
        transforNum: jsonRes['transforNum'] == null
            ? 0
            : asT<int>("transforNum", jsonRes['transforNum'])!,
        updateDt: jsonRes['updateDt'] == null
            ? ''
            : asT<String>("updateDt", jsonRes['updateDt'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
        vipExperienceVal: jsonRes['vipExperienceVal'] == null
            ? 0
            : asT<int>("vipExperienceVal", jsonRes['vipExperienceVal'])!,
        vipId:
            jsonRes['vipId'] == null ? 0 : asT<int>("vipId", jsonRes['vipId'])!,
        vipSerialNum: jsonRes['vipSerialNum'] == null
            ? 0
            : asT<int>("vipSerialNum", jsonRes['vipSerialNum'])!,
        windControlId: jsonRes['windControlId'] == null
            ? 0
            : asT<int>("windControlId", jsonRes['windControlId'])!,
        windControlName: jsonRes['windControlName'] == null
            ? ''
            : asT<String>("windControlName", jsonRes['windControlName'])!,
      );

  int accountStatus = 0;
  int accountType = 0;
  String applyInfo = '';
  String applyName = '';
  String birth = '';
  String birthday = '';
  String createDt = '';
  String deviceNo = '';
  int deviceType = 0;
  String email = '';
  double firstDepositAmount = 0.0;
  String firstDepositTime = '';
  double firstWithdrawAmount = 0.0;
  String firstWithdrawTime = '';
  int gender = 0;
  String id = '';
  String ipAttribution = '';
  int labelId = 0;
  String labelName = '';
  int lastDepositId = 0;
  String lastDepositTime = '';
  String lastLoginIp = '';
  String lastLoginTime = '';
  int lastWithdrawId = 0;
  String lastWithdrawTime = '';
  int levelId = 0;
  String merchantCode = '';
  String merchantId = '';
  String mobile = '';
  int newOldType = 0;
  int noTransfer = 0;
  int parentProxyId = 0;
  String parentProxyName = '';
  String parentProxyPath = '';
  String password = '';
  String realName = '';
  String registerIp = '';
  String registerPhone = '';
  String registerReference = '';
  String salt = '';
  int status = 0;
  String topImagesUrl = '';
  double totalDepositAmount = 0.0;
  int totalDepositNum = 0;
  double totalWithdrawAmount = 0.0;
  int totalWithdrawNum = 0;
  int transforNum = 0;
  String updateDt = '';
  String userName = '';
  int vipExperienceVal = 0;
  int vipId = 0;
  int vipSerialNum = 0;
  int windControlId = 0;
  String windControlName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountStatus': accountStatus,
        'accountType': accountType,
        'applyInfo': applyInfo,
        'applyName': applyName,
        'birth': birth,
        'birthday': birthday,
        'createDt': createDt,
        'deviceNo': deviceNo,
        'deviceType': deviceType,
        'email': email,
        'firstDepositAmount': firstDepositAmount,
        'firstDepositTime': firstDepositTime,
        'firstWithdrawAmount': firstWithdrawAmount,
        'firstWithdrawTime': firstWithdrawTime,
        'gender': gender,
        'id': id,
        'ipAttribution': ipAttribution,
        'labelId': labelId,
        'labelName': labelName,
        'lastDepositId': lastDepositId,
        'lastDepositTime': lastDepositTime,
        'lastLoginIp': lastLoginIp,
        'lastLoginTime': lastLoginTime,
        'lastWithdrawId': lastWithdrawId,
        'lastWithdrawTime': lastWithdrawTime,
        'levelId': levelId,
        'merchantCode': merchantCode,
        'merchantId': merchantId,
        'mobile': mobile,
        'newOldType': newOldType,
        'noTransfer': noTransfer,
        'parentProxyId': parentProxyId,
        'parentProxyName': parentProxyName,
        'parentProxyPath': parentProxyPath,
        'password': password,
        'realName': realName,
        'registerIp': registerIp,
        'registerPhone': registerPhone,
        'registerReference': registerReference,
        'salt': salt,
        'status': status,
        'topImagesUrl': topImagesUrl,
        'totalDepositAmount': totalDepositAmount,
        'totalDepositNum': totalDepositNum,
        'totalWithdrawAmount': totalWithdrawAmount,
        'totalWithdrawNum': totalWithdrawNum,
        'transforNum': transforNum,
        'updateDt': updateDt,
        'userName': userName,
        'vipExperienceVal': vipExperienceVal,
        'vipId': vipId,
        'vipSerialNum': vipSerialNum,
        'windControlId': windControlId,
        'windControlName': windControlName,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankQueryPostRespModel {
  UserBankQueryPostRespModel({
    required this.data,
  });

  factory UserBankQueryPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<UserBankQueryPostRespModelData>? data = jsonRes['data'] is List ? <UserBankQueryPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(UserBankQueryPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return UserBankQueryPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<UserBankQueryPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class UserBankQueryPostRespModelData {
  UserBankQueryPostRespModelData({
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

  factory UserBankQueryPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => UserBankQueryPostRespModelData(
        accountType: jsonRes['accountType'] == null
            ? 0
            : asT<int>("accountType", jsonRes['accountType'])!,
        bankBranch: jsonRes['bankBranch'] == null
            ? ''
            : asT<String>("bankBranch", jsonRes['bankBranch'])!,
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        bankName: jsonRes['bankName'] == null
            ? ''
            : asT<String>("bankName", jsonRes['bankName'])!,
        bindNum: jsonRes['bindNum'] == null
            ? 0
            : asT<int>("bindNum", jsonRes['bindNum'])!,
        bindStatus: jsonRes['bindStatus'] == null
            ? 0
            : asT<int>("bindStatus", jsonRes['bindStatus'])!,
        bindUserName: jsonRes['bindUserName'] == null
            ? ''
            : asT<String>("bindUserName", jsonRes['bindUserName'])!,
        blacklistStatus: jsonRes['blacklistStatus'] == null
            ? 0
            : asT<int>("blacklistStatus", jsonRes['blacklistStatus'])!,
        cardNumber: jsonRes['cardNumber'] == null
            ? ''
            : asT<String>("cardNumber", jsonRes['cardNumber'])!,
        city: jsonRes['city'] == null
            ? ''
            : asT<String>("city", jsonRes['city'])!,
        cnName: jsonRes['cnName'] == null
            ? ''
            : asT<String>("cnName", jsonRes['cnName'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        dataType: jsonRes['dataType'] == null
            ? 0
            : asT<int>("dataType", jsonRes['dataType'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        isUsed: jsonRes['isUsed'] == null
            ? 0
            : asT<int>("isUsed", jsonRes['isUsed'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        province: jsonRes['province'] == null
            ? ''
            : asT<String>("province", jsonRes['province'])!,
        proxyWithdrawalFailNum: jsonRes['proxyWithdrawalFailNum'] == null
            ? 0
            : asT<int>(
                "proxyWithdrawalFailNum", jsonRes['proxyWithdrawalFailNum'])!,
        proxyWithdrawalSuccessNum: jsonRes['proxyWithdrawalSuccessNum'] == null
            ? 0
            : asT<int>("proxyWithdrawalSuccessNum",
                jsonRes['proxyWithdrawalSuccessNum'])!,
        proxyWithdrawalTotalAmount:
            jsonRes['proxyWithdrawalTotalAmount'] == null
                ? 0.0
                : asT<double>("proxyWithdrawalTotalAmount",
                    jsonRes['proxyWithdrawalTotalAmount'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        sign: jsonRes['sign'] == null
            ? ''
            : asT<String>("sign", jsonRes['sign'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        userId: jsonRes['userId'] == null
            ? ''
            : asT<String>("userId", jsonRes['userId'])!,
        virtualAddress: jsonRes['virtualAddress'] == null
            ? ''
            : asT<String>("virtualAddress", jsonRes['virtualAddress'])!,
        virtualKind: jsonRes['virtualKind'] == null
            ? ''
            : asT<String>("virtualKind", jsonRes['virtualKind'])!,
        virtualProtocol: jsonRes['virtualProtocol'] == null
            ? ''
            : asT<String>("virtualProtocol", jsonRes['virtualProtocol'])!,
        windControlId: jsonRes['windControlId'] == null
            ? ''
            : asT<String>("windControlId", jsonRes['windControlId'])!,
        windControlName: jsonRes['windControlName'] == null
            ? ''
            : asT<String>("windControlName", jsonRes['windControlName'])!,
        withdrawalFailNum: jsonRes['withdrawalFailNum'] == null
            ? 0
            : asT<int>("withdrawalFailNum", jsonRes['withdrawalFailNum'])!,
        withdrawalSuccessNum: jsonRes['withdrawalSuccessNum'] == null
            ? 0
            : asT<int>(
                "withdrawalSuccessNum", jsonRes['withdrawalSuccessNum'])!,
        withdrawalTime: jsonRes['withdrawalTime'] == null
            ? ''
            : asT<String>("withdrawalTime", jsonRes['withdrawalTime'])!,
        withdrawalTotalAmount: jsonRes['withdrawalTotalAmount'] == null
            ? 0.0
            : asT<double>(
                "withdrawalTotalAmount", jsonRes['withdrawalTotalAmount'])!,
      );

  int accountType = 0;
  String bankBranch = '';
  String bankCode = '';
  String bankName = '';
  int bindNum = 0;
  int bindStatus = 0;
  String bindUserName = '';
  int blacklistStatus = 0;
  String cardNumber = '';
  String city = '';
  String cnName = '';
  String createdAt = '';
  String createdBy = '';
  int dataType = 0;
  String id = '';
  int isUsed = 0;
  String merchantId = '';
  String province = '';
  int proxyWithdrawalFailNum = 0;
  int proxyWithdrawalSuccessNum = 0;
  double proxyWithdrawalTotalAmount = 0.0;
  String realName = '';
  String remark = '';
  String sign = '';
  int status = 0;
  String updatedAt = '';
  String updatedBy = '';
  String userId = '';
  String virtualAddress = '';
  String virtualKind = '';
  String virtualProtocol = '';
  String windControlId = '';
  String windControlName = '';
  int withdrawalFailNum = 0;
  int withdrawalSuccessNum = 0;
  String withdrawalTime = '';
  double withdrawalTotalAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'bankBranch': bankBranch,
        'bankCode': bankCode,
        'bankName': bankName,
        'bindNum': bindNum,
        'bindStatus': bindStatus,
        'bindUserName': bindUserName,
        'blacklistStatus': blacklistStatus,
        'cardNumber': cardNumber,
        'city': city,
        'cnName': cnName,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'dataType': dataType,
        'id': id,
        'isUsed': isUsed,
        'merchantId': merchantId,
        'province': province,
        'proxyWithdrawalFailNum': proxyWithdrawalFailNum,
        'proxyWithdrawalSuccessNum': proxyWithdrawalSuccessNum,
        'proxyWithdrawalTotalAmount': proxyWithdrawalTotalAmount,
        'realName': realName,
        'remark': remark,
        'sign': sign,
        'status': status,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
        'userId': userId,
        'virtualAddress': virtualAddress,
        'virtualKind': virtualKind,
        'virtualProtocol': virtualProtocol,
        'windControlId': windControlId,
        'windControlName': windControlName,
        'withdrawalFailNum': withdrawalFailNum,
        'withdrawalSuccessNum': withdrawalSuccessNum,
        'withdrawalTime': withdrawalTime,
        'withdrawalTotalAmount': withdrawalTotalAmount,
      };
}

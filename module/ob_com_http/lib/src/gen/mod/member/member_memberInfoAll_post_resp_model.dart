import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberMemberInfoAllPostRespModel {
  MemberMemberInfoAllPostRespModel({
    required this.agentCustomerUrl,
    required this.memberCustomerUrl,
    required this.memberInfoVO,
    required this.profitAndLossRespDto,
    required this.userAccountBalanceRespDto,
    required this.vipInfoVO,
  });

  factory MemberMemberInfoAllPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberMemberInfoAllPostRespModel(
        agentCustomerUrl: jsonRes['agentCustomerUrl'] == null
            ? ''
            : asT<String>("agentCustomerUrl", jsonRes['agentCustomerUrl'])!,
        memberCustomerUrl: jsonRes['memberCustomerUrl'] == null
            ? ''
            : asT<String>("memberCustomerUrl", jsonRes['memberCustomerUrl'])!,
        memberInfoVO: jsonRes["memberInfoVO"] == null
            ? MemberMemberInfoAllPostRespModelMemberInfoVO.fromJson({})
            : MemberMemberInfoAllPostRespModelMemberInfoVO.fromJson(asT<Map<String, dynamic>>(
                "memberInfoVO", jsonRes["memberInfoVO"])!),
        profitAndLossRespDto: jsonRes["profitAndLossRespDto"] == null
            ? ProfitAndLossRespDto.fromJson({})
            : ProfitAndLossRespDto.fromJson(asT<Map<String, dynamic>>(
                "profitAndLossRespDto", jsonRes["profitAndLossRespDto"])!),
        userAccountBalanceRespDto: jsonRes["userAccountBalanceRespDto"] == null
            ? UserAccountBalanceRespDto.fromJson({})
            : UserAccountBalanceRespDto.fromJson(asT<Map<String, dynamic>>(
                "userAccountBalanceRespDto",
                jsonRes["userAccountBalanceRespDto"])!),
        vipInfoVO: jsonRes["vipInfoVO"] == null
            ? MemberMemberInfoAllPostRespModelVipInfoVO.fromJson({})
            : MemberMemberInfoAllPostRespModelVipInfoVO.fromJson(
                asT<Map<String, dynamic>>("vipInfoVO", jsonRes["vipInfoVO"])!),
      );

  String agentCustomerUrl = '';
  String memberCustomerUrl = '';
  MemberMemberInfoAllPostRespModelMemberInfoVO memberInfoVO;
  ProfitAndLossRespDto profitAndLossRespDto;
  UserAccountBalanceRespDto userAccountBalanceRespDto;
  MemberMemberInfoAllPostRespModelVipInfoVO vipInfoVO;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'agentCustomerUrl': agentCustomerUrl,
        'memberCustomerUrl': memberCustomerUrl,
        'memberInfoVO': memberInfoVO,
        'profitAndLossRespDto': profitAndLossRespDto,
        'userAccountBalanceRespDto': userAccountBalanceRespDto,
        'vipInfoVO': vipInfoVO,
      };
}

class MemberMemberInfoAllPostRespModelMemberInfoVO {
  MemberMemberInfoAllPostRespModelMemberInfoVO({
    required this.accountStatus,
    required this.accountType,
    required this.applyInfo,
    required this.applyName,
    required this.birth,
    required this.birthDay,
    required this.bounsTimestamp,
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
    required this.unacclaimBounsTotal,
    required this.unreadMessageTotal,
    required this.updateDt,
    required this.userName,
    required this.vipExperienceVal,
    required this.vipId,
    required this.vipSerialNum,
    required this.windControlId,
    required this.windControlName,
  });

  factory MemberMemberInfoAllPostRespModelMemberInfoVO.fromJson(Map<String, dynamic> jsonRes) => MemberMemberInfoAllPostRespModelMemberInfoVO(
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
        birthDay: jsonRes['birthDay'] == null
            ? 0
            : asT<int>("birthDay", jsonRes['birthDay'])!,
        bounsTimestamp: jsonRes['bounsTimestamp'] == null
            ? ''
            : asT<String>("bounsTimestamp", jsonRes['bounsTimestamp'])!,
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
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        mobile: jsonRes['mobile'] == null
            ? ''
            : asT<String>("mobile", jsonRes['mobile'])!,
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
        unacclaimBounsTotal: jsonRes['unacclaimBounsTotal'] == null
            ? 0
            : asT<int>("unacclaimBounsTotal", jsonRes['unacclaimBounsTotal'])!,
        unreadMessageTotal: jsonRes['unreadMessageTotal'] == null
            ? 0
            : asT<int>("unreadMessageTotal", jsonRes['unreadMessageTotal'])!,
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
  int birthDay = 0;
  String bounsTimestamp = '';
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
  int merchantId = 0;
  String mobile = '';
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
  int unacclaimBounsTotal = 0;
  int unreadMessageTotal = 0;
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
        'birthDay': birthDay,
        'bounsTimestamp': bounsTimestamp,
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
        'unacclaimBounsTotal': unacclaimBounsTotal,
        'unreadMessageTotal': unreadMessageTotal,
        'updateDt': updateDt,
        'userName': userName,
        'vipExperienceVal': vipExperienceVal,
        'vipId': vipId,
        'vipSerialNum': vipSerialNum,
        'windControlId': windControlId,
        'windControlName': windControlName,
      };
}

class ProfitAndLossRespDto {
  ProfitAndLossRespDto({
    required this.todayProfit,
  });

  factory ProfitAndLossRespDto.fromJson(Map<String, dynamic> jsonRes) =>
      ProfitAndLossRespDto(
        todayProfit: jsonRes['todayProfit'] == null
            ? 0.0
            : asT<double>("todayProfit", jsonRes['todayProfit'])!,
      );

  double todayProfit = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'todayProfit': todayProfit,
      };
}

class UserAccountBalanceRespDto {
  UserAccountBalanceRespDto({
    required this.centerBalance,
    required this.gameBalance,
    required this.lockBalance,
    required this.totalBalance,
  });

  factory UserAccountBalanceRespDto.fromJson(Map<String, dynamic> jsonRes) {
    final List<MemberMemberInfoAllPostRespModelGameBalance>? gameBalance =
        jsonRes['gameBalance'] is List ? <MemberMemberInfoAllPostRespModelGameBalance>[] : null;
    if (gameBalance != null) {
      for (final dynamic item in jsonRes['gameBalance']!) {
        if (item != null) {
          gameBalance.add(MemberMemberInfoAllPostRespModelGameBalance.fromJson(
              asT<Map<String, dynamic>>("gameBalance", item)!));
        }
      }
    }
    return UserAccountBalanceRespDto(
      centerBalance: jsonRes['centerBalance'] == null
          ? 0.0
          : asT<double>("centerBalance", jsonRes['centerBalance'])!,
      gameBalance: gameBalance == null ? [] : gameBalance,
      lockBalance: jsonRes['lockBalance'] == null
          ? 0.0
          : asT<double>("lockBalance", jsonRes['lockBalance'])!,
      totalBalance: jsonRes['totalBalance'] == null
          ? 0.0
          : asT<double>("totalBalance", jsonRes['totalBalance'])!,
    );
  }

  double centerBalance = 0.0;
  List<MemberMemberInfoAllPostRespModelGameBalance> gameBalance;
  double lockBalance = 0.0;
  double totalBalance = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'centerBalance': centerBalance,
        'gameBalance': gameBalance,
        'lockBalance': lockBalance,
        'totalBalance': totalBalance,
      };
}

class MemberMemberInfoAllPostRespModelGameBalance {
  MemberMemberInfoAllPostRespModelGameBalance({
    required this.balance,
    required this.gameCode,
    required this.status,
    required this.walletName,
    required this.remainBilling,
  });

  factory MemberMemberInfoAllPostRespModelGameBalance.fromJson(Map<String, dynamic> jsonRes) => MemberMemberInfoAllPostRespModelGameBalance(
    balance: jsonRes['balance'] == null
        ? 0.0
        : asT<double>("balance", jsonRes['balance'])!,
    remainBilling: jsonRes['remainBilling'] == null
        ? 0.0
        : asT<double>("remainBilling", jsonRes['remainBilling'])!,
    gameCode: jsonRes['gameCode'] == null
        ? ''
        : asT<String>("gameCode", jsonRes['gameCode'])!,
    status: jsonRes['status'] == null
        ? 0
        : asT<int>("status", jsonRes['status'])!,
    walletName: jsonRes['walletName'] == null
        ? ''
        : asT<String>("walletName", jsonRes['walletName'])!,
  );

  double balance = 0.0;
  double remainBilling = 0.0;
  String gameCode = '';
  int status = 0;
  String walletName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'balance': balance,
    'gameCode': gameCode,
    'status': status,
    'walletName': walletName,
    'remainBilling': remainBilling,
  };
}

class MemberMemberInfoAllPostRespModelVipInfoVO {
  MemberMemberInfoAllPostRespModelVipInfoVO({
    required this.bjValidBetsCurr,
    required this.bjValidBetsLave,
    required this.bjValidBetsTotal,
    required this.depositAmountCurr,
    required this.depositAmountLave,
    required this.depositAmountTotal,
    required this.experience,
    required this.grade,
    required this.validBetsCurr,
    required this.validBetsLave,
    required this.validBetsTotal,
    required this.vipGradeId,
  });

  factory MemberMemberInfoAllPostRespModelVipInfoVO.fromJson(Map<String, dynamic> jsonRes) => MemberMemberInfoAllPostRespModelVipInfoVO(
        bjValidBetsCurr: jsonRes['bjValidBetsCurr'] == null
            ? 0.0
            : asT<double>("bjValidBetsCurr", jsonRes['bjValidBetsCurr'])!,
        bjValidBetsLave: jsonRes['bjValidBetsLave'] == null
            ? 0.0
            : asT<double>("bjValidBetsLave", jsonRes['bjValidBetsLave'])!,
        bjValidBetsTotal: jsonRes['bjValidBetsTotal'] == null
            ? 0
            : asT<int>("bjValidBetsTotal", jsonRes['bjValidBetsTotal'])!,
        depositAmountCurr: jsonRes['depositAmountCurr'] == null
            ? 0.0
            : asT<double>("depositAmountCurr", jsonRes['depositAmountCurr'])!,
        depositAmountLave: jsonRes['depositAmountLave'] == null
            ? 0.0
            : asT<double>("depositAmountLave", jsonRes['depositAmountLave'])!,
        depositAmountTotal: jsonRes['depositAmountTotal'] == null
            ? 0
            : asT<int>("depositAmountTotal", jsonRes['depositAmountTotal'])!,
        experience: jsonRes['experience'] == null
            ? ''
            : asT<String>("experience", jsonRes['experience'])!,
        grade: jsonRes['grade'] == null
            ? ''
            : asT<String>("grade", jsonRes['grade'])!,
        validBetsCurr: jsonRes['validBetsCurr'] == null
            ? 0.0
            : asT<double>("validBetsCurr", jsonRes['validBetsCurr'])!,
        validBetsLave: jsonRes['validBetsLave'] == null
            ? 0.0
            : asT<double>("validBetsLave", jsonRes['validBetsLave'])!,
        validBetsTotal: jsonRes['validBetsTotal'] == null
            ? 0
            : asT<int>("validBetsTotal", jsonRes['validBetsTotal'])!,
        vipGradeId: jsonRes['vipGradeId'] == null
            ? ''
            : asT<String>("vipGradeId", jsonRes['vipGradeId'])!,
      );

  double bjValidBetsCurr = 0.0;
  double bjValidBetsLave = 0.0;
  int bjValidBetsTotal = 0;
  double depositAmountCurr = 0.0;
  double depositAmountLave = 0.0;
  int depositAmountTotal = 0;
  String experience = '';
  String grade = '';
  double validBetsCurr = 0.0;
  double validBetsLave = 0.0;
  int validBetsTotal = 0;
  String vipGradeId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bjValidBetsCurr': bjValidBetsCurr,
        'bjValidBetsLave': bjValidBetsLave,
        'bjValidBetsTotal': bjValidBetsTotal,
        'depositAmountCurr': depositAmountCurr,
        'depositAmountLave': depositAmountLave,
        'depositAmountTotal': depositAmountTotal,
        'experience': experience,
        'grade': grade,
        'validBetsCurr': validBetsCurr,
        'validBetsLave': validBetsLave,
        'validBetsTotal': validBetsTotal,
        'vipGradeId': vipGradeId,
      };
}

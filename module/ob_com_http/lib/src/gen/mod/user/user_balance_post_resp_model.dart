import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBalancePostRespModel {
  UserBalancePostRespModel({
    required this.centerBalance,
    required this.gameBalance,
    required this.lockBalance,
    required this.totalBalance,
  });

  factory UserBalancePostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<UserBalancePostRespModelGameBalance>? gameBalance =
        jsonRes['gameBalance'] is List
            ? <UserBalancePostRespModelGameBalance>[]
            : null;
    if (gameBalance != null) {
      for (final dynamic item in jsonRes['gameBalance']!) {
        if (item != null) {
          gameBalance.add(UserBalancePostRespModelGameBalance.fromJson(
              asT<Map<String, dynamic>>("gameBalance", item)!));
        }
      }
    }
    return UserBalancePostRespModel(
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
  List<UserBalancePostRespModelGameBalance> gameBalance;
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

class UserBalancePostRespModelGameBalance {
  UserBalancePostRespModelGameBalance({
    required this.balance,
    required this.gameCode,
    required this.status,
    required this.walletName,
    required this.remainBilling,
    required this.venueIconUrlApp,
    required this.venueWalletIconUrl,
    required this.venueIconUrlPc,
    required this.venueType,
    required this.venueTypeName,
  });

  factory UserBalancePostRespModelGameBalance.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserBalancePostRespModelGameBalance(
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
        venueIconUrlApp: jsonRes['venueIconUrlApp'] == null
            ? ''
            : asT<String>("venueIconUrlApp", jsonRes['venueIconUrlApp'])!,
        venueWalletIconUrl: jsonRes['venueWalletIconUrl'] == null
            ? ''
            : asT<String>("venueWalletIconUrl", jsonRes['venueWalletIconUrl'])!,
        venueIconUrlPc: jsonRes['venueIconUrlPc'] == null
            ? ''
            : asT<String>("venueIconUrlPc", jsonRes['venueIconUrlPc'])!,
        venueType: jsonRes['venueType'] == null
            ? ''
            : asT<String>("venueType", jsonRes['venueType'])!,
        venueTypeName: jsonRes['venueTypeName'] == null
            ? ''
            : asT<String>("venueTypeName", jsonRes['venueTypeName'])!,
      );

  double balance = 0.0;
  double remainBilling = 0.0;
  String gameCode = '';
  int status = 0;
  String walletName = '';
  String venueIconUrlApp = '';
  String venueWalletIconUrl = '';
  String venueIconUrlPc = '';
  String venueType = '';
  String venueTypeName = '';

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
        'venueIconUrlApp': venueIconUrlApp,
        'venueWalletIconUrl': venueWalletIconUrl,
        'venueIconUrlPc': venueIconUrlPc,
        'venueType': venueType,
        'venueTypeName': venueTypeName,
      };
}

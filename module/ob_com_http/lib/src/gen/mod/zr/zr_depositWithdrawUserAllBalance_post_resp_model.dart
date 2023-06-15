import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ZrDepositWithdrawUserAllBalancePostRespModel {
  ZrDepositWithdrawUserAllBalancePostRespModel({
    required this.centerBalance,
    required this.gameBalance,
    required this.lockBalance,
    required this.totalBalance,
  });

  factory ZrDepositWithdrawUserAllBalancePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ZrDepositWithdrawUserAllBalancePostRespModelGameBalance>? gameBalance =
        jsonRes['gameBalance'] is List ? <ZrDepositWithdrawUserAllBalancePostRespModelGameBalance>[] : null;
    if (gameBalance != null) {
      for (final dynamic item in jsonRes['gameBalance']!) {
        if (item != null) {
          gameBalance.add(ZrDepositWithdrawUserAllBalancePostRespModelGameBalance.fromJson(
              asT<Map<String, dynamic>>("gameBalance", item)!));
        }
      }
    }
    return ZrDepositWithdrawUserAllBalancePostRespModel(
      centerBalance: jsonRes['centerBalance'] == null
          ? 0
          : asT<int>("centerBalance", jsonRes['centerBalance'])!,
      gameBalance: gameBalance == null ? [] : gameBalance,
      lockBalance: jsonRes['lockBalance'] == null
          ? 0
          : asT<int>("lockBalance", jsonRes['lockBalance'])!,
      totalBalance: jsonRes['totalBalance'] == null
          ? 0
          : asT<int>("totalBalance", jsonRes['totalBalance'])!,
    );
  }

  int centerBalance = 0;
  List<ZrDepositWithdrawUserAllBalancePostRespModelGameBalance> gameBalance;
  int lockBalance = 0;
  int totalBalance = 0;

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

class ZrDepositWithdrawUserAllBalancePostRespModelGameBalance {
  ZrDepositWithdrawUserAllBalancePostRespModelGameBalance({
    required this.balance,
    required this.gameCode,
    required this.status,
    required this.walletName,
  });

  factory ZrDepositWithdrawUserAllBalancePostRespModelGameBalance.fromJson(Map<String, dynamic> jsonRes) => ZrDepositWithdrawUserAllBalancePostRespModelGameBalance(
        balance: jsonRes['balance'] == null
            ? 0
            : asT<int>("balance", jsonRes['balance'])!,
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

  int balance = 0;
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
      };
}

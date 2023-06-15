import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccountMoneyGameOnePostRespModel {
  AccountMoneyGameOnePostRespModel({
    required this.data,
  });

  factory AccountMoneyGameOnePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<AccountMoneyGameOnePostRespModelData>? data = jsonRes['data'] is List ? <AccountMoneyGameOnePostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(AccountMoneyGameOnePostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return AccountMoneyGameOnePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<AccountMoneyGameOnePostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class AccountMoneyGameOnePostRespModelData {
  AccountMoneyGameOnePostRespModelData({
    required this.balance,
    required this.gameCode,
    required this.gameId,
    required this.gameName,
    required this.playName,
  });

  factory AccountMoneyGameOnePostRespModelData.fromJson(Map<String, dynamic> jsonRes) => AccountMoneyGameOnePostRespModelData(
        balance: jsonRes['balance'] == null
            ? 0.0
            : asT<double>("balance", jsonRes['balance'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameId: jsonRes['gameId'] == null
            ? ''
            : asT<String>("gameId", jsonRes['gameId'])!,
        gameName: jsonRes['gameName'] == null
            ? ''
            : asT<String>("gameName", jsonRes['gameName'])!,
        playName: jsonRes['playName'] == null
            ? ''
            : asT<String>("playName", jsonRes['playName'])!,
      );

  double balance = 0.0;
  String gameCode = '';
  String gameId = '';
  String gameName = '';
  String playName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'balance': balance,
        'gameCode': gameCode,
        'gameId': gameId,
        'gameName': gameName,
        'playName': playName,
      };
}

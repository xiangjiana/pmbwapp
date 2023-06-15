import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserAccountBalanceWithBilling {
  UserAccountBalanceWithBilling({
    required this.centerBalance,
    required gameBalance,
    required this.lockBalance,
    required this.totalBalance,
  }){
    this.gameBalance = List.castFrom(gameBalance); 
  }

  final num centerBalance;
  late List<GameBalance> gameBalance;
  final num lockBalance;
  final num totalBalance;
}

@jsonSerializable
class GameBalance {
  GameBalance({
    required this.balance,
    required this.gameCode,
    required this.remainBilling,
    required this.status,
    required this.venueIconUrlApp,
    required this.venueIconUrlPc,
    required this.venueWalletIconUrl,
    required this.venueType,
    required this.venueTypeName,
    required this.walletName,
    required this.venueName,
  });

  final num balance;
  final String gameCode;
  final num remainBilling;
  final int status;
  final String venueIconUrlApp;
  final String venueIconUrlPc;
  final String venueWalletIconUrl;
  final String venueType;
  final String venueTypeName;
  final String walletName;
  final String venueName;
}

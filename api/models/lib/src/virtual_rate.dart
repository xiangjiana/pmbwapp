import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VirtualRate {
  VirtualRate({
    required this.bwCurrencyEnum,
    required this.memberDepositRate,
    required this.memberWithdrawRate,
    required this.proxyDepositRate,
    required this.proxyWithdrawRate,
  });

  final Map bwCurrencyEnum;
  final num memberDepositRate;
  final num memberWithdrawRate;
  final num proxyDepositRate;
  final num proxyWithdrawRate;
}

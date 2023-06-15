import 'package:dart_json_mapper/dart_json_mapper.dart';

import '../models.dart';

@jsonSerializable
class PaymentChannelConfig {
  PaymentChannelConfig({
    required this.bankList,
    required this.channelName,
    required this.discountScale,
    required this.fastAmount,
    required this.id,
    required this.maxAmount,
    required this.maxQuota,
    required this.minAmount,
    required this.needFlag,
    required this.payName,
    required this.payType,
    required this.paymentChannelName,
    required this.paymentChannelType,
    required this.virtualProtocol,
  });

  final List<BankNameResp> bankList;
  final String channelName;
  final num discountScale;
  final List<num> fastAmount;
  final String id;
  final num maxAmount;
  final num maxQuota;
  final num minAmount;
  final int needFlag;
  final String payName;
  final int payType;
  final String paymentChannelName;
  final int paymentChannelType;
  final String virtualProtocol;
}

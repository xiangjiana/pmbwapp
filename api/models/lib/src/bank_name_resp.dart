import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BankNameResp {
  BankNameResp({
    required this.bankLogo,
    required this.bankName,
    required this.currency,
    required this.id,
    required this.merchantId,
  });

  final String bankLogo;
  final String bankName;
  final String currency;
  final String id;
  final String merchantId;

  factory BankNameResp.fromJson(Map<String, dynamic> jsonRes) => BankNameResp(
        bankLogo: jsonRes['bankLogo'] ?? '',
        bankName: jsonRes['bankName'] ?? '',
        currency: jsonRes['currency'] ?? '',
        id: jsonRes['id'] ?? '',
        merchantId: jsonRes['merchantId'] ?? '',
      );

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankLogo': bankLogo,
        'bankName': bankName,
        'currency': currency,
        'id': id,
        'merchantId': merchantId,
      };
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CreateBankParam {
  CreateBankParam({
    this.accountType,
    this.bankAddress,
    this.bankCode,
    required this.bankName,
    required this.cardNumber,
    required this.cardholderName,
    this.city,
    this.province,
    required this.bankId,
  });

  final String? accountType;
  final String? bankAddress;
  final String? bankCode;
  final String bankName;
  final String cardNumber;
  final String cardholderName;
  final String? city;
  final String? province;
  final int bankId;
}

import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Venue {
  Venue({
    required this.currencyTypes,
    required this.isOb,
    required this.languageTypes,
    required this.status,
    required this.venueCode,
    required this.venueCodeNumber,
    required this.venueIconUrlApp,
    required this.venueIconUrlPc,
    required this.venueName,
    required this.venueTransferIconUrlApp,
    required this.venueTransferIconUrlPc,
    required this.venueType,
    required this.venueTypeName,
    required this.walletNames,
  });
  final String currencyTypes;
  final num isOb;
  final String languageTypes;
  final num status;
  final String venueCode;
  final num venueCodeNumber;
  final String venueIconUrlApp;
  final String venueIconUrlPc;
  final String venueName;
  final String venueTransferIconUrlApp;
  final String venueTransferIconUrlPc;
  final String venueType;
  final String venueTypeName;
  final String walletNames;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueCode': venueCode,
        'venueCodeNumber': venueCodeNumber,
        'venueName': venueName,
        'venueType': venueType,
        'venueTypeName': venueTypeName,
        'isOb': isOb,
        'status': status,
        'currencyTypes': currencyTypes,
        'languageTypes': languageTypes,
        'venueIconUrlApp': venueIconUrlApp,
        'venueIconUrlPc': venueIconUrlPc,
        'venueTransferIconUrlApp': venueTransferIconUrlApp,
        'venueTransferIconUrlPc': venueTransferIconUrlPc,
        'walletNames': walletNames,
      };
}

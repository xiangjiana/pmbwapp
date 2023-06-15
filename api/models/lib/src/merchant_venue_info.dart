import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MerchantVenueInfo {
  MerchantVenueInfo({
    required this.id,
    required this.merchantCode,
    required this.merchantName,
    required this.venueCode,
    required this.venueConfig,
    required this.venueCurrency,
    required this.venueFeeRate,
    required this.venueLanguages,
    required this.venueName,
  });

  final int id;
  final String merchantCode;
  final String merchantName;
  final String venueCode;
  final String venueConfig;
  final String venueCurrency;
  final double venueFeeRate;
  final String venueLanguages;
  final String venueName;
}

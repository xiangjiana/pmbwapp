import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Metas {
  Metas({
    required this.betAmount,
    required this.count,
    required this.netAmount,
    required this.venueCode,
    required this.venueIconUrlApp,
    required this.venueIconUrlPc,
    required this.venueName,
  });

  final num betAmount;
  final String count;
  final num netAmount;
  final String venueCode;
  final String venueIconUrlApp;
  final String venueIconUrlPc;
  final String venueName;
}
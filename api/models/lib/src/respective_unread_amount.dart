import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RespectiveUnReadAmount {
  RespectiveUnReadAmount({
    required this.activityUnReadAmount,
    required this.announceUnReadAmount,
    required this.bonusUnReadAmount,
    required this.noticeUnReadAmount,
  });

  final int activityUnReadAmount;
  final int announceUnReadAmount;
  final int bonusUnReadAmount;
  final int noticeUnReadAmount;

  factory RespectiveUnReadAmount.fromJson(Map<String, dynamic> jsonRes) =>
      RespectiveUnReadAmount(
        activityUnReadAmount: jsonRes['activityUnReadAmount'] ?? 0,
        announceUnReadAmount: jsonRes['announceUnReadAmount'] ?? 0,
        bonusUnReadAmount: jsonRes['bonusUnReadAmount'] ?? 0,
        noticeUnReadAmount: jsonRes['noticeUnReadAmount'] ?? 0,
      );
}

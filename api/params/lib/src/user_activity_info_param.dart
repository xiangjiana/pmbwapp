import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserActivityInfoParam {
  UserActivityInfoParam({
    this.gameCode,
    required this.vipSerialNum,
  });

  final String? gameCode;
  final int vipSerialNum;
}

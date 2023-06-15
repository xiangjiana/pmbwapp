import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class LoginGameParam {
  LoginGameParam({
    this.backUrl,
    required this.gameCode,
    this.gameId,
  });

  final String? backUrl;
  final String gameCode;
  final int? gameId;
}

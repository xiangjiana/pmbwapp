import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GameLogin {
  GameLogin({
    required this.domain,
    required this.token,
    required this.type,
    required this.url,
  });

  final String domain;
  final String token;
  final int type;
  final String url;
}

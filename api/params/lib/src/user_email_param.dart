import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserEmailParam {
  UserEmailParam({
    required this.email,
    required this.v,
  });

  final String email;
  final String v;
}

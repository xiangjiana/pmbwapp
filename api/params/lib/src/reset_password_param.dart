import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ResetPasswordParam {
  ResetPasswordParam({
    required this.confirmPassWord,
    required this.passWord,
    required this.username,
  });

  final String confirmPassWord;
  final String passWord;
  final String username;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SetNewPasswordParam {
  SetNewPasswordParam({
    required this.newPassword,
    required this.oldPassword,
    required this.userName,
  });

  final String newPassword;
  final String oldPassword;
  final String userName;
}

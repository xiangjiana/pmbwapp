import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class EditPasswordParam {
  EditPasswordParam({
    required this.confirmPassword,
    required this.newPassword,
    required this.password,
  });

  final String confirmPassword;
  final String newPassword;
  final String password;
}

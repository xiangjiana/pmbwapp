import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class LoginParam {
  LoginParam({
    required this.deviceNo,
    required this.loginReference,
    required this.userName,
    required this.userPwd,
  });

  final String deviceNo;
  final String loginReference;
  final String userName;
  final String userPwd;
}

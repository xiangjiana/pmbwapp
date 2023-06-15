import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RegisterParam {
  RegisterParam({
    required this.deviceNo,
    required this.invitationCode,
    this.thirdPlatformId,
    this.thirdType,
    required this.userName,
    required this.userPwd,
  });

  final String deviceNo;
  final String invitationCode;
  final String? thirdPlatformId;
  final String? thirdType;
  final String userName;
  final String userPwd;
}

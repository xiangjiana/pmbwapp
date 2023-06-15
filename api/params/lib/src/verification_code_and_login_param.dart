import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VerificationCodeAndLoginParam {
  VerificationCodeAndLoginParam({
    required this.appType,
    required this.appVersion,
    required this.deviceNo,
    required this.loginReference,
    required this.sendType,
    required this.userName,
    required this.verifica,
  });

  final String appType;
  final String appVersion;
  final String deviceNo;
  final String loginReference;
  final int sendType;
  final String userName;
  final String verifica;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VerificationCodeParam {
  VerificationCodeParam({
    this.emailAddr,
    required this.sendType,
    this.telephoneNum,
    required this.userName,
    required this.verifica,
  });

  final String? emailAddr;
  final int sendType;
  final String? telephoneNum;
  final String userName;
  final String verifica;
}

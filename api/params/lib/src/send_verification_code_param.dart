import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SendVerificationCodeParam {
  SendVerificationCodeParam({
    this.emailAddr,
    required this.findType,
    this.telephoneNum,
    required this.username,
  });

  String? emailAddr;
  final int findType;
  String? telephoneNum;
  final String username;
}

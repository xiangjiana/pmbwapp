import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RecoverPasswordParam {
  RecoverPasswordParam({
    this.emailAddr,
    required this.findType,
    this.telephoneNum,
    required this.username,
  });

  final String? emailAddr;
  final int findType;
  final String? telephoneNum;
  final String username;
}

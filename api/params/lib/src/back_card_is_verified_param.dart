import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BackCardIsVerifiedParam {
  BackCardIsVerifiedParam({
    required this.verificationCode,
  });

  final String verificationCode;
}

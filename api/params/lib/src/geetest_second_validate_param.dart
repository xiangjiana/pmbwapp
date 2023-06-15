import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GeetestSecondValidateParam {
  GeetestSecondValidateParam({
    required this.challenge,
    required this.seccode,
    required this.validate,
  });

  final String challenge;
  final String seccode;
  final String validate;
}

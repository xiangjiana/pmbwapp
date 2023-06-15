import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class PhoneParam {
  PhoneParam({
    required this.phone,
  });

  final String phone;
}

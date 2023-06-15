import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserPhoneParam {
  UserPhoneParam({
    required this.phone,
    required this.v,
  });

  final String phone;
  final String v;
}

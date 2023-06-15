import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserInfoParam {
  UserInfoParam({
    required this.birthday,
    required this.gender,
    required this.realName,
  });

  final String birthday;
  final String gender;
  final String realName;
}

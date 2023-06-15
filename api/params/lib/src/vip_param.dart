import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VipParam {
  VipParam({
    required this.username,
  });

  final String? username;
}

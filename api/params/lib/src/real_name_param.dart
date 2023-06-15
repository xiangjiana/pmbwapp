import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RealNameParam {
  RealNameParam({
    required this.realName,
  });

  final String realName;
}

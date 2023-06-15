import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AppVersionConfigParam {
  AppVersionConfigParam({
    required this.clientType,
    required this.subType,
  });

  final int clientType;
  final int subType;
}

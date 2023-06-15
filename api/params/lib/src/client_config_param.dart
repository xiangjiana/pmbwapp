import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ClientConfigParam {
  ClientConfigParam({
    required this.resourcesType,
  });

  final String resourcesType;
}

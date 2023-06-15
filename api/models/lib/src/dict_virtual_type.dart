import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DictVirtualType {
  DictVirtualType({
    required this.virtualProtocolType,
    required this.virtualType,
  });

  final List<VirtualProtocolType> virtualProtocolType;
  final List<VirtualType> virtualType;
}

@jsonSerializable
class VirtualType {
  VirtualType({
    required this.code,
    required this.description,
  });

  final String code;
  final String description;
}

@jsonSerializable
class VirtualProtocolType {
  VirtualProtocolType({
    required this.code,
    required this.description,
  });

  final String code;
  final String description;
}

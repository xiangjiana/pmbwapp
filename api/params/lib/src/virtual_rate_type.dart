import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VirtualRateType {
  VirtualRateType({
    required this.virtualRateType,
  });

  final int virtualRateType;
}

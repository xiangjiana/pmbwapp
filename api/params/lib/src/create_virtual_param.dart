import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class CreateVirtualParam {
  CreateVirtualParam({
    this.realName,
    required this.virtualAddress,
    required this.virtualKind,
    required this.virtualProtocol,
  });

  final String? realName;
  final String virtualAddress;
  final String virtualKind;
  final String virtualProtocol;
}

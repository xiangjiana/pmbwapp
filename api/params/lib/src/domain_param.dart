import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DomainParam {

  DomainParam({
    required this.bigType,
    required this.number,
  });

  final int bigType;
  final num number;
}

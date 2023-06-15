import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class KvConfig {
  KvConfig({
    required this.appId,
    required this.description,
    required this.id,
    required this.k,
    required this.module,
    required this.tag,
    required this.v,
    required this.valueType,
  });

  final int appId;
  final String description;
  final int id;
  final String k;
  final String module;
  final String tag;
  final String v;
  final String valueType;
}

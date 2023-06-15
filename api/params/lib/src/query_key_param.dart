import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class QueryKeyParam {
  QueryKeyParam({
    required this.key,
  });

  final String key;
}
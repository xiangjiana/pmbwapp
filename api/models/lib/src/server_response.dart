import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ServerResponse<T> {
  final String code;
  final String msg;
  final T? data;

  ServerResponse({required this.code,required this.msg, required this.data});

  ServerResponse<T>? fromJson(dynamic json) =>
      JsonMapper.deserialize<ServerResponse<T>>(json);

  dynamic toJson() => JsonMapper.serialize(this);
}
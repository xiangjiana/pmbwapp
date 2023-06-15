import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BaseRes {
  final String code;
  final String msg;
  final dynamic data;

  const BaseRes({
    required this.code,
    required this.msg,
    required this.data,
  });
}

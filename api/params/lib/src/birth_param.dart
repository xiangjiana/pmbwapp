import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BirthParam {
  BirthParam({
    required this.birth,
  });

  final String birth;
}

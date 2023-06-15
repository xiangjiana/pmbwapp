import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class Language {
  Language({
    required this.langCode,
    required this.langName,
  });

  final String langCode;
  final String langName;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ListBankParam {
  ListBankParam({
    required this.dataType,
  });

  final String dataType;
}

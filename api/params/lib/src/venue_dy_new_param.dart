import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VenueDyNewParam {
  VenueDyNewParam({
    required this.venueCode,
  });

  final String venueCode;
}

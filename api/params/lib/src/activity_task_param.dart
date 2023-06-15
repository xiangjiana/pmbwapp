import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ActivityTaskParam {
  ActivityTaskParam({
    required this.gameCode,
  });

  final String gameCode;
}

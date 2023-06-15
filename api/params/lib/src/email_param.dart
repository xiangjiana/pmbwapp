import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class EmailParam {
  EmailParam({
    required this.userEmail,
  });

  final String userEmail;
}

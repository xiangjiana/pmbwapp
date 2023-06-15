import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MessageReadParam {
  MessageReadParam({
    required this.messageIds,
    required this.messageType,
  });

  List<String> messageIds;
  int messageType;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MessageDeleteParam {
  MessageDeleteParam({
    required this.messageIds,
  });

  final List<int> messageIds;
}

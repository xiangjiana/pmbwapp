import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ReceiveDisCountParam {
  ReceiveDisCountParam({
    required this.receiveDisCountListReqDTOList,
  });

  final List<String> receiveDisCountListReqDTOList;
}

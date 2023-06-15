import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SetTransferInfoParam {
  SetTransferInfoParam({
    required this.noTransfer,
  });

  final int noTransfer;
}

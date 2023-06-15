import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SelectDepositParam {
  SelectDepositParam({
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.pageNum,
    required this.pageSize,
    this.orderStatus,
  });

  final String createdAtEnd;
  final String createdAtStart;
  final String? orderStatus;
  final int pageNum;
  final int pageSize;
}

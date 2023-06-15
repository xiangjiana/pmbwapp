import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SelectWithdrawalParam {
  SelectWithdrawalParam({
    this.bizType,
    this.clientStatus,
    this.withdrawType,
    required this.createdAtEnd,
    required this.createdAtStart,
    required this.pageNum,
    required this.pageSize,

  });

  final String? bizType;
  final String? clientStatus;
  final String? withdrawType;
  final String createdAtEnd;
  final String createdAtStart;
  final int pageNum;
  final int pageSize;
}

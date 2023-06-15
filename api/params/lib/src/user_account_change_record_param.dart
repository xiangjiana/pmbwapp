import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class UserAccountChangeRecordParam {
  UserAccountChangeRecordParam({
    this.clientType,
    required this.occurDtEnd,
    required this.occurDtStart,
    required this.pageNum,
    required this.pageSize,
  });

  final String? clientType;
  final String occurDtEnd;
  final String occurDtStart;
  final int pageNum;
  final int pageSize;
}

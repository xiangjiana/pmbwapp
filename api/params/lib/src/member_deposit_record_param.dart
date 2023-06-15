import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MemberDepositRecordParam {
  MemberDepositRecordParam({
    required this.endTime,
    required this.pageNum,
    required this.pageSize,
    required this.startTime,
    required this.userName,
  });

  final String endTime;
  final int pageNum;
  final int pageSize;
  final String startTime;
  final String userName;
}

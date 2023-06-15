import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class NoticeListParam {
  NoticeListParam({
    required this.pageNum,
    required this.pageSize,
    required this.type,
  });

  final int pageNum;
  final int pageSize;
  final String type;
}

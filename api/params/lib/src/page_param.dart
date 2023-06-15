import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class PageParam {
  PageParam({
    required this.pageNum,
    required this.pageSize,
  });

  final int pageNum;
  final int pageSize;
}

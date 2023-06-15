
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class MyCollectionParam{
  MyCollectionParam({
    required this.gameId,
    required this.pageNum,
    required this.pageSize,
  });
  int gameId;
  int pageNum;
  int pageSize;
}
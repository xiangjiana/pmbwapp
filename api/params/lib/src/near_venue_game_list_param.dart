
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class NearVenueGameListParam{
  NearVenueGameListParam({
    required this.nearFlag,
    required this.pageNum,
    required this.pageSize,
  });
  int nearFlag;
  int pageNum;
  int pageSize;
}
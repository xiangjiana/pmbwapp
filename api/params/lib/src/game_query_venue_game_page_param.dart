import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class GameQueryVenueGamePageParam {
  GameQueryVenueGamePageParam({
    required this.childVenueCode,
    required this.orderType,
    required this.pageNum,
    this.pageSize=28,
    required this.venueCode,
  });

  final String childVenueCode;//场馆Code,zr,ty,by
  final int orderType;//排序类型(1–A-Z , 2–Z-A , 3–推荐 , 4–热门)
  final int pageNum;
  final int pageSize;
  final String venueCode;//场馆Code,zr,ty,by
}

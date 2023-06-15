import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class RecommendVenueGameListParam {



  final int pageNum;

  final int pageSize;

  // @JsonKey(name: 'venueCode')
  // String venueCode;

  RecommendVenueGameListParam({required this.pageNum,required this.pageSize,});


}



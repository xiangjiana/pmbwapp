import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class VenueDyPcParam {
  VenueDyPcParam({
    required this.venueCode,
    required this.oderKey,
    required this.pageNum,
    required this.pageSize,
    required this.orderBy,
    required this.venueTypeCode,
  });

  final String venueCode;
  final int oderKey;
  final int pageNum;
  final int pageSize;
  final String orderBy;
  final String venueTypeCode;
}
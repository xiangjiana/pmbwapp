import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DiscountActivityParam {
  DiscountActivityParam({
    required this.deviceType,
    this.discountTagId,
  });

  final int deviceType;
  String? discountTagId;
}

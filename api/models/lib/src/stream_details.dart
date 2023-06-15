import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class StreamDetails {
  StreamDetails({
    required this.activityName,
    required this.billAmount,
    required this.completeBillAmount,
    required this.lowActivityAmount,
    this.percentage,
  });

  final String activityName;
  final num billAmount;
  final num completeBillAmount;
  final num lowActivityAmount;
  final num? percentage;
}

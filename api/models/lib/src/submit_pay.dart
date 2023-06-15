import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class SubmitPay {
  SubmitPay({
    required this.eventId,
    required this.frontLoadFlag,
    required this.response,
    required this.thirdPayId,
  });

  final String eventId;
  final int frontLoadFlag;
  final String response;
  final String thirdPayId;
}

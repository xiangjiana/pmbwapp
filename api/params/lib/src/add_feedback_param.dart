import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class AddFeedbackParam {
  AddFeedbackParam({
    required this.deviceNo,
    required this.deviceType,
    required this.deviceTypeInfo,
    required this.problemDescribe,
    required this.problemType,
    required this.url,
  });

  final String deviceNo;
  final int deviceType;
  final String deviceTypeInfo;
  final String problemDescribe;
  final int problemType;
  final String url;
}

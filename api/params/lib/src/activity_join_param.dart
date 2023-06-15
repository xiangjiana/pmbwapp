import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ActivityJoinParam {
  ActivityJoinParam({
      required this.activityId,
      required this.deviceNo,
      required this.deviceType,});


  final int activityId;
  final String deviceNo;
  final int deviceType;



}
import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class ThirdPartyLoginSdkParam {
  ThirdPartyLoginSdkParam({
    required this.deviceNo,
    required this.thirdPlatformId,
    required this.thirdType,
  });

  final String deviceNo;
  final String thirdPlatformId;
  final String thirdType;
}

import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/src/Login_resp.dart';

@jsonSerializable
class ThirdPlatformMember {
  ThirdPlatformMember({
    required this.flag,
    required this.memberVO,
    required this.thirdPlatformId,
  });

  final bool flag;
  final LoginResp memberVO;
  @JsonProperty(name: 'thridPlatformId')
  final String thirdPlatformId;
}

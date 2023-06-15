import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:models/src/member_info_resp.dart';

@jsonSerializable
class LoginResp {
  LoginResp({
    required this.memberInfo,
    required this.token,
  });

  MemberInfoResp memberInfo;
  String token;
}

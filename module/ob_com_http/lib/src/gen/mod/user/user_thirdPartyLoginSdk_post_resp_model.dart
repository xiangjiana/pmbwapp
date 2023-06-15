// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }
import 'dart:convert';

import 'package:ob_com_http/src/gen/mod/user/user_login_post_resp_model.dart';
import 'package:ob_com_http/src/utils/as_t.dart';

class UserThirdPartyLoginSdkPostReqModel {
  UserThirdPartyLoginSdkPostReqModel({
    required this.flag,
    required this.thridPlatformId,
    required this.memberVO,
  });

  factory UserThirdPartyLoginSdkPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserThirdPartyLoginSdkPostReqModel(
        flag: jsonRes['flag'] == null
            ? false
            : asT<bool>("flag", jsonRes['flag'])!,
        thridPlatformId: jsonRes['thridPlatformId'] == null
            ? ''
            : asT<String>("thridPlatformId", jsonRes['thridPlatformId'])!,
        memberVO: jsonRes["memberVO"] == null
            ? MemberVo.fromJson({})
            : MemberVo.fromJson(
                asT<Map<String, dynamic>>("memberVO", jsonRes["memberVO"])!),
      );

  bool flag = false;
  String thridPlatformId = '';
  MemberVo memberVO;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'flag': flag,
        'thridPlatformId': thridPlatformId,
        'memberVO': memberVO.toJson(),
      };
}

class MemberVo {
  UserLoginPostRespModelMemberInfo memberInfo;
  String token;

  MemberVo({required this.memberInfo, required this.token});

  factory MemberVo.fromJson(Map<String, dynamic> jsonRes) => MemberVo(
        memberInfo: jsonRes["memberInfo"] == null
            ? UserLoginPostRespModelMemberInfo.fromJson({})
            : UserLoginPostRespModelMemberInfo.fromJson(
                asT<Map<String, dynamic>>(
                    "memberInfo", jsonRes["memberInfo"])!),
        token: jsonRes['token'] == null
            ? ''
            : asT<String>("token", jsonRes['token'])!,
      );

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'memberInfo': memberInfo,
        'token': token,
      };
}

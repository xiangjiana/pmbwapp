import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:retrofit/retrofit.dart';

part 'sign_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class SignApi {
  factory SignApi(Dio dio, {String baseUrl}) = _SignApi;

  @POST('/sign/checkUser')
  Future<bool> checkUser(@Body() RecoverPasswordParam param);

  @POST('/sign/isVerified')
  Future<MemberInfoResp> isVerified(@Body() VerificationCodeParam param);

  @POST('/sign/login')
  @Extra({"silent":true})
  Future<LoginResp> login(@Body() LoginParam param);

  @POST('/sign/password/update')
  Future<LoginResp> updatePassword(@Body() EditPasswordParam param);

  @POST('/sign/register')
  @Extra({"silent":true})
  Future<LoginResp> register(@Body() RegisterParam param);

  @POST('/sign/resetPassWord')
  Future<bool> resetPassWord(@Body() ResetPasswordParam param);

  @POST('/sign/selectInvitationCode')
  @Extra({"silent":true})
  Future<void> selectInvitationCode(@Body() SelectInvitationCodeParam param);

  @POST('/sign/sendMobileMessages')
  Future<void> sendMobileMessages(@Body() SendVerificationCodeParam param);

  @POST('/sign/setNew')
  Future<int> setNew(@Body() SetNewPasswordParam param);

  @POST('/sign/supportPhoneCode')
  Future<List<String>> supportPhoneCode();

  @POST('/sign/thirdPartyLoginSdk')
  Future<ThirdPlatformMember> thirdPartyLoginSdk(
      @Body() ThirdPartyLoginSdkParam param);

  @POST('/sign/verificationCodeLogin')
  Future<LoginResp> verificationCodeLogin(
      @Body() VerificationCodeAndLoginParam param);

  @POST('/sign/tryMemberLogin')
  Future<LoginResp> tryMemberLogin(
      @Body() BwTryMemberLoginParam param);
}

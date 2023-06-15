import 'package:dio/dio.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'user_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class UserApi {
  factory UserApi(Dio dio, {String baseUrl}) = _UserApi;

  @POST('/user/emailBinding')
  Future<bool> emailBinding(
    @Body() UserEmailParam param,
  );

  @POST('/user/heartbeat')
  Future<void> heartbeat();

  @POST('/user/info')
  Future<MemberInfo> info();

  @POST('/user/infoAll')
  Future<MemberInfoAll> infoAll();

  @POST('/user/phoneBinding')
  Future<bool> phoneBinding(
    @Body() UserPhoneParam param,
  );

  @POST('/user/sendEmailCode')
  Future<Map> sendEmailCode(
    @Body() EmailParam param,
  );

  @POST('/user/updateBirth')
  Future<bool> updateBirth(
    @Body() BirthParam param,
  );

  @POST('/user/updateGender')
  Future<bool> updateGender(
    @Body() GenderParam param,
  );

  @POST('/user/updateInfo')
  Future<bool> updateInfo(
    @Body() UserInfoParam param,
  );

  @POST('/user/updateRealName')
  Future<bool> updateRealName(
    @Body() RealNameParam param,
  );

  @MultiPart()
  @POST('/user/upload')
  Future<UploadAvatar> uploadAvatar(
    @Part(name: 'file') List<int> file,
    @SendProgress() ProgressCallback? onSendProgress,
  );

  @POST('/user/uploadSubmit')
  Future<bool> uploadSubmit(
    @Body() AvatarParam param,
  );
}

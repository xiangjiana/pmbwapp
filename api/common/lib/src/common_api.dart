import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/dio.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'common_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class CommonApi {
  factory CommonApi(Dio dio, {String baseUrl}) = _CommonApi;

  @POST('/common/firstRegister')
  @DioResponseType(ResponseType.plain)
  Future<String> firstRegister();

  //获取短信国家类型配置枚举
  @POST('/common/getCommonDict')
  Future<String> getCommonDict();

  @POST('/common/getCountryName')
  Future<String> getCountryName();

  @POST('/common/getKvConfigValueList')
  Future<List<KvConfig>> getKvConfigValueList(@Body() KvConfigValueParam param);

  //获取手机/邮箱验证码（非生产环境接口）
  @POST('/common/getPhoneCode')
  Future<String> getPhoneCode({
    @Query("phoneOrEmail") String? phoneOrEmail,
  });

  @POST('/common/secondValidate')
  Future<String> secondValidate(
    @Body() GeetestSecondValidateParam param,
  );

  //已绑定电话号码的用户发送验证码
  @POST('/common/sendCodeWithoutPhone')
  Future<bool> sendCodeWithoutPhone();

  //指定电话号码发送验证码
  @POST('/common/sendCodeWithPhone')
  Future<bool> sendCodeWithPhone(@Body() PhoneParam param);

  @POST('/common/getSystemConfigurationValue')
  Future<String> getSystemConfigurationValue(@Body() QueryKeyParam param);
}

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'config_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class ConfigApi {
  factory ConfigApi(Dio dio, {String baseUrl}) = _ConfigApi;

  @POST('/config/appVersionCheck')
  Future<AppVersionConfigResp> appVersionCheck(@Body() AppVersionConfigParam param);

  @POST('/config/banner')
  Future<ObConfigBanner> banner();

  @POST('/config/clientConfigAll')
  Future<ClientConfigResp> clientConfigAll(@Body() ClientConfigParam param);

  @POST('/config/customerAddr')
  Future<MerchantCustomerRecordResp> customerAddr();

  @POST('/config/domainNameConfigQueryList')
  Future<List<Domain>> domainNameConfigQueryList(@Body() DomainParam param);

  @POST('/config/getCodeDownloadUrl')
  Future<MerchantGameUrlRecordResp> getCodeDownloadUrl();

  @POST('/config/getDownloadUrl')
  Future<MerchantGameUrlRecordResp> getDownloadUrl();

  @POST('/config/getProxyCode')
  Future<String> getProxyCode(@Body() ProxyCode param);

  @POST('/config/help/all')
  Future<HelpResp> helpAll();

  @POST('/config/lodingPage')
  Future<List<ObConfigStartPage>> lodingPage();

  @POST('/config/startPage')
  Future<List<ConfigStartPage>> startPage();

  @POST('/config/updateProxyCode')
  Future<bool> updateProxyCode(@Body() UpdateProxyCode param);
}

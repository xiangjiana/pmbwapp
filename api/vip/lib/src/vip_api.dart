import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'vip_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class VipApi {
  factory VipApi(Dio dio, {String baseUrl}) = _VipApi;

  @POST('/vip/selectVipInfo')
  Future<MemberVipListResp> selectVipInfo(@Body() VipParam vipParam);

  @POST('/vip/selectVipLevel')
  Future<VipInfoResp> selectVipLevel(@Body() VipParam vipParam);
}

import 'package:dio/dio.dart';
import 'package:params/params.dart';
import 'package:models/models.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:retrofit/retrofit.dart';

part 'main_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class MainApi {
  factory MainApi(Dio dio, {String baseUrl}) = _MainApi;


  @POST('/main/login')
  @Extra({"silent":true})
  Future<GameLogin> login(@Body() LoginGameParam param);

  @POST('/main/logout')
  Future<void> logout();

  @POST('/main/selectAnnounceList')
  Future<List<ObConfigAnnouncement>> selectAnnounceList();

  @POST('/main/venueByMerchant')
  Future<List<MerchantVenueInfo>> venueByMerchant();

  @POST('/main/venueDy')
  Future<List<ConfigGame>> venueDy();

  @POST('/main/venueDyPc')
  Future<VenueDyPcPageResponse> venueDyPc(@Body() VenueDyPcParam param);

  @POST('/main/venueDyNew')
  Future<List<ConfigGameNew>> venueDyNew(@Body() VenueDyNewParam param);

  @POST('/main/venueList')
  Future<List<VenueTypeCodeAndVenues>> venueList();
}

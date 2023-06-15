import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:params/params.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
part 'game_api.g.dart';


@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class GameApi {
  factory GameApi(Dio dio, {String baseUrl}) = _GameApi;

  @POST('/game/queryVenueGamePage')
  Future<void> queryVenueGamePage(@Body() GameQueryVenueGamePageParam param);



  @POST('/game/rechargeBannerList')
  Future<List<RechargeBanner>>  queryRechargeBannerList(@Body() RechargeBannerParam param);

  @POST('/game/recommendVenueGameList')
  Future<MyCollectionGameList>  queryRecommendVenueGameList(@Body() RecommendVenueGameListParam param);

  @POST('/game/getBottomBanner')
  Future<GameBottomBanner>  queryBottomBanner();

  @POST('/game/collectVenueGameList')
  Future<MyCollectionGameList>  queryMyCollectionGameList(@Body() MyCollectionParam param);

  @POST('/game/nearVenueGameList')
  Future<MyCollectionGameList>  queryNearVenueGameList(@Body() NearVenueGameListParam param);

  @POST('/game/venueGameList')
  Future<MyCollectionGameList>  queryVenueGameList(@Body()VenueGameListParam param);

  @POST('/game/collectVenueGame')
  Future  collectVenueGame(@Body()CollectVenueGameParam param);




}

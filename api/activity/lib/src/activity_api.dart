import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'activity_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class ActivityApi {
  factory ActivityApi(Dio dio, {String baseUrl}) = _ActivityApi;

  @POST('/activity/activityDeposit')
  Future<void> activityDeposit(@Body() ActivityDepositReqParam param);

  @POST('/activity/activityType')
  Future<List<ObConfigActivityType>> activityType();

  @POST('/activity/check')
  Future<void> check(@Body() CheckActivityParam param);

  @POST('/activity/discountActivity')
  Future<List<ActivityConfig>> discountActivity(
      @Body() DiscountActivityParam param);

  @POST('/activity/firstDeposit/activityDeposit')
  Future<void> firstActivityDeposit(@Body() ActivityDepositReqParam param);

  @POST('/activity/firstDeposit/getUserVipActivityInfo')
  Future<UserActivityInfo> getUserVipActivityInfo(
      @Body() UserActivityInfoParam param);

  @POST('/activity/getActivity')
  Future<MemberActivityConfig> getActivity(@Body() GetActivityParam param);

  @GET('/activity/getActivityConfigById')
  Future<MemberActivityConfig> getActivityConfigById(@Query('id') String id);

  @POST('/activity/getActivitySharingDomainLink')
  Future<String> getActivitySharingDomainLink();

  @POST('/activity/joinActivity')
  Future<void> joinActivity(@Body() ActivityJoinParam param);

  @POST('/activity/tag')
  Future<List<ActivityConfigTab>> tag();
}

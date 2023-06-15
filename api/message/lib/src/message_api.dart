import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'message_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class MessageApi {
  factory MessageApi(Dio dio, {String baseUrl}) = _MessageApi;

  @POST('/message/deleteMessage')
  Future<bool> deleteMessage(@Body() MessageDeleteParam param);

  @POST('/message/hasUnReceivedBonus')
  Future<UnReceivedBonusAndTime> hasUnReceivedBonus();

  @POST('/message/receiveDiscount')
  Future<bool> receiveDiscount(@Body() ReceiveDisCountParam param);

  @POST('/message/selectAnnouncementList')
  Future<BwMessageAnnouncementPageResponse> selectAnnouncementList(
      @Body() PageParam param);

  @POST('/message/selectBonusList')
  Future<BwMessageBonusDetailPageResponse> selectBonusList(
      @Body() PageParam param);

  @POST('/message/selectNoticeList')
  Future<BwMessageNoticeDetailPageResponse> selectNoticeList(
      @Body() NoticeListParam param);

  @POST('/message/selectRespectiveUnReadAmount')
  Future<RespectiveUnReadAmount> selectRespectiveUnReadAmount();

  @POST('/message/updateMessageStatus')
  Future<bool> updateMessageStatus(@Body() MessageReadParam param);
}

import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'record_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class RecordApi {
  factory RecordApi(Dio dio, {String baseUrl}) = _RecordApi;

  @POST('/records/deposit/memberRecord')
  Future<DepositDetailsPageResponse> memberRecord(
      @Body() MemberDepositRecordParam param);

  @POST('/records/query/all')
  Future<GameRecordMeta> all(@Body() GameRecordAllParam param);

  @POST('/records/query/game')
  Future<GameRecordDetail> game(@Body() GameCodeRecordParam param);

  @POST('/records/selectDeposit')
  Future<MemberDepositRecordingPageResponse> selectDeposit(
      @Body() SelectDepositParam param);

  @POST('/records/selectMemberAccount')
  Future<MemberAccountRecordingPageResponse> selectMemberAccount(
      @Body() UserAccountChangeRecordParam param);

  @POST('/records/selectWithdrawal')
  Future<MemberWithdrawalRecordingPageResponse> selectWithdrawal(
      @Body() SelectWithdrawalParam param);

  @POST('/records/streamDetails')
  Future<StreamDetails> streamDetails(@Body() ActivityTaskParam param);
}

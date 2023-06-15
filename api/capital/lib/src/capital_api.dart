import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'capital_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class CapitalApi {
  factory CapitalApi(Dio dio, {String baseUrl}) = _CapitalApi;

  @POST('/capital/balanceTransfer')
  Future<void> balanceTransfer(@Body() BalanceTransferParam param);

  @POST('/capital/balanceWithBilling')
  Future<UserAccountBalanceWithBilling> balanceWithBilling();

  @POST('/capital/noTransfer')
  Future<bool> noTransfer(@Body() SetTransferInfoParam param);

  @POST('/capital/withdraw')
  Future<void> withdraw();
}

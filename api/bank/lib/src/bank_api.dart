import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'bank_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class BankApi {

  factory BankApi(Dio dio, {String baseUrl}) = _BankApi;

  @POST('/bank/addBank')
  Future<bool> addBank(@Body() CreateBankParam param);

  @POST('/bank/addVirtual')
  Future<bool> addVirtual(@Body() CreateVirtualParam param);

  @POST('/bank/isVerified')
  Future<bool> isVerified(@Body() BackCardIsVerifiedParam param);

  @POST('/bank/query')
  Future<List<UserBankCard>> query(@Body() ListBankParam param);









}

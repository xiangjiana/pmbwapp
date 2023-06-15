import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:retrofit/http.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';

part 'wallet_api.g.dart';

@RestApi(
  parser: Parser.DartJsonMapper,
)
abstract class WalletApi {
  factory WalletApi(Dio dio, {String baseUrl}) = _WalletApi;

  @POST('/wallet/channel')
  Future<List<PaymentChannelConfig>> channel();

  @POST('/wallet/confirmPay')
  Future<SubmitPayResp> confirmPay(@Body() ConfirmPayParam param);

  @POST('/wallet/depositCount')
  Future<DepositAggByLastWithdrawEs> depositCount();

  @POST('/wallet/getVirtualRate')
  Future<VirtualRate> getVirtualRate(@Body() VirtualRateType param);

  @POST('/wallet/proxy/getDictList')
  Future<DictVirtualType> getDictList();

  @POST('/wallet/selectMemberWithdrawAbleInfo')
  Future<MemberWithdrawAble> selectMemberWithdrawAbleInfo();

  @POST('/wallet/user/flowDetails')
  Future<StillBillAmount> flowDetails();

  @POST('/wallet/user/withdraw')
  Future<void> withdraw(@Body() WithDrawOrderParam param);

  @POST('/wallet/getManagerBankList')
  Future<List<BankNameResp>> getManagerBankList(@Body() BankManageDownParam param);
}

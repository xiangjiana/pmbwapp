import 'dart:async';

import 'package:bank/bank.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:tuple/tuple.dart';
import 'package:wallet/wallet.dart';

class WithdrawRepository {
  final walletApi = Get.find<WalletApi>();
  final bankApi = Get.find<BankApi>();

  Future<void> postWithdrawal(String accountId, String deviceNo, String orderAmount, String withdrawType,
      {String deviceType = '4'}) async {
    try {
      await walletApi.withdraw(WithDrawOrderParam(
        accountId: accountId,
        deviceNo: deviceNo,
        deviceType: deviceType,
        orderAmount: orderAmount,
        withdrawType: withdrawType,
      ));
      return Future.value();
    } catch (e) {
      return Future.error(e);
    }
  }

  /// [type] 数据类型（1-银行卡 2-虚拟货币）
  Future<List<UserBankCard>> getAccounts(String type) async {
    try {
      return bankApi.query(ListBankParam(
        dataType: type,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<MemberWithdrawAble> getMemberWithdrawInfo() async {
    try {
      return walletApi.selectMemberWithdrawAbleInfo();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<StillBillAmount> getUserBillDetails() async {
    try {
      return walletApi.flowDetails();
    } catch (e) {
      return Future.error(e);
    }
  }

  ///汇率类型 1-会员存款 2-会员取款 3-代理存款 4-代理取款
  Future<VirtualRate> getVirtualRatePost(int virtualRateType) {
    try {
      return walletApi.getVirtualRate(
        VirtualRateType(
          virtualRateType: virtualRateType,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<Tuple2<double, double>> getLastDepositAmount() async {
    ///迁移后，没有参数{"accountType": 1} ???
    try {
      var res = await walletApi.depositCount();
      return Future.value(Tuple2(
        res.depositSumAmount.toDouble(),
        res.bonusSumAmount.toDouble(),
      ));
    } catch (e) {
      return Future.error(e);
    }
  }
}

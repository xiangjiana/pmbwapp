import 'dart:async';

import 'package:bank/bank.dart';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:wallet/wallet.dart';

class AddVirtualAccountRepository {
  final commonApi = Get.find<CommonApi>();
  final bankApi = Get.find<BankApi>();
  final walletApi = Get.find<WalletApi>();

  Future<bool> postAddVirtualAccount(
    /*String realName,*/
    String virtualAddress,
    String virtualKind,
    String virtualProtocol,
  ) async {
    try {
      return bankApi.addVirtual(CreateVirtualParam(
        // realName: realName,
        virtualAddress: virtualAddress,
        virtualKind: virtualKind,
        virtualProtocol: virtualProtocol,
      ));
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<DictVirtualType> getDicList() async {
    try {
      return walletApi.getDictList();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> postSendVerifyCode() async {
    try {
      return commonApi.sendCodeWithoutPhone();
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> postConfirmVerifyCode(
    String verificationCode,
  ) async {
    try {
      return bankApi.isVerified(
        BackCardIsVerifiedParam(
          verificationCode: verificationCode,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}

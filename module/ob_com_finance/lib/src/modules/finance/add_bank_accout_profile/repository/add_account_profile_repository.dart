import 'dart:async';

import 'package:bank/bank.dart';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:params/params.dart';

class AddAccountProfileRepository {
  final commonApi = Get.find<CommonApi>();
  final bankApi = Get.find<BankApi>();

  Future<bool> postSendVerifyCode() async {
    try {
      final res = await commonApi.sendCodeWithoutPhone();
      return Future.value(res);
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> postAddBankAccount(
    String bankAddress,
    String bankCode,
    String bankName,
    String cardNumber,
    String cardholderName,
    String city,
    String province,
    int bankId,
  ) async {
    try {
      return bankApi.addBank(CreateBankParam(
        bankAddress: bankAddress,
        bankCode: bankCode,
        bankName: bankName,
        cardNumber: cardNumber,
        cardholderName: cardholderName,
        city: city,
        province: province,
        bankId: bankId,
      ));
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

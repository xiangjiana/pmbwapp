import 'dart:async';

import 'package:bank/bank.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';
import 'package:wallet/wallet.dart';

import 'deposit_bank.dart';

class AddBankAccountRepository {
  final bankApi = Get.find<BankApi>();
  final walletApi = Get.find<WalletApi>();

  Future<bool> postAddBankAccount(
    String accountType,
    String bankAddress,
    String bankCode,
    String bankName,
    String cardNumber,
    String cardholderName,
    String city,
    String province,
    int bankId,
  ) {
    try {
      return bankApi.addBank(
        CreateBankParam(
            accountType: accountType,
            bankAddress: bankAddress,
            bankCode: bankCode,
            bankName: bankName,
            cardNumber: cardNumber,
            cardholderName: cardholderName,
            city: city,
            province: province,
            bankId: bankId,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<bool> postAddBankAccountNew(
    // String bankAddress,
    // String bankCode,
    String bankName,
    String cardNumber,
    String cardholderName,
    int bankId,
    // String city,
    // String province,
  ) {
    try {
      return bankApi.addBank(
        CreateBankParam(
          bankName: bankName,
          cardNumber: cardNumber,
          cardholderName: cardholderName,
          bankId: bankId,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<List<BankNameResp>> getManagerBankList(
    String currency,
  ) {
    try {
      return walletApi.getManagerBankList(
        BankManageDownParam(
          currency: currency,
        ),
      );
    } catch (e) {
      return Future.error(e);
    }
  }
}

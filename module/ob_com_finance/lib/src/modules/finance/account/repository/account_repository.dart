import 'dart:async';

import 'package:bank/bank.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';

class AccountRepository {
  final bankApi = Get.find<BankApi>();

  Future<List<UserBankCard>> getAccounts(String type) async {
    try {
      return bankApi.query(ListBankParam(dataType: type));
    } catch (e) {
      return Future.error(e);
    }
  }
}

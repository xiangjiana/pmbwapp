import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:params/params.dart';
import 'package:record/record.dart';

class MyWalletRepository {
  final recordApi = Get.find<RecordApi>();

  Future<StreamDetails> getFlowDetail(String gameCode) async {
    try {
      final res = await recordApi.streamDetails(
        ActivityTaskParam(
          gameCode: gameCode,
        ),
      );
      BalanceManager.minActivityAmount = res.lowActivityAmount.toDouble();
      return Future.value(res);
    } catch (e) {
      return Future.error(e);
    }
  }
}

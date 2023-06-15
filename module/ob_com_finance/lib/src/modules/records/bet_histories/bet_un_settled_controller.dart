import 'package:get/get.dart';
import 'package:models/models.dart' hide Summary;
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/bet_histories_repository.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/summary.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class BetUnSettledController extends GetxController with FormValidate {
  BetUnSettledController(this.repository, this.authService);

  final BetHistoriesRepository repository;
  final AuthService authService;
  final RefreshController refreshController = RefreshController();
  Rxn<List<Metas>> _metas = Rxn(null);

  set metas(List<Metas>? val) => _metas.value = val;

  List<Metas>? get metas => _metas.value;

  Rx<Summary> summary = Summary(0, 0, 0,0).obs;

  String startTime = '';
  String endTime = '';
  String obBetStatus = '0';
  RxBool loadFail = false.obs;

  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  void jumpToTypeList(Metas record) {
    Map<String, String> paras = {
      "gameCode": record.venueCode,
      'startTime': startTime,
      'endTime': endTime,
      'obBetStatus': obBetStatus,
      "gameName": record.venueName
    };

    Get.toNamed(AppRoutes.BET_DETAIL_LIST, parameters: paras);
  }

  onRefresh() async {
    try {
      //最多30天？
      DateTime startDate = DateTime.now().subtract(Duration(days: 30));
      DateTime endDate = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day, 23, 59, 59);
      startTime =
          "${startDate.year}-${startDate.month.toString().padLeft(2, "0")}-${startDate.day.toString().padLeft(2, "0")} ${startDate.hour.toString().padLeft(2, "0")}:${startDate.minute.toString().padLeft(2, "0")}:${startDate.second.toString().padLeft(2, "0")}";
      endTime =
          "${endDate.year}-${endDate.month.toString().padLeft(2, "0")}-${endDate.day.toString().padLeft(2, "0")} ${endDate.hour.toString().padLeft(2, "0")}:${endDate.minute.toString().padLeft(2, "0")}:${endDate.second.toString().padLeft(2, "0")}";
      final res = (await repository.getGameGameRecordAll(
        startTime,
        endTime,
        obBetStatus,
      ));
      summary.value = Summary(
        res.betAmountTotal.toDouble(),
        0,
        res.countTotal.toInt(),
        res.netAmountTotal.toDouble(),
      );
      metas = res.metas;
      loadFail.value = false;
      refreshController.refreshCompleted();
    } catch (e) {
      loadFail.value = true;
      refreshController.refreshFailed();
    }
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}

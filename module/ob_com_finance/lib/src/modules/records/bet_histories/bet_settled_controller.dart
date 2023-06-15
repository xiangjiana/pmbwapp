import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart' hide Summary;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/bet_histories_repository.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/date_enum.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/summary.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;

String obBetStatus = '1';

class BetSettledController extends GetxController
    with SingleGetTickerProviderMixin {
  BetSettledController(this.repository);

  final BetHistoriesRepository repository;
  late final TabController tabController;
  final dateAnchorKey = GlobalKey();
  List<TabBetSettledController> innerControllers = [];

  int dateTabIndex = 0;
  int lastDateTabIndex = 0;
  RxBool isShowDatePicker = false.obs;
  Period period = Period.TODAY;
  String startTime =
      DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';
  String endTime =
      DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
  String lastStartTime =
      DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 7))) + ' 00:00:00';
  String lastEndTime =
      DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';

  RxString customTimeTabText = 'bet_time_choose_customize'.tr.obs;
  List<bool> isRequestedList = List.filled(5, false); // 是否第一次请求标识
  @override
  void onInit() {
    super.onInit();
    for (int i = 0; i < 5; i++) {
      innerControllers.add(TabBetSettledController(repository, this));
    }
    tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: dateTabIndex,
    )..addListener(() {
        onSelectPeriod(tabController.index);
        onRefresh();
        if (tabController.index == tabController.animation!.value) {
          lastDateTabIndex = tabController.previousIndex;
        }
      });
    onSelectPeriod(dateTabIndex);
    onRefresh();
  }

  void jumpToTypeList(Metas record) {
    Map<String, String> paras = {
      "gameCode": record.venueCode,
      'startTime': startTime,
      'endTime': endTime,
      'obBetStatus': obBetStatus,
      "gameName": record.venueName,
      "dateTabIndex": dateTabIndex.toString(),
    };

    Get.toNamed(AppRoutes.BET_DETAIL_LIST, parameters: paras);
  }

  void onSelectPeriod(int index) {
    dateTabIndex = index;
    period = Period.values[index];
    if (period == Period.CUSTOM) {
      isShowDatePicker.value = true;
    }
  }

  onRefresh() async {
    switch (period) {
      case Period.TODAY:
        startTime =
            DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        break;
      case Period.YESTERDAY:
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 00:00:00';
        endTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 23:59:59';
        break;
      case Period.RECENT_WEEK:
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 6))) +
            ' 00:00:00';
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        break;
      case Period.RECENT_MONTH:
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 29))) +
            ' 00:00:00';
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        break;
      case Period.CUSTOM:
        break;
    }
    await innerControllers[tabController.index].onRefresh();
  }

  void onDatePickerCancel() {
    isShowDatePicker.value = false;
    tabController.animateTo(
        customTimeTabText.value == 'bet_time_choose_customize'.tr
            ? lastDateTabIndex
            : dateTabIndex);
  }

  void onDatePickerConfirm(TimeRange range) {
    customTimeTabText.value = '${range.start}\n${range.end}';
    startTime = range.start + ' 00:00:00';
    endTime = range.end + ' 23:59:59';
    isShowDatePicker.value = false;
    lastStartTime = startTime;
    lastEndTime = endTime;
    onRefresh();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

class TabBetSettledController extends GetxController
    with SingleGetTickerProviderMixin {
  TabBetSettledController(this.repository, this.betSettledController);



  final BetHistoriesRepository repository;
  final BetSettledController betSettledController;
  Rxn<List<Metas>> _metas = Rxn(null);

  set metas(List<Metas>? val) => _metas.value = val;

  List<Metas>? get metas => _metas.value;

  Rx<Summary> summary = Summary(0, 0, 0, 0).obs;
  RxBool loadFail = false.obs;

  @override
  void onInit() {
    super.onInit();

  }

  getGameGameRecordAll() async {
    try {

      final res = await repository.getGameGameRecordAll(
        betSettledController.startTime,
        betSettledController.endTime,
        obBetStatus,
      );
      metas = res.metas;
      summary.value = Summary(
        res.betAmountTotal.toDouble(),
        0,
        res.countTotal.toInt(),
        res.netAmountTotal.toDouble(),
      );
      loadFail.value = false;
    } catch (e) {
      loadFail.value = true;
    }
  }

  onRefresh() async {
    await getGameGameRecordAll();
  }

  @override
  void onClose() {
    super.onClose();
  }
}

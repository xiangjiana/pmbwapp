import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:models/models.dart' hide Summary;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/component/bet_filter.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/bet_detail_list_repository.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/summary.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

import 'repository/date_enum.dart';

class BetDetailListController extends GetxController
    with SingleGetTickerProviderMixin {
  BetDetailListController(this.repository);

  late final TabController tabController;
  final BetDetailListRepository repository;

  final filterAnchorKey = GlobalKey();
  final _isFilterOpen = false.obs;

  int lastDateTabIndex = 0;
  RxBool isShowDatePicker = false.obs;
  RxString customTimeTabText = 'periods_custom'.tr.obs;
  int dateTabIndex = 0;
  Period period = Period.TODAY;
  final Rxn<List<DateAndGameRecordList>> _metas = Rxn(null);

  set metas(List<DateAndGameRecordList>? val) => _metas.value = val;

  List<DateAndGameRecordList>? get metas => _metas.value;

  bool get isFilterOpen => _isFilterOpen.value;

  Rx<Summary> summary = Summary(0, 0, 0, 0).obs;
  List<String> gameTypeNames = ['bet_histories_all'.tr];
  late String gameCode;
  late String startTime;
  late String endTime;
  late String obBetStatus;
  late String gameName;
  String gameTypeName = '';
  String? lastStartTime;
  String? lastEndTime;
  List<bool> isRequestedList = List.filled(5, false); // 是否第一次请求标识
  bool isFirstTap = false;

  @override
  void onInit() {
    super.onInit();
    gameCode = Get.parameters['gameCode']!;
    startTime = Get.parameters['startTime']!;
    endTime = Get.parameters['endTime']!;

    obBetStatus = Get.parameters['obBetStatus']!;
    gameName = Get.parameters['gameName']!;
    dateTabIndex = Get.parameters.containsKey('dateTabIndex')
        ? int.parse(Get.parameters['dateTabIndex']!)
        : 0;
    lastDateTabIndex = dateTabIndex;
    if (dateTabIndex == 4) {
      String start = startTime.split(' ')[0];
      String end = endTime.split(' ')[0];
      customTimeTabText.value = '$start\n$end';
      lastStartTime = start;
      lastEndTime = end;
    }
    tabController = TabController(
      length: 5,
      vsync: this,
      initialIndex: dateTabIndex,
    )..addListener(
        () {
          if (tabController.index == tabController.animation!.value) {
            lastDateTabIndex = tabController.previousIndex;
          }
        },
      );
  }

  void onSelectPeriod(int index) {
    dateTabIndex = index;
    period = Period.values[index];
    if (period == Period.CUSTOM) {
      isShowDatePicker.value = isFirstTap;
      isFirstTap = true;
    }
  }

  Future<void> getGameGameRecordByGameCode() async {
    try {
      final res = await repository.getGameGameRecordByGameCode(
        gameCode,
        startTime,
        endTime,
        obBetStatus,
        gameTypeName,
        "",
      );
      metas = res.metas;
      gameTypeNames = ['bet_histories_all'.tr];
      // gameTypeNames.addAll(res.gameTypeNames);
      summary.value = Summary(
        res.betAmountTotal.toDouble(),
        res.validBetAmountTotal.toDouble(),
        res.countTotal.toInt(),
        res.netAmountTotal.toDouble(),
      );
    } catch (e) { 
      metas = [];
    }
  }

  onRefresh() async {
    if (obBetStatus == "1") {
      switch (period) {
        case Period.TODAY:
          startTime =
              DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';
          endTime =
              DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
          break;
        case Period.YESTERDAY:
          startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))) + ' 00:00:00';
          endTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 1))) + ' 23:59:59';
          break;
        case Period.RECENT_WEEK:
          startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 6))) + ' 00:00:00';
          endTime =
              DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
          break;
        case Period.RECENT_MONTH:
          startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 29))) + ' 00:00:00';
          endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
          break;
        case Period.CUSTOM:
          if (customTimeTabText.value == 'periods_custom'.tr) {
            startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 29))) + ' 00:00:00';
            endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
          }
          break;
      }
    } else {
      startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(Duration(days: 29))) + ' 00:00:00';
      endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
    }
    print("获取投注记录");
    await getGameGameRecordByGameCode();
  }

  void onDatePickerCancel() {
    isShowDatePicker.value = false;
    tabController.animateTo(customTimeTabText.value == 'periods_custom'.tr
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

  void showFilters(BuildContext context) async {
    isShowDatePicker.value = false;
    final RenderBox filterObj =
        filterAnchorKey.currentContext?.findRenderObject()! as RenderBox;
    final overlay = Get.overlayContext?.findRenderObject()! as RenderBox;
    final offset = Offset(0, 8.w);
    final RelativeRect position = RelativeRect.fromRect(
      Rect.fromPoints(
        filterObj.localToGlobal(offset, ancestor: overlay),
        filterObj.localToGlobal(
            filterObj.size.bottomCenter(Offset.zero) + offset,
            ancestor: overlay),
      ),
      Offset.zero & overlay.size,
    );
    _isFilterOpen.value = true;
    final newResult = await showWindow(
      context: context,
      position: position,
      windowBuilder: (ctx, anim, secondAnim) => FadeTransition(
        opacity: anim,
        child: BetFilter(
          gameTypeNames: gameTypeNames,
          selectType:
              gameTypeName == '' ? 'bet_histories_all'.tr : gameTypeName,
        ),
      ),
    );
    _isFilterOpen.value = false;
    if (newResult != null)
      gameTypeName = newResult == 'bet_histories_all'.tr ? '' : newResult;
    onRefresh();
    if (customTimeTabText.value == 'periods_custom'.tr &&
        tabController.index == 4) {
      final customStartTime = DateFormat('yyyy-MM-dd')
          .format(DateTime.now().subtract(Duration(days: 29)));
      final customEndTime = DateFormat('yyyy-MM-dd').format(DateTime.now());
      customTimeTabText.value = '$customStartTime\n$customEndTime';
    }
  }

  @override
  void onClose() {
    tabController.dispose();
    isFirstTap = false;
    super.onClose();
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ob_com_base/ob_com_base.dart' hide PageResponse;
import 'package:models/models.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/date_enum.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/component/drop_down_filter.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ledger_record_repository.dart';
import 'package:ob_com_finance/src/modules/records/ledger_record/repository/ui_transcation.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

UiTranscation transaction = TRANSACTION_DIC().first;
var customStartTime = DateFormat('yyyy-MM-dd')
    .format(DateTime.now().subtract(const Duration(days: 29)));
var customEndTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

class LedgerRecordController extends GetxController
    with SingleGetTickerProviderMixin {
  final todayRecordController = Get.find<TodayRecordController>();
  final yesterdayRecordController = Get.find<YesterdayRecordController>();
  final recentWeekRecordController = Get.find<RecentWeekRecordController>();
  final recentMonthRecordController = Get.find<RecentMonthRecordController>();
  final customRecordController = Get.find<CustomRecordController>();
  final filterAnchorKey = GlobalKey();
  late final tabController;
  final _isFilterOpen = false.obs;

  bool get isFilterOpen => _isFilterOpen.value;
  Period period = Period.TODAY;
  RxBool isShowDatePicker = false.obs;
  int lastDateTabIndex = 0;

  var _customTimeTabText = 'periods_custom'.tr.obs;

  String get customTimeTabText => _customTimeTabText.value;

  set customTimeTabText(String val) => _customTimeTabText.value = val;

  @override
  void onInit() {
    super.onInit();

    //还原初始值
    transaction = TRANSACTION_DIC().first;

    tabController = TabController(length: 5, vsync: this)
      ..addListener(() {
        //监听 滑动事件
        selectPeriod(tabController.index);

        if (tabController.index == tabController.animation.value) {
          lastDateTabIndex = tabController.previousIndex;
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  void onDatePickerConfirm(TimeRange range) {
    customTimeTabText = '${range.start}\n${range.end}';
    customStartTime = range.start;
    customEndTime = range.end;
    isShowDatePicker.value = false;
    onRefresh();
  }

  void onDatePickerCancel() {
    tabController.animateTo(customTimeTabText == 'periods_custom'.tr
        ? lastDateTabIndex
        : Period.values.indexWhere((element) => element == period));
    isShowDatePicker.value = false;
  }

  void showFilters() async {
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
    final result = await showWindow<UiTranscation>(
      context: Get.context!,
      position: position,
      windowBuilder: (ctx, anim, secondAnim) => FadeTransition(
        opacity: anim,
        child: DropDownFilter(selectType: transaction),
      ),
    );
    _isFilterOpen.value = false;
    if (result != null) {
      transaction = result;
      onRefresh();
      if (customTimeTabText == 'periods_custom'.tr &&
          tabController.index == 4) {
        customTimeTabText = '$customStartTime\n$customEndTime';
      }
    } else {
      if (customTimeTabText == 'periods_custom'.tr &&
          tabController.index == 4) {
        customTimeTabText = '$customStartTime\n$customEndTime';
        onRefresh();
      }
    }
  }

  void selectPeriod(int index) {
    period = Period.values[index];
    if (period == Period.CUSTOM) {
      isShowDatePicker.value = true;
      return;
    }
    onRefresh();
  }

  void onRefresh() {
    switch (period) {
      case Period.TODAY:
        todayRecordController.onRefresh();
        break;
      case Period.YESTERDAY:
        yesterdayRecordController.onRefresh();
        break;
      case Period.RECENT_WEEK:
        recentWeekRecordController.onRefresh();
        break;
      case Period.RECENT_MONTH:
        recentMonthRecordController.onRefresh();
        break;
      case Period.CUSTOM:
        customRecordController.onRefresh();
        break;
    }
  }

  @override
  void onClose() {
    todayRecordController.dispose();
    yesterdayRecordController.dispose();
    recentWeekRecordController.dispose();
    recentMonthRecordController.dispose();
    customRecordController.dispose();
    tabController.dispose();
    super.onClose();
  }
}

class TodayRecordController extends GetxController with MelosPageController<PageResponse<MemberAccountRecording>> {
  final LedgerRecordRepository repository;
  @override
  final smartRefreshCtrl = RefreshController();

  TodayRecordController(this.repository);

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
    final startTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  void navigateDetail(index) {
    Get.toNamed(AppRoutes.LEDGER_DETAIL, arguments: data?.record[index]);
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }

  @override
  void onRefreshFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }

  @override
  void onLoadedFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }
}

class YesterdayRecordController extends GetxController with MelosPageController<PageResponse<MemberAccountRecording>> {
  final LedgerRecordRepository repository;
  @override
  final smartRefreshCtrl = RefreshController();

  YesterdayRecordController(this.repository);

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final endTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1))) +
        ' 23:59:59';
    final startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 1))) +
        ' 00:00:00';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  void navigateDetail(index) {
    Get.toNamed(AppRoutes.LEDGER_DETAIL, arguments: data?.record[index]);
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }

  @override
  void onRefreshFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }

  @override
  void onLoadedFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }
}

class RecentWeekRecordController extends GetxController with MelosPageController<PageResponse<MemberAccountRecording>> {
  final LedgerRecordRepository repository;
  @override
  final smartRefreshCtrl = RefreshController();

  RecentWeekRecordController(this.repository);

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
    final startTime = DateFormat('yyyy-MM-dd').format(DateTime.now().subtract(const Duration(days: 6))) +
        ' 00:00:00';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  void navigateDetail(index) {
    Get.toNamed(AppRoutes.LEDGER_DETAIL, arguments: data?.record[index]);
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }

  @override
  void onRefreshFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }

  @override
  void onLoadedFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }
}

class RecentMonthRecordController extends GetxController with MelosPageController<PageResponse<MemberAccountRecording>> {
  final LedgerRecordRepository repository;
  @override
  final smartRefreshCtrl = RefreshController();

  RecentMonthRecordController(this.repository);

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final endTime =
        DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
    final startTime = DateFormat('yyyy-MM-dd')
            .format(DateTime.now().subtract(const Duration(days: 29))) +
        ' 00:00:00';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  void navigateDetail(index) {
    Get.toNamed(AppRoutes.LEDGER_DETAIL, arguments: data?.record[index]);
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }

  @override
  void onRefreshFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }

  @override
  void onLoadedFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }
}

class CustomRecordController extends GetxController with MelosPageController<PageResponse<MemberAccountRecording>> {
  final LedgerRecordRepository repository;
  @override
  final smartRefreshCtrl = RefreshController();

  CustomRecordController(this.repository);

  @override
  Future<PageResponse<MemberAccountRecording>> getPageList(int page) {
    final startTime = customStartTime + ' 00:00:00';
    final endTime = customEndTime + ' 23:59:59';

    return repository.getDepositRecord(
      startTime,
      endTime,
      transaction.code,
      page,
    );
  }

  void navigateDetail(index) {
    Get.toNamed(AppRoutes.LEDGER_DETAIL, arguments: data?.record[index]);
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }

  @override
  void onRefreshFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }

  @override
  void onLoadedFailed(e) {
    if (e is String) {
      showToast(e);
    }
  }
}

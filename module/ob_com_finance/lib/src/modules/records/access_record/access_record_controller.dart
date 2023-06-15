import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/records/access_record/componet/deposit_drop_down.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/access_record_repository.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/dic.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/drop_down_filter_result.dart';
import 'package:ob_com_finance/src/modules/records/access_record/repository/ui_access_record.dart';
import 'package:ob_com_finance/src/modules/records/bet_histories/repository/date_enum.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:pull_to_refresh/pull_to_refresh.dart';

class AccessRecordController extends GetxController with SingleGetTickerProviderMixin {
  late final tabController;

  final depositTabController = AccessRecordDateTabController(false);
  final withdrawTabController = AccessRecordDateTabController(true);

  final _currentTab = SelectTab.DEPOSIT.obs;

  set currentTab(val) => _currentTab.value = val;

  SelectTab get currentTab => _currentTab.value;

  RxBool get isShowDatePicker {
    return AccessRecordDateTabController.isShowDatePicker;
  }

  @override
  void onInit() {
    super.onInit();
    withdrawTabController.onInit();
    depositTabController.onInit();

    tabController = TabController(length: 2, vsync: this)
      ..addListener(() {
        if (tabController.index == 0) {
          isShowDatePicker.value =
              depositTabController.tabController.index == 4;
        } else {
          isShowDatePicker.value =
              withdrawTabController.tabController.index == 4;
        }

        if (tabController.index == tabController.animation!.value) {
          _currentTab.value = SelectTab.values[tabController.index];
          onRefresh();
        }
      });
  }

  @override
  void onReady() {
    super.onReady();
    withdrawTabController.onReady();
    depositTabController.onReady();
  }

  void selectTab(int index) {
    _currentTab.value = SelectTab.values[index];
    onRefresh();
  }

  void onRefresh() async {
    if (currentTab == SelectTab.WITHDRAW) {
      withdrawTabController.onRefresh();
    } else {
      depositTabController.onRefresh();
    }
  }

  void onDatePickerCancel() {
    if (currentTab == SelectTab.WITHDRAW) {
      withdrawTabController.onDatePickerCancel();
    } else {
      depositTabController.onDatePickerCancel();
    }
  }

  void onDatePickerConfirm(TimeRange range) {
    if (currentTab == SelectTab.WITHDRAW) {
      withdrawTabController.onDatePickerConfirm(range);
    } else {
      depositTabController.onDatePickerConfirm(range);
    }
  }

  @override
  void onClose() {
    withdrawTabController.dispose();
    depositTabController.dispose();
    tabController.dispose();
    super.onClose();
  }
}

class DepositRecordController extends GetxController
    with ObPageController<UiAccessRecord> {
  final AccessRecordRepository repository;

  final AccessRecordDateTabController tabController;

  DepositRecordController(this.repository, this.tabController);

  @override
  final smartRefreshCtrl = RefreshController();

  @override
  bool get noMoreData =>
      data?.totalRecord ==
      data?.record.expand((element) => element.details).length;

  void initialRefresh() {
    data = null;
    onRefresh();
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

  @override
  Future<PageResponse<UiAccessRecord>> getPageList(int page) {
    final startTime;
    final endTime;
    switch (tabController._period) {
      case Period.TODAY:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime =
            DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';
        break;
      case Period.YESTERDAY:
        endTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 00:00:00';
        break;
      case Period.RECENT_WEEK:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 6))) +
            ' 00:00:00';
        break;
      case Period.RECENT_MONTH:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 29))) +
            ' 00:00:00';
        break;
      case Period.CUSTOM:
        endTime = tabController._customEndTime + ' 23:59:59';
        startTime = tabController._customStartTime + ' 00:00:00';
        break;
    }
    return repository.getDepositRecord(
      startTime,
      endTime,
      page,
      status: tabController.depositFilterResult.status,
    );
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }
}

class WithdrawRecordController extends GetxController
    with ObPageController<UiAccessRecord> {
  final AccessRecordRepository repository;
  final AccessRecordDateTabController tabController;

  WithdrawRecordController(this.repository, this.tabController);

  @override
  final smartRefreshCtrl = RefreshController();

  @override
  bool get noMoreData =>
      data?.totalRecord ==
      data?.record.expand((element) => element.details).length;

  void initialRefresh() {
    data = null;
    onRefresh();
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

  @override
  Future<PageResponse<UiAccessRecord>> getPageList(int page) {
    final startTime;
    final endTime;
    switch (tabController._period) {
      case Period.TODAY:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime =
            DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 00:00:00';
        break;
      case Period.YESTERDAY:
        endTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 1))) +
            ' 00:00:00';
        break;
      case Period.RECENT_WEEK:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 7))) +
            ' 00:00:00';
        break;
      case Period.RECENT_MONTH:
        endTime = DateFormat('yyyy-MM-dd').format(DateTime.now()) + ' 23:59:59';
        startTime = DateFormat('yyyy-MM-dd')
                .format(DateTime.now().subtract(Duration(days: 30))) +
            ' 00:00:00';
        break;
      case Period.CUSTOM:
        endTime = tabController._customEndTime + ' 23:59:59';
        startTime = tabController._customStartTime + ' 00:00:00';
        break;
    }

    return repository.getWithdrawRecord(
      startTime,
      endTime,
      page,
      status: tabController.withdrawFilterResult.status,
    );
  }

  @override
  void onClose() {
    smartRefreshCtrl.dispose();
    super.onClose();
  }
}

class AccessRecordDateTabController extends GetxController with SingleGetTickerProviderMixin {
  var depositFilterResult = DropDownFilterResult(
    status: DEPOSIT_STATUS_FILTER_DIC.keys.first,
  );
  var withdrawFilterResult = DropDownFilterResult(
    status: WITHDRAWAL_STATUS_FILTER_DIC.keys.first,
  );
  Period _period = Period.TODAY;

  String _customStartTime = DateFormat(
    'yyyy-MM-dd',
  ).format(
    DateTime.now().subtract(Duration(days: 29)),
  );

  String _customEndTime = DateFormat('yyyy-MM-dd').format(DateTime.now());

  final filterAnchorKey = GlobalKey();
  List<bool> depositTabIsRequestedList = List.filled(5, false); // 是否第一次请求标识
  List<bool> withdrawTabIsRequestedList = List.filled(5, false); // 是否第一次请求标识
  // final depositController = Get.find<DepositRecordController>();
  // final withdrawController = Get.find<WithdrawRecordController>();
  List<DepositRecordController> depositRecordControllers = [];
  List<WithdrawRecordController> withdrawRecordControllers = [];
  int dateTabIndex = 0;
  int lastDateTabIndex = 0;

  final _isFilterOpen = false.obs;
  RxString customTimeTabText = 'access_record_customize'.tr.obs;
  static RxBool isShowDatePicker = false.obs;

  bool get isFilterOpen => _isFilterOpen.value;

  late TabController tabController;
  final bool isWithdraw;

  AccessRecordDateTabController(this.isWithdraw);

  @override
  void onInit() {
    super.onInit();
    depositFilterResult = DropDownFilterResult(
      status: DEPOSIT_STATUS_FILTER_DIC.keys.first,
    );
    withdrawFilterResult = DropDownFilterResult(
      status: WITHDRAWAL_STATUS_FILTER_DIC.keys.first,
    );
    _period = Period.TODAY;
    tabController = TabController(vsync: this, length: 5, initialIndex: 0);
    tabController
      ..addListener(() {
        onSelectPeriod2(tabController.index);
      });

    for (int i = 0; i < 5; i++) {
      if (isWithdraw) {
        withdrawRecordControllers.add(WithdrawRecordController(
          Get.find<AccessRecordRepository>(),
          this,
        ));
      } else {
        depositRecordControllers.add(DepositRecordController(
          Get.find<AccessRecordRepository>(),
          this,
        ));
      }
    }
  }

  @override
  void onReady() {
    super.onReady();
    onRefresh();
    isShowDatePicker.value = false;
  }

  void showFilters() async {
    if(isShowDatePicker.value){
      onRefresh();
    }
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
    final newResult = await showWindow<DropDownFilterResult>(
      context: Get.context!,
      position: position,
      windowBuilder: (ctx, anim, secondAnim) => FadeTransition(
        opacity: anim,
        child: isWithdraw
            ? DepositDropDown(result: withdrawFilterResult)
            : DepositDropDown(result: depositFilterResult),
      ),
    );
    _isFilterOpen.value = false;
    if (newResult != null) {
      if (this.isWithdraw) {
        withdrawFilterResult = newResult;
      } else {
        depositFilterResult = newResult;
      }

      if (customTimeTabText.value == '自定义' && tabController.index == 4) {
        customTimeTabText.value = '$_customStartTime\n$_customEndTime';
      }
      onRefresh();
    }
  }

  void onRefresh() async {
    if (isWithdraw) {
      if (withdrawTabIsRequestedList[tabController.index] == false) {
        withdrawRecordControllers[tabController.index].initialRefresh();
      } else {
        withdrawRecordControllers[tabController.index].onRefresh();
      }
      withdrawTabIsRequestedList[tabController.index] = true;
    } else {
      if (depositTabIsRequestedList[tabController.index] == false) {
        depositRecordControllers[tabController.index].initialRefresh();
      } else {
        depositRecordControllers[tabController.index].onRefresh();
      }
      depositTabIsRequestedList[tabController.index] = true;
    }
  }

  void onSelectPeriod(int index) {
    dateTabIndex = index;
    tabController.index = index;
    _period = Period.values[index];
    if (_period == Period.CUSTOM) {
      isShowDatePicker.value = true;
      return;
    } else {
      lastDateTabIndex = index;
    }
    isShowDatePicker.value = false;
    if (tabController.index == tabController.animation!.value &&
        isShowDatePicker.value) {
      onRefresh();
    }
  }

  void onSelectPeriod2(int index) {
    dateTabIndex = index;
    tabController.index = index;
    _period = Period.values[index];
    isShowDatePicker.value = _period == Period.CUSTOM;
    isShowDatePicker.refresh();

    if (tabController.index == tabController.animation!.value &&
        !isShowDatePicker.value) {
      onRefresh();
    }
  }

  void onDatePickerCancel() {
    isShowDatePicker.value = false;
    tabController.animateTo(
        customTimeTabText.value == 'access_record_customize'.tr
            ? lastDateTabIndex
            : dateTabIndex);
  }

  void onDatePickerConfirm(TimeRange range) {
    isShowDatePicker.value = false;
    customTimeTabText.value = '${range.start}\n${range.end}';
    _customStartTime = range.start;
    _customEndTime = range.end;
    onRefresh();
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }
}

enum SelectTab { DEPOSIT, WITHDRAW }

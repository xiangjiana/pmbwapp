import 'dart:async';

import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/records/discount/repository/discount.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:pull_to_refresh/pull_to_refresh.dart';

class SponsorDiscountController extends GetxController {
  final repository = Get.find<HomeRepository>();

  final RefreshController refreshController = RefreshController();
  Rxn<List<ActivityConfig>> _dataSource = Rxn(null);

  set dataSource(List<ActivityConfig>? value) => _dataSource.value = value;

  List<ActivityConfig>? get dataSource => _dataSource.value;

  @override
  void onReady() {
    super.onReady();
    runCatch(() async {
      dataSource = await repository.getSponsorDiscount();
    });
  }

  Future<void> onRefresh() async {
    try {
      dataSource = await repository.getSponsorDiscount();
      refreshController.refreshCompleted();
      Store.isActivityManualRefresh = true;
      update();
      await Future.delayed(Duration(milliseconds: 2000));
      Store.isActivityManualRefresh = false;
      update();
    } catch (e) {
      refreshController.refreshFailed();
      showToast(e.toString());
    }
  }

  void onLoading() {
    refreshController.loadNoData();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }
}

import 'dart:convert';

import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_package/modules/vip/vip_level/vip_level_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/ob_com_http.dart';

import 'vip_limit_last_month_bean.dart';

class VipLevelDetailController extends GetxController {
  VipLevelController vipLevelController = Get.find<VipLevelController>();

  TabController? tabController;
  var selectedIndex = 0.obs;
  List<VipLimitLastMonthBean> limitBeans = <VipLimitLastMonthBean>[];
  RxList<List> tabView1Data = <List>[].obs;
  RxList<List> tabView2Data = <List>[].obs;
  RxList<List> tabView3Data = <List>[].obs;

  @override
  void onInit() {
    final Map arguments = Get.arguments;
    final List<In> listIn = arguments['listIn'] ?? <ListIn>[];
    final List<Rebate> listRebate = arguments['listRebate'] ?? <ListRebate>[];

    if (listIn.isEmpty || listRebate.isEmpty) {
      onRefresh();
    } else {
      handleDatas(listIn, listRebate);
    }

    super.onInit();
  }

  double pageHeight(List<List> datas) {
    // 头部高度 + 每项高度 + 剩余的固定高度
    return 48 + ((datas.first.length - 1) * 40) + 72;
  }

  void reloadFooter() {
    selectedIndex.value = tabController?.index ?? 0;
  }

  Future<void> onRefresh() async {
    try {
      showGaLoading();
      final res = await vipLevelController.repository
          .getUserApiSelectVipInfo(vipLevelController.userName);
      res.listGrade.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      res.listIn.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      res.listPromotion.sort((a, b) =>
          int.parse(a.vipSerialNum).compareTo(int.parse(b.vipSerialNum)));
      handleDatas(res.listIn, res.listRebate);
      dismissLoading();
    } catch (_) {
      dismissLoading();
    }
  }

  void handleDatas(List<In> listIn, List<Rebate> listRebate) {
    final firstColumn = listIn.map((e) => e.vipGradeName).toList()
      ..insert(0, 'grade'.tr);
    tabView1Data.clear();
    tabView2Data.clear();
    tabView3Data.clear();
    tabView1Data.add(firstColumn);
    tabView1Data.add(['level_table_text1'.tr]);
    tabView1Data.add(['level_table_text2'.tr]);
    tabView2Data.add(firstColumn);
    tabView3Data.add(firstColumn);
    tabView3Data.add(['level_table_text3'.tr]);
    tabView3Data.add(['level_table_text4'.tr]);
    limitBeans.clear();

    for (int i = 0; i < listRebate.length; i++) {
      List column = [listRebate[i].gameName];
      Map? rebaseMap = jsonDecode(listRebate[i].configVipRebate);
      if (rebaseMap != null) {
        column.addAll(rebaseMap.values.map((e) {
          return '${numberFormat(NumUtil.multiply(num.parse(e.toString()), 100), comma: false)}' +
              '%';
          //return '${(num.parse(e)*100).toString()}' + '%';
        }).toList());
      }
      tabView2Data.add(column);
    }

    List tab2Column = ['daily_rebate_cap'.tr];
    for (int i = 0; i < listIn.length; i++) {
      tabView1Data[1].add(AppCurrencyUtils.dealBalance(
          listIn[i].aboveMonthRedEnvelope.toString()));
      tabView1Data[2].add(AppCurrencyUtils.dealBalance(
          listIn[i].belowMonthRedEnvelope.toString()));
      tabView3Data[1].add(listIn[i].dayWithdrawalNum);
      tabView3Data[2].add(AppCurrencyUtils.dealBalance(
          listIn[i].dayWithdrawalQuota.toString()));
      tab2Column.add(AppCurrencyUtils.getAppCurrencySymbolIsVND()
          ? AppCurrencyUtils.dealBalance(listIn[i].dailyRebateCap.toString())
          : (numberFormat(listIn[i].dailyRebateCap) + ' '+'rmb'.tr));
      VipLimitLastMonthBean bean = VipLimitLastMonthBean();
      bean.setVipGradeName(listIn[i].vipGradeName);
      listIn[i].depositLimit = AppCurrencyUtils.getAppCurrencySymbolIsVND()
          ? listIn[i].depositLimit / 1000
          : listIn[i].depositLimit;
      bean.setDepositLimit(numberFormat(listIn[i].depositLimit));
      limitBeans.add(bean);
    }
    tabView2Data.add(tab2Column);
  }

  @override
  void onClose() {
    tabController?.dispose();
    super.onClose();
  }
}

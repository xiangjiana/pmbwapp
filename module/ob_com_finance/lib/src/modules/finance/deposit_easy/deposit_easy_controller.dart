import 'package:common_utils/common_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_finance/src/modules/finance/deposit/repository/ui_pay_type.dart';
import 'package:ob_com_finance/src/modules/finance/deposit_easy/repository/deposit_easy_repository.dart';

import 'component/baima_view.dart';
import 'component/easy_cryptocurrency_deposit_input.dart';
import 'component/universal_deposit_input2.dart';
import 'component/universal_deposit_input3.dart';
import 'deposit_easy_state.dart';

class DepositEasyController extends GetxController with KeyboardManager {
  final DepositEasyState state = DepositEasyState();
  final DepositEasyRepository repository;
  final AuthService authService;
  final RxString _selectedProtocol = ''.obs;

  String get selectedProtocol => _selectedProtocol.value;
  Map<String, String> usdtAddressMap = {};

  DepositEasyController(this.repository, this.authService);

  final Rxn<List<UiPayType>> _payTypes = Rxn(null);
  final Rxn<List<UiPayType>> _payTypes2 = Rxn(null);

  List<UiPayType>? get payTypes =>
      showMore.value ? _payTypes2.value : _payTypes.value;

  final _selectedPayType = Rxn<UiPayType>(null);

  UiPayType? get selectedPayType => _selectedPayType.value;

  final _isRequesting = false.obs;

  final showMore = false.obs;
  int chargeType = 0;

  TimerUtil timerUtil = TimerUtil(mInterval: 1000 * 10);

  late FocusNode amountFocus = FocusNode();

  @override
  void onInit() {
    super.onInit();
    timerUtil.setOnTimerTickCallback((millisUntilFinished) {
      onRefresh();
      Bus.instance.fire(RxEvent.refreshUsdtRate);
    });
    timerUtil.startTimer();

    hideKeyboard();
    showLoading();
  }

  @override
  void onReady() {
    super.onReady();
    onRefresh();
  }

  updateProtocol(String protocol) {
    _selectedProtocol.value = protocol;
  }

  void selectPayType(UiPayType e) {
    if (e.isExpand) {
      showMore.value = e.id == '-1';
      return;
    }

    _selectedPayType.value = e;
  }

  Widget getDepositInput(
    DepositEasyController controller,
    UiPayType? type,
    GestureTapCallback? serviceTap,
    Color? titleColor,
  ) {
    if (type == null) return const SizedBox.shrink();
    switch (type.id) {
      case '2160': //usdt
        return EasyCryptocurrencyDepositInput(
          key: ValueKey(type.id),
          payType: type,
          controller: controller,
          serviceTap: serviceTap,
          titleColor: titleColor,
        );
      case '2161':
        return BaiMaView(type, controller, serviceTap);
      default:
        if (type.payType == 3) {
          type.iconUrl = Assets.images.icon.iconDepositUsdt.path;
          return Container(
            margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: UniversalDepositInput3(
              key: ValueKey(type.id),
              amountFocus: amountFocus,
              payType: type,
              amountValidator: closedRangeValidator(
                type.depositMinAmount ?? 0,
                type.isClosed ? 100000000000 : (type.depositMaxAmount ?? 0),
              ),
              serviceTap: serviceTap,
            ),
          );
        }

        return Container(
          margin: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: UniversalDepositInput2(
            key: ValueKey(type.id),
            amountFocus: amountFocus,
            payType: type,
            amountValidator: closedRangeValidator(
              type.depositMinAmount ?? 0,
              type.isClosed ? 100000000000 : type.depositMaxAmount ?? 0,
            ),
            serviceTap: serviceTap,
          ),
        );
    }
  }

  Future<void> onRefresh() async {
    if (_isRequesting.value) {
      return;
    }
    _isRequesting.value = true;
    List<UiPayType> realList = [];
    List<UiPayType> realList2 = [];
    final newList =
        await repository.getAllChannel(usdtAddressMap, _selectedProtocol);
    realList2.addAll(newList);
    if (realList2.length > 8) {
      realList = realList2.sublist(0, 8);
      realList.add(UiPayType(id: '-1'));
      realList2.add(UiPayType(id: '-2'));
    } else {
      realList.addAll(realList2);
    }

    if (_selectedPayType.value != null && realList2.isNotEmpty) {
      String id = _selectedPayType.value?.id ?? '';
      String name = _selectedPayType.value?.name ?? '';
      name = id + name;
      for (var element in realList2) {
        if (element.id + element.name == name) {
          _selectedPayType.value = element;
        }
      }
    }

    if ((realList2.isNotEmpty && _selectedPayType.value == null) ||
        realList2.length == 1) {
      _selectedPayType.value = realList2.first;
    }

    _payTypes.value = realList;
    _payTypes2.value = realList2;
    state.refreshController.refreshCompleted();
    _isRequesting.value = false;
    eventBus.fire(DepositRefreshEvent());
    dismissLoading();
  }

  @override
  void onClose() {
    amountFocus.dispose();
    Store.isAutoFocus = false;

    state.scrollController.dispose();
    state.refreshController.dispose();
    timerUtil.cancel();
    super.onClose();
  }
}

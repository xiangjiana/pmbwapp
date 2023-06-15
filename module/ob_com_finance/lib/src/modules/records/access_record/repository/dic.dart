import 'package:get/get.dart';
import 'dart:ui';

import 'package:ob_com_finance/src/modules/finance/deposit/repository/dic.dart';

Map<String, dynamic> get WITHDRAWAL_STATUS_FILTER_DIC => {
  '': 'bet_histories_all'.tr,
  '0': 'record_handling'.tr,
  '1': 'record_success'.tr,
  '2': 'record_failed'.tr,
};

Map<String, String> get WITHDRAWAL_TYPE_FILTER_DIC => {
  '': 'access_record_all'.tr,
  '1': 'access_record_bank_card'.tr,
  '2': 'access_record_virtual_currency'.tr,
  '3': 'access_record_manual_scoring'.tr,
};

Map<String, String> get DEPOSIT_STATUS_FILTER_DIC => {
  '': 'bet_histories_all'.tr,
  '0': 'record_handling'.tr,
  '1': 'record_success'.tr,
  '2': 'record_failed'.tr,
};

Map<int, dynamic> get DEPOSIT_PAY_TYPE_DIC => PayTypeNameDic;

Map<int, String> get WITHDRAW_STATUS_DIC => {
  0: 'record_handling'.tr,
  1: 'record_success'.tr,
  2: 'record_failed'.tr,
};

const WITHDRAW_STATUS_COLOR_DIC = const {
  0: Color(0xffE1A100),
  1: Color(0xff69E300),
  2: Color(0xffFF5722),
};

Map<int, String> get DEPOSIT_STATUS_DIC => {
  1: 'record_handling'.tr,
  2: 'record_failed'.tr,
  3: 'record_success'.tr,
};

const DEPOSIT_STATUS_COLOR_DIC = const {
  1: Color(0xffE1A100),
  2: Color(0xffFF5722),
  3: Color(0xff69E300),
  4: Color(0xffFF5722),
};
//交易类型0=存款,2=后台人工加额存款,3=上级代理转下级会员,4=代理自身余额转中心钱包（为空时查询全部）
Map<int, String> get BIZTYPE_DIC => {
  1: 'access_record_deposit'.tr,
  2: 'access_record_withdraw_money'.tr,
  3: 'access_record_manual_top_up_deposit'.tr,
  4: 'access_record_manual_reduction_withdrawal'.tr,
  5: 'access_record_proxy_deposit'.tr,
};

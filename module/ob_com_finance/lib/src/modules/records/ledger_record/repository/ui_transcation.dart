import 'package:get/get.dart';
//1-存款，2-取款,3-转账，4-返水,5-优惠活动,6-VIP优惠,7-其他,
// deposit(1, "存款"),
// withdraw(2, "取款"),
// transfer(3, "转账"),
// rebate(4, "返水"),
// activity(5, "活动优惠"),
// reward(6, "会员福利"),
// other(7, "其他"),
// deposit_discount(8, "存款优惠"),
//这里不能写死变量否则多语言切换无效
List TRANSACTION_DIC() => [
  UiTranscation(
    Transaction.All,
    'ledger_record_all'.tr,
    '',
    '',
  ),
  UiTranscation(
    Transaction.DEPOSIT,
    'ledger_record_deposit'.tr,
    '1',
    'assets/images/record/record_deposit.webp',
  ),
  UiTranscation(
    Transaction.WITHDRAW,
    'ledger_record_withdraw_money'.tr,
    '2',
    'assets/images/record/record_withdrawal.webp',
  ),
  UiTranscation(
    Transaction.TRANSFER,
    'ledger_record_transfer'.tr,
    '3',
    'assets/images/record/record_transfer.webp',
  ),
  UiTranscation(
    Transaction.REBATE,
    'ledger_record_rebate'.tr,
    '4',
    'assets/images/record/record_return.webp',
  ),
  // UiTranscation(
  //   Transaction.MEMBER_ACTIVITY,
  //   'ledger_record_member_activities'.tr,
  //   '5',
  //   'assets/images/record/record_member.webp',
  // ),
  UiTranscation(
    Transaction.MEMBER_ACTIVITY,
    'ledger_record_member_activities'.tr,
    '5',
    'assets/images/record/record_member.webp',
  ),
  UiTranscation(
    Transaction.VIP_WELFARE,
    'ledger_record_v_i_pbenefits'.tr,
    '6',
    'assets/images/record/record_vip.webp',
  ),
  UiTranscation(
    Transaction.DEPOSIT_DISCOUNT,
    'deposit_preference'.tr,
    '8',
    'assets/images/record/record_discount.webp',
  ),
  UiTranscation(
    Transaction.OTHERS,
    'ledger_record_other'.tr,
    '7',
    'assets/images/record/record_other.webp',
  ),
];

class UiTranscation {
  final Transaction type;
  final String title;
  final String code;
  final String icon;

  const UiTranscation(this.type, this.title, this.code, this.icon);
}

enum Transaction {
  All,
  DEPOSIT,
  TRANSFER,
  WITHDRAW,
  REBATE,
  VIP_WELFARE,
  MEMBER_ACTIVITY,
  OTHERS,
  DEPOSIT_DISCOUNT,
}
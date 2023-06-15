import 'dart:ui';
import 'package:get/get.dart';

class UiAccessRecordDetail {
  final String bizType;
  final String createdAt;
  final String id;
  final String orderAmount;
  final String orderStatus;
  final String payType; //支付名称中文
  final String remark;
  final String iconUrl;
  final Color statusColor;
  final bool isWithdraw; //是取款还是存款 客户端辅助属性
  final String withdrawAccountNo; //取款的银行卡账号或虚拟币账号
  final String withdrawBank; //取款的银行
  final String withdrawBankAddress; //虚拟币提款的协议
  final String depositType; //存款类型
  final String withdrawType; //取款类型

  UiAccessRecordDetail({
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.orderStatus,
    required this.payType,
    required this.remark,
    required this.iconUrl,
    required this.statusColor,
    required this.isWithdraw,
    required this.withdrawAccountNo,
    required this.withdrawBank,
    required this.withdrawBankAddress,
    required this.depositType,
    required this.withdrawType,
  });

  String get showPayType {
    if (payType == 'access_record_manual_down'.tr || payType == 'access_record_manual_up'.tr) return '--';
    if (payType == 'access_record_alipay_scan_code'.tr) return 'access_record_deposit'.tr;
    return payType;
  }

  String get accountLastFour {
    String lastFour = this.withdrawAccountNo.length > 4
        ? this.withdrawAccountNo.substring(this.withdrawAccountNo.length - 4)
        : this.withdrawAccountNo;
    return lastFour.length == 0 ? '--' : lastFour;
  }
}

class UiAccessRecord {
  final String daily;
  final List<UiAccessRecordDetail> details;

  UiAccessRecord(this.daily, this.details);
}

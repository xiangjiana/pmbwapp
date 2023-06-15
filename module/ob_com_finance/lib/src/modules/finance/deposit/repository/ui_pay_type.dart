import 'dart:ui';

import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';

class UiPayType {
  String iconUrl;
  final int? depositMaxAmount;
  int needFlag = 0;
  int needRealNameFlag = 1;
  final int? depositMinAmount;
  final List<String> fixedAmount;
  final List<String> virtualProtocols;
  final double activityDiscountScale;
  final double activityGiveMaxMoney;
  final List<BankNameResp> bankDtoList;
  String id;
  final int payType;
  String name;
  final List<Color> defaultColor;
  final FontWeight fontWeight;
  final Color fontColor;
  final String picture;
  final PaymentChannelConfig? realObj;

  bool get isExpand => id == '-1' || id == '-2';

  bool get isClosed => 0 == depositMaxAmount && 0 == depositMinAmount;

  UiPayType({
    this.iconUrl = '',
    this.depositMaxAmount = 0,
    this.depositMinAmount = 0,
    this.fixedAmount = const <String>[],
    this.virtualProtocols = const <String>[],
    this.id = '',
    this.payType = 0,
    this.needFlag = 0,
    this.activityDiscountScale = 0,
    this.activityGiveMaxMoney = 0,
    this.name = '',
    this.defaultColor = const <Color>[Color(0x0FFFFFFF), Color(0x0FFFFFFF)],
    this.fontWeight = FontWeight.w400,
    this.fontColor = const Color(0x99FFFFFF),
    this.picture = '',
    this.realObj,
    this.bankDtoList = const [],
  });

  factory UiPayType.from(PaymentChannelConfig realObj) {
    var logo = Assets.images.deposit.o2bFangshiCard.path;
    if (realObj.payType == 3) {
      logo = Assets.images.icon.iconDepositUsdt.path;
    }

    // String fastAmount = String.fromCharCodes(realObj.fastAmount.where((e) {
    //   // var v = NullUtils.toDouble(e).toInt();
    //   var min = realObj.minAmount.toInt();
    //   var max = realObj.maxAmount.toInt();
    //   if (min == 0 && max == 0) {
    //     return true;
    //   }
    //   return true;
    // }).toList());
    String fastAmount = '';
    if (realObj.fastAmount.length > 0) {
      for (int i = 0; i < realObj.fastAmount.length; i++) {
        if (i != realObj.fastAmount.length - 1) {
          fastAmount += '${realObj.fastAmount[i].toInt().toString()},';
        } else {
          fastAmount += realObj.fastAmount[i].toInt().toString();
        }
      }
    }
    return UiPayType(
      id: realObj.id,
      name: realObj.channelName,
      realObj: realObj,
      iconUrl: logo,
      needFlag: realObj.needFlag,
      bankDtoList: realObj.bankList,
      fixedAmount: fastAmount.length > 0 ? fastAmount.split(",") : [],
      virtualProtocols: realObj.virtualProtocol.split(","),
      payType: realObj.payType,
      depositMaxAmount: realObj.maxAmount.toInt(),
      depositMinAmount: realObj.minAmount.toInt(),
      activityDiscountScale: realObj.discountScale.toDouble(),
      activityGiveMaxMoney: realObj.maxQuota.toDouble(),
    );
  }
}

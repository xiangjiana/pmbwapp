import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2ProfitDayDataPostRespModel {
  ProxySystem2ProfitDayDataPostRespModel({
    required this.betAmountTotal,
    required this.gameProfit,
    required this.listElement,
    required this.totalRushAmount,
  });

  factory ProxySystem2ProfitDayDataPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2ProfitDayDataPostRespModel_ListElement>? listElement =
        jsonRes['list'] is List ? <ProxySystem2ProfitDayDataPostRespModel_ListElement>[] : null;
    if (listElement != null) {
      for (final dynamic item in jsonRes['list']!) {
        if (item != null) {
          listElement.add(ProxySystem2ProfitDayDataPostRespModel_ListElement.fromJson(
              asT<Map<String, dynamic>>("list", item)!));
        }
      }
    }
    return ProxySystem2ProfitDayDataPostRespModel(
      betAmountTotal: jsonRes['betAmountTotal'] == null
          ? 0.0
          : asT<double>("betAmountTotal", jsonRes['betAmountTotal'])!,
      gameProfit: jsonRes['gameProfit'] == null
          ? 0.0
          : asT<double>("gameProfit", jsonRes['gameProfit'])!,
      listElement: listElement == null ? [] : listElement,
      totalRushAmount: jsonRes['totalRushAmount'] == null
          ? 0.0
          : asT<double>("totalRushAmount", jsonRes['totalRushAmount'])!,
    );
  }

  double betAmountTotal = 0.0;
  double gameProfit = 0.0;
  List<ProxySystem2ProfitDayDataPostRespModel_ListElement> listElement;
  double totalRushAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmountTotal': betAmountTotal,
        'gameProfit': gameProfit,
        'list': listElement,
        'totalRushAmount': totalRushAmount,
      };
}

class ProxySystem2ProfitDayDataPostRespModel_ListElement {
  ProxySystem2ProfitDayDataPostRespModel_ListElement({
    required this.betTotalAmount,
    required this.gameCode,
    required this.gameProfitAmount,
  });

  factory ProxySystem2ProfitDayDataPostRespModel_ListElement.fromJson(Map<String, dynamic> jsonRes) => ProxySystem2ProfitDayDataPostRespModel_ListElement(
        betTotalAmount: jsonRes['betTotalAmount'] == null
            ? 0.0
            : asT<double>("betTotalAmount", jsonRes['betTotalAmount'])!,
        gameCode: jsonRes['gameCode'] == null
            ? ''
            : asT<String>("gameCode", jsonRes['gameCode'])!,
        gameProfitAmount: jsonRes['gameProfitAmount'] == null
            ? 0.0
            : asT<double>("gameProfitAmount", jsonRes['gameProfitAmount'])!,
      );

  double betTotalAmount = 0.0;
  String gameCode = '';
  double gameProfitAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betTotalAmount': betTotalAmount,
        'gameCode': gameCode,
        'gameProfitAmount': gameProfitAmount,
      };
}

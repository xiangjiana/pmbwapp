import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2ProfitMonthDetailPostRespModel {
  ProxySystem2ProfitMonthDetailPostRespModel({
    required this.data,
  });

  factory ProxySystem2ProfitMonthDetailPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2ProfitMonthDetailPostRespModel_Data>? data = jsonRes['data'] is List ? <ProxySystem2ProfitMonthDetailPostRespModel_Data>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxySystem2ProfitMonthDetailPostRespModel_Data.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxySystem2ProfitMonthDetailPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxySystem2ProfitMonthDetailPostRespModel_Data> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxySystem2ProfitMonthDetailPostRespModel_Data {
  ProxySystem2ProfitMonthDetailPostRespModel_Data({
    required this.betTotalAmount,
    required this.changeInfoAmount,
    required this.discountAmount,
    required this.eventDay,
    required this.gameProfit,
    required this.orderRateAmount,
    required this.rebateAmount,
    required this.validBetAmount,
  });

  factory ProxySystem2ProfitMonthDetailPostRespModel_Data.fromJson(Map<String, dynamic> jsonRes) => ProxySystem2ProfitMonthDetailPostRespModel_Data(
        betTotalAmount: jsonRes['betTotalAmount'] == null
            ? 0.0
            : asT<double>("betTotalAmount", jsonRes['betTotalAmount'])!,
        changeInfoAmount: jsonRes['changeInfoAmount'] == null
            ? 0.0
            : asT<double>("changeInfoAmount", jsonRes['changeInfoAmount'])!,
        discountAmount: jsonRes['discountAmount'] == null
            ? 0.0
            : asT<double>("discountAmount", jsonRes['discountAmount'])!,
        eventDay: jsonRes['eventDay'] == null
            ? ''
            : asT<String>("eventDay", jsonRes['eventDay'])!,
        gameProfit: jsonRes['gameProfit'] == null
            ? 0.0
            : asT<double>("gameProfit", jsonRes['gameProfit'])!,
        orderRateAmount: jsonRes['orderRateAmount'] == null
            ? 0.0
            : asT<double>("orderRateAmount", jsonRes['orderRateAmount'])!,
        rebateAmount: jsonRes['rebateAmount'] == null
            ? 0.0
            : asT<double>("rebateAmount", jsonRes['rebateAmount'])!,
        validBetAmount: jsonRes['validBetAmount'] == null
            ? 0.0
            : asT<double>("validBetAmount", jsonRes['validBetAmount'])!,
      );

  double betTotalAmount = 0.0;
  double changeInfoAmount = 0.0;
  double discountAmount = 0.0;
  String eventDay = '';
  double gameProfit =0.0;
  double orderRateAmount = 0.0;
  double rebateAmount = 0.0;
  double validBetAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betTotalAmount': betTotalAmount,
        'changeInfoAmount': changeInfoAmount,
        'discountAmount': discountAmount,
        'eventDay': eventDay,
        'gameProfit': gameProfit,
        'orderRateAmount': orderRateAmount,
        'rebateAmount': rebateAmount,
        'validBetAmount': validBetAmount,
      };
}

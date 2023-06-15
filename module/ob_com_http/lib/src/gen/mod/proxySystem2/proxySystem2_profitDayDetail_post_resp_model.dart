import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2ProfitDayDetailPostRespModel {
  ProxySystem2ProfitDayDetailPostRespModel({
    required this.dayDetailRespDTO,
    required this.monthDetailRespDTO,
  });

  factory ProxySystem2ProfitDayDetailPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxySystem2ProfitDayDetailPostRespModel(
        dayDetailRespDTO: jsonRes["dayDetailRespDTO"] == null
            ? DayDetailRespDTO.fromJson({})
            : DayDetailRespDTO.fromJson(asT<Map<String, dynamic>>(
                "dayDetailRespDTO", jsonRes["dayDetailRespDTO"])!),
        monthDetailRespDTO: jsonRes["monthDetailRespDTO"] == null
            ? MonthDetailRespDTO.fromJson({})
            : MonthDetailRespDTO.fromJson(asT<Map<String, dynamic>>(
                "monthDetailRespDTO", jsonRes["monthDetailRespDTO"])!),
      );

  DayDetailRespDTO dayDetailRespDTO;
  MonthDetailRespDTO monthDetailRespDTO;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'dayDetailRespDTO': dayDetailRespDTO,
        'monthDetailRespDTO': monthDetailRespDTO,
      };
}

class DayDetailRespDTO {
  DayDetailRespDTO({
    required this.betTotalAmount,
    required this.changeInfoAmount,
    required this.discountAmount,
    required this.eventDay,
    required this.gameProfit,
    required this.orderRateAmount,
    required this.rebateAmount,
    required this.validBetAmount,
  });

  factory DayDetailRespDTO.fromJson(Map<String, dynamic> jsonRes) =>
      DayDetailRespDTO(
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
  double gameProfit = 0.0;
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

class MonthDetailRespDTO {
  MonthDetailRespDTO({
    required this.changeInfoRefundAmount,
    required this.dayDetailRespDTOList,
    required this.discountRefundAmount,
    required this.lastMonthBalanceAmount,
    required this.netProfitAmount,
    required this.orderRateRefundAmount,
    required this.totalPlatformAmount,
    required this.totalRushAmount,
    required this.otherAdjustBackAmount,
  });

  factory MonthDetailRespDTO.fromJson(Map<String, dynamic> jsonRes) {
    final List<DayDetailRespDTOList>? dayDetailRespDTOList =
        jsonRes['dayDetailRespDTOList'] is List
            ? <DayDetailRespDTOList>[]
            : null;
    if (dayDetailRespDTOList != null) {
      for (final dynamic item in jsonRes['dayDetailRespDTOList']!) {
        if (item != null) {
          dayDetailRespDTOList.add(DayDetailRespDTOList.fromJson(
              asT<Map<String, dynamic>>("dayDetailRespDTOList", item)!));
        }
      }
    }
    return MonthDetailRespDTO(
      changeInfoRefundAmount: jsonRes['changeInfoRefundAmount'] == null
          ? 0.0
          : asT<double>(
              "changeInfoRefundAmount", jsonRes['changeInfoRefundAmount'])!,
      dayDetailRespDTOList:
          dayDetailRespDTOList == null ? [] : dayDetailRespDTOList,
      discountRefundAmount: jsonRes['discountRefundAmount'] == null
          ? 0.0
          : asT<double>(
              "discountRefundAmount", jsonRes['discountRefundAmount'])!,
      lastMonthBalanceAmount: jsonRes['lastMonthBalanceAmount'] == null
          ? 0.0
          : asT<double>(
              "lastMonthBalanceAmount", jsonRes['lastMonthBalanceAmount'])!,
      netProfitAmount: jsonRes['netProfitAmount'] == null
          ? 0.0
          : asT<double>("netProfitAmount", jsonRes['netProfitAmount'])!,
      orderRateRefundAmount: jsonRes['orderRateRefundAmount'] == null
          ? 0.0
          : asT<double>(
              "orderRateRefundAmount", jsonRes['orderRateRefundAmount'])!,

      otherAdjustBackAmount: jsonRes['otherAdjustBackAmount'] == null
            ? 0.0
            : asT<double>(
            "otherAdjustBackAmount", jsonRes['otherAdjustBackAmount'])!,
      totalPlatformAmount: jsonRes['totalPlatformAmount'] == null
          ? 0.0
          : asT<double>("totalPlatformAmount", jsonRes['totalPlatformAmount'])!,
      totalRushAmount: jsonRes['totalRushAmount'] == null
          ? 0.0
          : asT<double>("totalRushAmount", jsonRes['totalRushAmount'])!,
    );
  }

  double changeInfoRefundAmount = 0.0;
  List<DayDetailRespDTOList> dayDetailRespDTOList;
  double discountRefundAmount = 0.0;
  double lastMonthBalanceAmount = 0.0;
  double netProfitAmount = 0.0;
  double orderRateRefundAmount = 0.0;
  double otherAdjustBackAmount = 0.0;
  double totalPlatformAmount = 0.0;
  double totalRushAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'changeInfoRefundAmount': changeInfoRefundAmount,
        'dayDetailRespDTOList': dayDetailRespDTOList,
        'discountRefundAmount': discountRefundAmount,
        'lastMonthBalanceAmount': lastMonthBalanceAmount,
        'netProfitAmount': netProfitAmount,
        'orderRateRefundAmount': orderRateRefundAmount,
        'totalPlatformAmount': totalPlatformAmount,
        'totalRushAmount': totalRushAmount,
      };
}

class DayDetailRespDTOList {
  DayDetailRespDTOList({
    required this.betTotalAmount,
    required this.changeInfoAmount,
    required this.discountAmount,
    required this.eventDay,
    required this.gameProfit,
    required this.orderRateAmount,
    required this.rebateAmount,
    required this.validBetAmount,
  });

  factory DayDetailRespDTOList.fromJson(Map<String, dynamic> jsonRes) =>
      DayDetailRespDTOList(
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
  double gameProfit = 0.0;
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

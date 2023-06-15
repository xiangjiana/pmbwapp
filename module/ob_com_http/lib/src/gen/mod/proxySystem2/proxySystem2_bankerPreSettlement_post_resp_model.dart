import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxySystem2BankerPreSettlementPostRespModel {
  ProxySystem2BankerPreSettlementPostRespModel({
    required this.adjustRushAmount,
    required this.countStatus,
    required this.discountAmount,
    required this.discountBackAmount,
    required this.lastMonthAmount,
     this.data,
    required this.listElement,
    required this.lockPlatFee,
    required this.lockVenueAmount,
    required this.memberDepositWithdrawFeeAmount,
    required this.memberDepositWithdrawFeeBackAmount,
    required this.netAmount,
    required this.orderStatus,
    required this.otherAdjustAmount,
    required this.otherBackAmount,
    required this.platFee,
    required this.platRate,
    required this.reportYm,
    required this.returnWaterAmount,
    required this.rushAmount,
    required this.venueAmount,
  });

  factory ProxySystem2BankerPreSettlementPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerPreSettlementPostRespModel_ListElement>? listElement =
    jsonRes['list'] is List ? <ProxySystem2BankerPreSettlementPostRespModel_ListElement>[] : null;
    if (listElement != null) {
      for (final dynamic item in jsonRes['list']!) {
        if (item != null) {
          listElement.add(ProxySystem2BankerPreSettlementPostRespModel_ListElement.fromJson(
              asT<Map<String, dynamic>>("list", item)!));
        }
      }
    }
    return ProxySystem2BankerPreSettlementPostRespModel(
      adjustRushAmount: jsonRes['adjustRushAmount'] == null
          ? 0.0
          : asT<double>("adjustRushAmount", jsonRes['adjustRushAmount'])!,
      countStatus: jsonRes['countStatus'] == null
          ? 0
          : asT<int>("countStatus", jsonRes['countStatus'])!,
      discountAmount: jsonRes['discountAmount'] == null
          ? 0.0
          : asT<double>("discountAmount", jsonRes['discountAmount'])!,
      discountBackAmount: jsonRes['discountBackAmount'] == null
          ? 0.0
          : asT<double>("discountBackAmount", jsonRes['discountBackAmount'])!,
      lastMonthAmount: jsonRes['lastMonthAmount'] == null
          ? 0.0
          : asT<double>("lastMonthAmount", jsonRes['lastMonthAmount'])!,
      data: jsonRes["data"] == null||(jsonRes["data"] as Map).length==0
          ? null
          : ProxySystem2BankerPreSettlementPostRespModel_Data.fromJson(asT<Map<String, dynamic>>("data", jsonRes["data"])!),
      listElement: listElement == null ? [] : listElement,
      lockPlatFee: jsonRes['lockPlatFee'] == null
          ? 0.0
          : asT<double>("lockPlatFee", jsonRes['lockPlatFee'])!,
      lockVenueAmount: jsonRes['lockVenueAmount'] == null
          ? 0.0
          : asT<double>("lockVenueAmount", jsonRes['lockVenueAmount'])!,
      memberDepositWithdrawFeeAmount:
      jsonRes['memberDepositWithdrawFeeAmount'] == null
          ? 0.0
          : asT<double>("memberDepositWithdrawFeeAmount",
          jsonRes['memberDepositWithdrawFeeAmount'])!,
      memberDepositWithdrawFeeBackAmount:
      jsonRes['memberDepositWithdrawFeeBackAmount'] == null
          ? 0.0
          : asT<double>("memberDepositWithdrawFeeBackAmount",
          jsonRes['memberDepositWithdrawFeeBackAmount'])!,
      netAmount: jsonRes['netAmount'] == null
          ? 0.0
          : asT<double>("netAmount", jsonRes['netAmount'])!,
      orderStatus: jsonRes['orderStatus'] == null
          ? 0
          : asT<int>("orderStatus", jsonRes['orderStatus'])!,
      otherAdjustAmount: jsonRes['otherAdjustAmount'] == null
          ? 0.0
          : asT<double>("otherAdjustAmount", jsonRes['otherAdjustAmount'])!,
      otherBackAmount: jsonRes['otherBackAmount'] == null
          ? 0.0
          : asT<double>("otherBackAmount", jsonRes['otherBackAmount'])!,
      platFee: jsonRes['platFee'] == null
          ? 0.0
          : asT<double>("platFee", jsonRes['platFee'])!,
      platRate: jsonRes['platRate'] == null
          ? 0.0
          : asT<double>("platRate", jsonRes['platRate'])!,
      reportYm: jsonRes['reportYm'] == null
          ? ''
          : asT<String>("reportYm", jsonRes['reportYm'])!,
      returnWaterAmount: jsonRes['returnWaterAmount'] == null
          ? 0.0
          : asT<double>("returnWaterAmount", jsonRes['returnWaterAmount'])!,
      rushAmount: jsonRes['rushAmount'] == null
          ? 0.0
          : asT<double>("rushAmount", jsonRes['rushAmount'])!,
      venueAmount: jsonRes['venueAmount'] == null
          ? 0.0
          : asT<double>("venueAmount", jsonRes['venueAmount'])!,
    );
  }

  double adjustRushAmount = 0.0;
  int countStatus = 0;
  double discountAmount = 0.0;
  double discountBackAmount = 0.0;
  double lastMonthAmount = 0.0;
  ProxySystem2BankerPreSettlementPostRespModel_Data? data;
  List<ProxySystem2BankerPreSettlementPostRespModel_ListElement> listElement;
  double lockPlatFee = 0.0;
  double lockVenueAmount = 0.0;
  double memberDepositWithdrawFeeAmount = 0.0;
  double memberDepositWithdrawFeeBackAmount = 0.0;
  double netAmount = 0.0;
  int orderStatus = 0;
  double otherAdjustAmount = 0.0;
  double otherBackAmount = 0.0;
  double platFee = 0.0;
  double platRate = 0.0;
  String reportYm = '';
  double returnWaterAmount = 0.0;
  double rushAmount = 0.0;
  double venueAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'adjustRushAmount': adjustRushAmount,
    'countStatus': countStatus,
    'discountAmount': discountAmount,
    'discountBackAmount': discountBackAmount,
    'lastMonthAmount': lastMonthAmount,
    'data': data,
    'list': listElement,
    'lockPlatFee': lockPlatFee,
    'lockVenueAmount': lockVenueAmount,
    'memberDepositWithdrawFeeAmount': memberDepositWithdrawFeeAmount,
    'memberDepositWithdrawFeeBackAmount':
    memberDepositWithdrawFeeBackAmount,
    'netAmount': netAmount,
    'orderStatus': orderStatus,
    'otherAdjustAmount': otherAdjustAmount,
    'otherBackAmount': otherBackAmount,
    'platFee': platFee,
    'platRate': platRate,
    'reportYm': reportYm,
    'returnWaterAmount': returnWaterAmount,
    'rushAmount': rushAmount,
    'venueAmount': venueAmount,
  };
}

class ProxySystem2BankerPreSettlementPostRespModel_Data {
  ProxySystem2BankerPreSettlementPostRespModel_Data({
    required this.adjustRushAmount,
    required this.countStatus,
    required this.discountAmount,
    required this.discountBackAmount,
    required this.lastMonthAmount,
    required this.listElement,
    required this.lockPlatFee,
    required this.lockVenueAmount,
    required this.memberDepositWithdrawFeeAmount,
    required this.memberDepositWithdrawFeeBackAmount,
    required this.netAmount,
    required this.orderStatus,
    required this.otherAdjustAmount,
    required this.otherBackAmount,
    required this.platFee,
    required this.platRate,
    required this.reportYm,
    required this.returnWaterAmount,
    required this.rushAmount,
    required this.venueAmount,
  });

  factory ProxySystem2BankerPreSettlementPostRespModel_Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProxySystem2BankerPreSettlementPostRespModel_ListElement>? listElement =
    jsonRes['list'] is List ? <ProxySystem2BankerPreSettlementPostRespModel_ListElement>[] : null;
    if (listElement != null) {
      for (final dynamic item in jsonRes['list']!) {
        if (item != null) {
          listElement.add(ProxySystem2BankerPreSettlementPostRespModel_ListElement.fromJson(
              asT<Map<String, dynamic>>("list", item)!));
        }
      }
    }
    return ProxySystem2BankerPreSettlementPostRespModel_Data(
      adjustRushAmount: jsonRes['adjustRushAmount'] == null
          ? 0.0
          : asT<double>("adjustRushAmount", jsonRes['adjustRushAmount'])!,
      countStatus: jsonRes['countStatus'] == null
          ? 0
          : asT<int>("countStatus", jsonRes['countStatus'])!,
      discountAmount: jsonRes['discountAmount'] == null
          ? 0.0
          : asT<double>("discountAmount", jsonRes['discountAmount'])!,
      discountBackAmount: jsonRes['discountBackAmount'] == null
          ? 0.0
          : asT<double>("discountBackAmount", jsonRes['discountBackAmount'])!,
      lastMonthAmount: jsonRes['lastMonthAmount'] == null
          ? 0.0
          : asT<double>("lastMonthAmount", jsonRes['lastMonthAmount'])!,
      listElement: listElement == null ? [] : listElement,
      lockPlatFee: jsonRes['lockPlatFee'] == null
          ? 0.0
          : asT<double>("lockPlatFee", jsonRes['lockPlatFee'])!,
      lockVenueAmount: jsonRes['lockVenueAmount'] == null
          ? 0.0
          : asT<double>("lockVenueAmount", jsonRes['lockVenueAmount'])!,
      memberDepositWithdrawFeeAmount:
      jsonRes['memberDepositWithdrawFeeAmount'] == null
          ? 0.0
          : asT<double>("memberDepositWithdrawFeeAmount",
          jsonRes['memberDepositWithdrawFeeAmount'])!,
      memberDepositWithdrawFeeBackAmount:
      jsonRes['memberDepositWithdrawFeeBackAmount'] == null
          ? 0.0
          : asT<double>("memberDepositWithdrawFeeBackAmount",
          jsonRes['memberDepositWithdrawFeeBackAmount'])!,
      netAmount: jsonRes['netAmount'] == null
          ? 0.0
          : asT<double>("netAmount", jsonRes['netAmount'])!,
      orderStatus: jsonRes['orderStatus'] == null
          ? 0
          : asT<int>("orderStatus", jsonRes['orderStatus'])!,
      otherAdjustAmount: jsonRes['otherAdjustAmount'] == null
          ? 0.0
          : asT<double>("otherAdjustAmount", jsonRes['otherAdjustAmount'])!,
      otherBackAmount: jsonRes['otherBackAmount'] == null
          ? 0.0
          : asT<double>("otherBackAmount", jsonRes['otherBackAmount'])!,
      platFee: jsonRes['platFee'] == null
          ? 0.0
          : asT<double>("platFee", jsonRes['platFee'])!,
      platRate: jsonRes['platRate'] == null
          ? 0.0
          : asT<double>("platRate", jsonRes['platRate'])!,
      reportYm: jsonRes['reportYm'] == null
          ? ''
          : asT<String>("reportYm", jsonRes['reportYm'])!,
      returnWaterAmount: jsonRes['returnWaterAmount'] == null
          ? 0.0
          : asT<double>("returnWaterAmount", jsonRes['returnWaterAmount'])!,
      rushAmount: jsonRes['rushAmount'] == null
          ? 0.0
          : asT<double>("rushAmount", jsonRes['rushAmount'])!,
      venueAmount: jsonRes['venueAmount'] == null
          ? 0.0
          : asT<double>("venueAmount", jsonRes['venueAmount'])!,
    );
  }

  double adjustRushAmount = 0.0;
  int countStatus = 0;
  double discountAmount = 0.0;
  double discountBackAmount = 0.0;
  double lastMonthAmount = 0.0;
  List<ProxySystem2BankerPreSettlementPostRespModel_ListElement> listElement;
  double lockPlatFee = 0.0;
  double lockVenueAmount = 0.0;
  double memberDepositWithdrawFeeAmount = 0.0;
  double memberDepositWithdrawFeeBackAmount = 0.0;
  double netAmount = 0.0;
  int orderStatus = 0;
  double otherAdjustAmount = 0.0;
  double otherBackAmount = 0.0;
  double platFee = 0.0;
  double platRate = 0.0;
  String reportYm = '';
  double returnWaterAmount = 0.0;
  double rushAmount = 0.0;
  double venueAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'adjustRushAmount': adjustRushAmount,
    'countStatus': countStatus,
    'discountAmount': discountAmount,
    'discountBackAmount': discountBackAmount,
    'lastMonthAmount': lastMonthAmount,
    'listElement': listElement,
    'lockPlatFee': lockPlatFee,
    'lockVenueAmount': lockVenueAmount,
    'memberDepositWithdrawFeeAmount': memberDepositWithdrawFeeAmount,
    'memberDepositWithdrawFeeBackAmount':
    memberDepositWithdrawFeeBackAmount,
    'netAmount': netAmount,
    'orderStatus': orderStatus,
    'otherAdjustAmount': otherAdjustAmount,
    'otherBackAmount': otherBackAmount,
    'platFee': platFee,
    'platRate': platRate,
    'reportYm': reportYm,
    'returnWaterAmount': returnWaterAmount,
    'rushAmount': rushAmount,
    'venueAmount': venueAmount,
  };
}

class ProxySystem2BankerPreSettlementPostRespModel_ListElement {
  ProxySystem2BankerPreSettlementPostRespModel_ListElement({
    required this.gameLoss,
    required this.id,
    required this.profitSharingRatio,
  });

  factory ProxySystem2BankerPreSettlementPostRespModel_ListElement.fromJson(Map<String, dynamic> jsonRes) => ProxySystem2BankerPreSettlementPostRespModel_ListElement(
    gameLoss: jsonRes['gameLoss'] == null
        ? 0.0
        : asT<double>("gameLoss", jsonRes['gameLoss'])!,
    id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
    profitSharingRatio: jsonRes['profitSharingRatio'] == null
        ? 0.0
        : asT<double>("profitSharingRatio", jsonRes['profitSharingRatio'])!,
  );

  double gameLoss = 0.0;
  int id = 0;
  double profitSharingRatio = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'gameLoss': gameLoss,
    'id': id,
    'profitSharingRatio': profitSharingRatio,
  };
}


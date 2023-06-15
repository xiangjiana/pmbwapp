import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:repository/utils/net.dart';

import '../../ob_com_http.dart';

abstract class ThirdPayChannel {
  static const String url = '/wallet/channel';

  static void post({
    Function(List<ApiThirdPayChannel>)? success,
    Function(int, String)? fail,
  }) {
    Net().post(
      url,
      params: {},
      success: (Response r) {
        success?.call((r.data['data'] as List).map((e) => ApiThirdPayChannel.fromMap(e)).toList());
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

class ApiThirdPayChannel {
  ApiThirdPayChannel({
    required this.fastAmount,
    required this.virtualProtocol,
    required this.maxAmount,
    required this.minAmount,
    required this.payType,
    required this.subPayTypeName,
    required this.channelName,
    required this.paymentChannelType,
    required this.paymentChannelName,
    required this.id,
    required this.needFlag,
    required this.needRealNameFlag,
    required this.discountScale,
    required this.maxQuota,
    required this.bankDtoList ,
  });

  final List<String> fastAmount;
  final List<String> virtualProtocol;
  final double maxAmount;
  final double minAmount;
  final int payType;
  final int needFlag;
  final int needRealNameFlag;
  final String subPayTypeName;
  final String channelName;
  final String paymentChannelName;
  final int paymentChannelType;
  final String id;
  final double discountScale;
  final double maxQuota;
  final List<BankDtoList> bankDtoList;

  factory ApiThirdPayChannel.fromMap(Map<String, dynamic> json) {

    final List<BankDtoList> bankDtoList = json['bankList'] is List ? <BankDtoList>[] : [];
    if (bankDtoList != null) {
      for (final dynamic item in json['bankList']!) {
        if (item != null) {
          bankDtoList.add(BankDtoList.fromJson(asT<Map<String, dynamic>>("bankList", item)!));
        }
      }
    }
    return ApiThirdPayChannel(
      fastAmount: List<String>.from(json["fastAmount"].map((x) => x.toString())),
      maxAmount: double.parse(json["maxAmount"].toString()),
      minAmount: double.parse(json["minAmount"].toString()),
      payType: json["payType"],
      needFlag:  json["needFlag"],
      needRealNameFlag:  json["needRealNameFlag"],
      subPayTypeName: json["payName"],
      channelName: json["channelName"],
      paymentChannelName: json["paymentChannelName"],
      paymentChannelType: json["paymentChannelType"],
      id: json["id"],
      discountScale: double.parse(json["discountScale"].toString()),
      maxQuota: double.parse(json["maxQuota"].toString()),
      virtualProtocol: (json["virtualProtocol"]).toString().split(','),
      bankDtoList:bankDtoList,
    );

  }
}



class BankDtoList {
  BankDtoList({
    required this.bankLogo,
    required this.bankName,
    required this.currency,
    required this.id,
    required this.merchantId,
  });

  factory BankDtoList.fromJson(Map<String, dynamic> jsonRes) => BankDtoList(
    bankLogo: jsonRes['bankLogo'] == null ? '' : asT<String>("bankLogo", jsonRes['bankLogo'])!,
    bankName: jsonRes['bankName'] == null ? '' : asT<String>("bankName", jsonRes['bankName'])!,
    currency: jsonRes['currency'] == null ? '' : asT<String>("currency", jsonRes['currency'])!,
    id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
    merchantId: jsonRes['merchantId'] == null ? '' : asT<String>("merchantId", jsonRes['merchantId'])!,
  );

  String bankLogo = '';
  String bankName = '';
  String currency = '';
  String id = '';
  String merchantId = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'bankLogo': bankLogo,
    'bankName': bankName,
    'currency': currency,
    'id': id,
    'merchantId': merchantId,
  };
}

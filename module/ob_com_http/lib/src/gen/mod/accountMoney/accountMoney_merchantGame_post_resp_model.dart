import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MainVenueByMerchantPostRespModel {
  MainVenueByMerchantPostRespModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory MainVenueByMerchantPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<MainVenueByMerchantPostRespModelData>? data = jsonRes['data'] is List ? <MainVenueByMerchantPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(MainVenueByMerchantPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return MainVenueByMerchantPostRespModel(
      code: jsonRes['code'] == null ? 0 : asT<int>("code", jsonRes['code'])!,
      msg: jsonRes['msg'] == null ? '' : asT<String>("msg", jsonRes['msg'])!,
      data: data == null ? [] : data,
    );
  }

  int code = 0;
  String msg = '';
  List<MainVenueByMerchantPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'code': code,
    'msg': msg,
    'data': data,
  };
}

class MainVenueByMerchantPostRespModelData {
  MainVenueByMerchantPostRespModelData({
    required this.id,
    required this.merchantCode,
    required this.merchantName,
    required this.venueCode,
    required this.venueName,
    required this.venueCurrency,
    required this.venueLanguages,
    required this.venueFeeRate,
    required this.venueConfig,
  });

  factory MainVenueByMerchantPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => MainVenueByMerchantPostRespModelData(
    id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
    merchantCode: jsonRes['merchantCode'] == null
        ? ''
        : asT<String>("merchantCode", jsonRes['merchantCode'])!,
    merchantName: jsonRes['merchantName'] == null
        ? ''
        : asT<String>("merchantName", jsonRes['merchantName'])!,
    venueCode: jsonRes['venueCode'] == null
        ? ''
        : asT<String>("venueCode", jsonRes['venueCode'])!,
    venueName: jsonRes['venueName'] == null
        ? ''
        : asT<String>("venueName", jsonRes['venueName'])!,
    venueCurrency: jsonRes['venueCurrency'] == null
        ? ''
        : asT<String>("venueCurrency", jsonRes['venueCurrency'])!,
    venueLanguages: jsonRes['venueLanguages'] == null
        ? ''
        : asT<String>("venueLanguages", jsonRes['venueLanguages'])!,
    venueFeeRate: jsonRes['venueFeeRate'] == null
        ? 0.0
        : asT<double>("venueFeeRate", jsonRes['venueFeeRate'])!,
    venueConfig: jsonRes['venueConfig'] == null
        ? ''
        : asT<String>("venueConfig", jsonRes['venueConfig'])!,
  );

  int id = 0;
  String merchantCode = '';
  String merchantName = '';
  String venueCode = '';
  String venueName = '';
  String venueCurrency = '';
  String venueLanguages = '';
  double venueFeeRate = 0.0;
  String venueConfig = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'id': id,
    'merchantCode': merchantCode,
    'merchantName': merchantName,
    'venueCode': venueCode,
    'venueName': venueName,
    'venueCurrency': venueCurrency,
    'venueLanguages': venueLanguages,
    'venueFeeRate': venueFeeRate,
    'venueConfig': venueConfig,
  };
}

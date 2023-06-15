import 'dart:convert';
import '../../../../ob_com_http.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryMerchantListPostRespModel {
  GameQueryMerchantListPostRespModel({
    required this.code,
    required this.msg,
    required this.data,
  });

  factory GameQueryMerchantListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<Data>? data = jsonRes['data'] is List ? <Data>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(Data.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return GameQueryMerchantListPostRespModel(
      code: jsonRes['code'] == null ? 0 : asT<int>("code", jsonRes['code'])!,
      msg: jsonRes['msg'] == null ? '' : asT<String>("msg", jsonRes['msg'])!,
      data: data == null ? [] : data,
    );
  }

  int code = 0;
  String msg = '';
  List<Data> data;

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

class Data {
  Data({
    required this.venueTypeCode,
    required this.venueList,
    required this.venueTypeIconUrl,
  });

  factory Data.fromJson(Map<String, dynamic> jsonRes) {
    final List<VenueList>? venueList =
        jsonRes['venueList'] is List ? <VenueList>[] : null;
    if (venueList != null) {
      for (final dynamic item in jsonRes['venueList']!) {
        if (item != null) {
          venueList.add(VenueList.fromJson(
              asT<Map<String, dynamic>>("venueList", item)!));
        }
      }
    }
    return Data(
      venueTypeCode: jsonRes['venueTypeCode'] == null
          ? ''
          : asT<String>("venueTypeCode", jsonRes['venueTypeCode'])!,
      venueTypeIconUrl: jsonRes['venueTypeIconUrl'] == null
          ? ''
          : asT<String>("venueTypeIconUrl", jsonRes['venueTypeIconUrl'])!,
      venueList: venueList == null ? [] : venueList,
    );
  }

  String venueTypeCode = '';
  String venueTypeIconUrl = '';
  VenueList? venueSelected;
  List<VenueList> venueList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueTypeCode': venueTypeCode,
        'venueList': venueList,
        'venueTypeIconUrl': venueTypeIconUrl,
      };
}

class VenueList {
  VenueList({
    required this.venueCode,
    required this.venueName,
    required this.venueType,
    required this.venueTypeName,
    required this.isOb,
    required this.status,
    required this.currencyTypes,
    required this.languageTypes,
    required this.venueIconUrlApp,
    required this.venueIconUrlPc,
    required this.venueTransferIconUrlApp,
    required this.venueTransferIconUrlPc,
    required this.walletNamesObject,
  });

  factory VenueList.fromJson(Map<String, dynamic> jsonRes) => VenueList(
        venueCode: jsonRes['venueCode'] == null
            ? ''
            : asT<String>("venueCode", jsonRes['venueCode'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
        venueType: jsonRes['venueType'] == null
            ? ''
            : asT<String>("venueType", jsonRes['venueType'])!,
        venueTypeName: jsonRes['venueTypeName'] == null
            ? ''
            : asT<String>("venueTypeName", jsonRes['venueTypeName'])!,
        isOb: jsonRes['isOb'] == null ? 0 : asT<int>("isOb", jsonRes['isOb'])!,
        status: jsonRes['status'] == null
            ? 0
            : asT<int>("status", jsonRes['status'])!,
        currencyTypes: jsonRes['currencyTypes'] == null
            ? ''
            : asT<String>("currencyTypes", jsonRes['currencyTypes'])!,
        languageTypes: jsonRes['languageTypes'] == null
            ? ''
            : asT<String>("languageTypes", jsonRes['languageTypes'])!,
        venueIconUrlApp: jsonRes['venueIconUrlApp'] == null
            ? ''
            : asT<String>("venueIconUrlApp", jsonRes['venueIconUrlApp'])!,
        venueIconUrlPc: jsonRes['venueIconUrlPc'] == null
            ? ''
            : asT<String>("venueIconUrlPc", jsonRes['venueIconUrlPc'])!,
        venueTransferIconUrlApp: jsonRes['venueTransferIconUrlApp'] == null
            ? ''
            : asT<String>(
                "venueTransferIconUrlApp", jsonRes['venueTransferIconUrlApp'])!,
        venueTransferIconUrlPc: jsonRes['venueTransferIconUrlPc'] == null
            ? ''
            : asT<String>(
                "venueTransferIconUrlPc", jsonRes['venueTransferIconUrlPc'])!,
        walletNamesObject: jsonRes["walletNamesObject"] == null
            ? WalletNamesObject.fromJson({})
            : WalletNamesObject.fromJson(asT<Map<String, dynamic>>(
                "walletNamesObject", jsonRes["walletNamesObject"])!),
      );

  String venueCode = '';
  String venueName = '';
  String venueType = '';
  String venueTypeName = '';
  int isOb = 0;
  int status = 0;
  String currencyTypes = '';
  String languageTypes = '';
  String venueIconUrlApp = '';
  String venueIconUrlPc = '';
  String venueTransferIconUrlApp = '';
  String venueTransferIconUrlPc = '';
  WalletNamesObject walletNamesObject;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueCode': venueCode,
        'venueName': venueName,
        'venueType': venueType,
        'venueTypeName': venueTypeName,
        'isOb': isOb,
        'status': status,
        'currencyTypes': currencyTypes,
        'languageTypes': languageTypes,
        'venueIconUrlApp': venueIconUrlApp,
        'venueIconUrlPc': venueIconUrlPc,
        'venueTransferIconUrlApp': venueTransferIconUrlApp,
        'venueTransferIconUrlPc': venueTransferIconUrlPc,
        'walletNamesObject': walletNamesObject,
      };
}

class WalletNamesObject {
  WalletNamesObject({
    required this.zhName,
    required this.thName,
    required this.vnName,
  });

  factory WalletNamesObject.fromJson(Map<String, dynamic> jsonRes) =>
      WalletNamesObject(
        zhName: jsonRes['zhName'] == null
            ? ''
            : asT<String>("zhName", jsonRes['zhName'])!,
        thName: jsonRes['thName'] == null
            ? ''
            : asT<String>("thName", jsonRes['thName'])!,
        vnName: jsonRes['vnName'] == null
            ? ''
            : asT<String>("vnName", jsonRes['vnName'])!,
      );

  String zhName = '';
  String thName = '';
  String vnName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'zhName': zhName,
        'thName': thName,
        'vnName': vnName,
      };
}

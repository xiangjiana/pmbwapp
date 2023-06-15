import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayBanksPostRespModel {
  TypayBanksPostRespModel({
    required this.data,
  });

  factory TypayBanksPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<TypayBanksPostRespModelData>? data = jsonRes['data'] is List ? <TypayBanksPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(TypayBanksPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return TypayBanksPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<TypayBanksPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class TypayBanksPostRespModelData {
  TypayBanksPostRespModelData({
    required this.bankCode,
    required this.bankName,
  });

  factory TypayBanksPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => TypayBanksPostRespModelData(
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        bankName: jsonRes['bankName'] == null
            ? ''
            : asT<String>("bankName", jsonRes['bankName'])!,
      );

  String bankCode = '';
  String bankName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bankCode': bankCode,
        'bankName': bankName,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ZrDepositWithdrawSelectPostRespModel {
  ZrDepositWithdrawSelectPostRespModel({
    required this.data,
  });

  factory ZrDepositWithdrawSelectPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ZrDepositWithdrawSelectPostRespModelData>? data = jsonRes['data'] is List ? <ZrDepositWithdrawSelectPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ZrDepositWithdrawSelectPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ZrDepositWithdrawSelectPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ZrDepositWithdrawSelectPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ZrDepositWithdrawSelectPostRespModelData {
  ZrDepositWithdrawSelectPostRespModelData({
    required this.amount,
    required this.changeAfter,
    required this.occurDt,
    required this.remark,
    required this.transType,
  });

  factory ZrDepositWithdrawSelectPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ZrDepositWithdrawSelectPostRespModelData(
        amount: jsonRes['amount'] == null
            ? 0.0
            : asT<double>("amount", jsonRes['amount'])!,
        changeAfter: jsonRes['changeAfter'] == null
            ? 0.0
            : asT<double>("changeAfter", jsonRes['changeAfter'])!,
        occurDt: jsonRes['occurDt'] == null
            ? ''
            : asT<String>("occurDt", jsonRes['occurDt'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        transType: jsonRes['transType'] == null
            ? 0
            : asT<int>("transType", jsonRes['transType'])!,
      );

  double amount = 0.0;
  double changeAfter = 0.0;
  String occurDt = '';
  String remark = '';
  int transType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'amount': amount,
        'changeAfter': changeAfter,
        'occurDt': occurDt,
        'remark': remark,
        'transType': transType,
      };
}

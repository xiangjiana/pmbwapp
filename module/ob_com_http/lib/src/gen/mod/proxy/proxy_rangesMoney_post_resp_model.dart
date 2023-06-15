import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRangesMoneyPostRespModel {
  ProxyRangesMoneyPostRespModel({
    required this.cash,
    required this.commission,
    required this.commissionAmount,
    required this.quotaAmount,
    required this.transfer,
  });

  factory ProxyRangesMoneyPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyRangesMoneyPostRespModel(
        cash: jsonRes['cash'] == null
            ? ''
            : asT<String>("cash", jsonRes['cash'])!,
        commission: jsonRes['commission'] == null
            ? ''
            : asT<String>("commission", jsonRes['commission'])!,
        commissionAmount: jsonRes['commissionAmount'] == null
            ? ''
            : asT<String>("commissionAmount", jsonRes['commissionAmount'])!,
        quotaAmount: jsonRes['quotaAmount'] == null
            ? ''
            : asT<String>("quotaAmount", jsonRes['quotaAmount'])!,
        transfer: jsonRes['transfer'] == null
            ? ''
            : asT<String>("transfer", jsonRes['transfer'])!,
      );

  String cash = '';
  String commission = '';
  String commissionAmount = '';
  String quotaAmount = '';
  String transfer = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cash': cash,
        'commission': commission,
        'commissionAmount': commissionAmount,
        'quotaAmount': quotaAmount,
        'transfer': transfer,
      };
}

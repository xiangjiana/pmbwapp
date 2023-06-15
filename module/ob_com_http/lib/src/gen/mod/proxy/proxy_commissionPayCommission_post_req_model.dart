import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyCommissionPayCommissionPostReqModel {
  ProxyCommissionPayCommissionPostReqModel({
    required this.payList,
    required this.payPassword,
  });

  factory ProxyCommissionPayCommissionPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<PayList>? payList =
        jsonRes['payList'] is List ? <PayList>[] : null;
    if (payList != null) {
      for (final dynamic item in jsonRes['payList']!) {
        if (item != null) {
          payList.add(
              PayList.fromJson(asT<Map<String, dynamic>>("payList", item)!));
        }
      }
    }
    return ProxyCommissionPayCommissionPostReqModel(
      payList: payList == null ? [] : payList,
      payPassword: jsonRes['payPassword'] == null
          ? ''
          : asT<String>("payPassword", jsonRes['payPassword'])!,
    );
  }

  List<PayList> payList;
  String payPassword = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payList': payList,
        'payPassword': payPassword,
      };
}

class PayList {
  PayList({
    required this.payAmount,
    required this.proxyId,
    required this.reportYm,
  });

  factory PayList.fromJson(Map<String, dynamic> jsonRes) => PayList(
        payAmount: jsonRes['payAmount'] == null
            ? 0.0
            : asT<double>("payAmount", jsonRes['payAmount'])!,
        proxyId: jsonRes['proxyId'] == null
            ? "0"
            : asT<String>("proxyId", jsonRes['proxyId'])!,
        reportYm: jsonRes['reportYm'] == null
            ? 0
            : asT<int>("reportYm", jsonRes['reportYm'])!,
      );

  double payAmount = 0.0;
  String proxyId = '0';
  int reportYm = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'payAmount': payAmount,
        'proxyId': proxyId,
        'reportYm': reportYm,
      };
}

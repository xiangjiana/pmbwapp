import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebateUnReceivePostRespModel {
  ProxyRebateUnReceivePostRespModel({
    required this.reportDateList,
    required this.personRebateAmount,
  });

  factory ProxyRebateUnReceivePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<int>? reportDateList =
        jsonRes['reportDateList'] is List ? <int>[] : null;
    if (reportDateList != null) {
      for (final dynamic item in jsonRes['reportDateList']!) {
        if (item != null) {
          reportDateList.add(asT<int>("reportDateList", item)!);
        }
      }
    }
    return ProxyRebateUnReceivePostRespModel(
      reportDateList: reportDateList == null ? [] : reportDateList,
      personRebateAmount: jsonRes['personRebateAmount'] == null
          ? 0.0
          : asT<double>("personRebateAmount", jsonRes['personRebateAmount'])!,
    );
  }

  List<int> reportDateList;
  double personRebateAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'reportDateList': reportDateList,
        'personRebateAmount': personRebateAmount,
      };
}

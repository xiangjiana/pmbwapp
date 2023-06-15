import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebatePayRebatePostReqModel {
  ProxyRebatePayRebatePostReqModel({
    required this.cycleType,
    required this.reportDateList,
  });

  factory ProxyRebatePayRebatePostReqModel.fromJson(
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
    return ProxyRebatePayRebatePostReqModel(
      cycleType: jsonRes['cycleType'] == null
          ? 0
          : asT<int>("cycleType", jsonRes['cycleType'])!,
      reportDateList: reportDateList == null ? [] : reportDateList,
    );
  }

  int cycleType = 0;
  List<int> reportDateList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'cycleType': cycleType,
        'reportDateList': reportDateList,
      };
}

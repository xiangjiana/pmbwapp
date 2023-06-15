import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyRebatePayRebatePostRespModel {
  ProxyRebatePayRebatePostRespModel({
    required this.failList,
    required this.successList,
  });

  factory ProxyRebatePayRebatePostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? failList =
        jsonRes['failList'] is List ? <String>[] : null;
    if (failList != null) {
      for (final dynamic item in jsonRes['failList']!) {
        if (item != null) {
          failList.add(asT<String>("failList", item)!);
        }
      }
    }

    final List<String>? successList =
        jsonRes['successList'] is List ? <String>[] : null;
    if (successList != null) {
      for (final dynamic item in jsonRes['successList']!) {
        if (item != null) {
          successList.add(asT<String>("successList", item)!);
        }
      }
    }
    return ProxyRebatePayRebatePostRespModel(
      failList: failList == null ? [] : failList,
      successList: successList == null ? [] : successList,
    );
  }

  List<String> failList;
  List<String> successList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'failList': failList,
        'successList': successList,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyQueryMaxRatioPostRespModel {
  ProxyQueryMaxRatioPostRespModel({
    required this.data,
  });

  factory ProxyQueryMaxRatioPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyQueryMaxRatioPostRespModel(
        data: jsonRes['data'] == null
            ? 0.0
            : asT<double>("data", jsonRes['data'])!,
      );

  double data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

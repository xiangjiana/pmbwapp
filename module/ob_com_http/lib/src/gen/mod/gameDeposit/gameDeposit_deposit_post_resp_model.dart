import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameDepositDepositPostRespModel {
  GameDepositDepositPostRespModel({
    required this.data,
  });

  factory GameDepositDepositPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameDepositDepositPostRespModel(
        data: jsonRes['data'] == null
            ? 0.0
            : asT<double>("data", jsonRes['data'])!,
      );

  double data = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

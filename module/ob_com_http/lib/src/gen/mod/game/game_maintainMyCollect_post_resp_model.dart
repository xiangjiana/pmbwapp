import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameMaintainMyCollectPostRespModel {
  GameMaintainMyCollectPostRespModel({
    required this.data,
  });

  factory GameMaintainMyCollectPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameMaintainMyCollectPostRespModel(
        data: jsonRes['data'] == null
            ? Map<String, dynamic>()
            : asT<Object>("data", jsonRes['data'])!,
      );

  Object data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

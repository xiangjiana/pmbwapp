import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MessageCenterDeleteMessagePostRespModel {
  MessageCenterDeleteMessagePostRespModel({
    required this.unReadAmount,
  });

  factory MessageCenterDeleteMessagePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MessageCenterDeleteMessagePostRespModel(
        unReadAmount: jsonRes['unReadAmount'] == null
            ? 0
            : asT<int>("unReadAmount", jsonRes['unReadAmount'])!,
      );

  int unReadAmount = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'unReadAmount': unReadAmount,
      };
}

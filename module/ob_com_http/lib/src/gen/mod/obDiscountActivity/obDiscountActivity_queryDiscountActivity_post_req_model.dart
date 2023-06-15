import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ObDiscountActivityQueryDiscountActivityPostReqModel {
  ObDiscountActivityQueryDiscountActivityPostReqModel({
    required this.deviceType,
  });

  factory ObDiscountActivityQueryDiscountActivityPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ObDiscountActivityQueryDiscountActivityPostReqModel(
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
      );

  int deviceType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountDiscountActivityPostReqModel {
  DiscountDiscountActivityPostReqModel({
    required this.deviceType,
    required this.discountTagId,
  });

  factory DiscountDiscountActivityPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      DiscountDiscountActivityPostReqModel(
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        discountTagId: jsonRes['discountTagId'] == null
            ? 0
            : asT<int>("discountTagId", jsonRes['discountTagId'])!,
      );

  int deviceType = 0;
  int discountTagId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'deviceType': deviceType,
        'discountTagId': discountTagId,
      };
}

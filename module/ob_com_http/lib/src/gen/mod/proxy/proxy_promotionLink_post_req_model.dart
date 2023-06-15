import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyPromotionLinkPostReqModel {
  ProxyPromotionLinkPostReqModel({
    required this.domainType,
  });

  factory ProxyPromotionLinkPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ProxyPromotionLinkPostReqModel(
        domainType: jsonRes['domainType'] == null
            ? 0
            : asT<int>("domainType", jsonRes['domainType'])!,
      );

  int domainType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'domainType': domainType,
      };
}

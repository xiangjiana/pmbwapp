import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DomainGetActivitySharingDomainLinkPostRespModel {
  DomainGetActivitySharingDomainLinkPostRespModel({
    required this.data,
  });

  factory DomainGetActivitySharingDomainLinkPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      DomainGetActivitySharingDomainLinkPostRespModel(
        data: jsonRes['data'] == null
            ? ''
            : asT<String>("data", jsonRes['data'])!,
      );

  String data = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

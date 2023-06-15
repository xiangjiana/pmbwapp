import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiSupportPhoneCodePostRespModel {
  UserApiSupportPhoneCodePostRespModel({
    required this.data,
  });

  factory UserApiSupportPhoneCodePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) {
    final List<String>? data = jsonRes['data'] is List ? <String>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(asT<String>('data', item)!);
        }
      }
    }
    return UserApiSupportPhoneCodePostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<String> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

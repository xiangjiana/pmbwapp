import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiUpdateGenderPostReqModel {
  UserApiUpdateGenderPostReqModel({
    required this.gender,
  });

  factory UserApiUpdateGenderPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiUpdateGenderPostReqModel(
        gender: jsonRes['gender'] == null
            ? 0
            : asT<int>("gender", jsonRes['gender'])!,
      );

  int gender = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'gender': gender,
      };
}

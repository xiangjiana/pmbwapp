import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GeetestSecondValidatePostReqModel {
  GeetestSecondValidatePostReqModel({
    required this.challenge,
    required this.seccode,
    required this.validate,
  });

  factory GeetestSecondValidatePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GeetestSecondValidatePostReqModel(
        challenge: jsonRes['challenge'] == null
            ? ''
            : asT<String>("challenge", jsonRes['challenge'])!,
        seccode: jsonRes['seccode'] == null
            ? ''
            : asT<String>("seccode", jsonRes['seccode'])!,
        validate: jsonRes['validate'] == null
            ? ''
            : asT<String>("validate", jsonRes['validate'])!,
      );

  String challenge = '';
  String seccode = '';
  String validate = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'challenge': challenge,
        'seccode': seccode,
        'validate': validate,
      };
}

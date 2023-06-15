import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiUploadSubmitPostReqModel {
  UserApiUploadSubmitPostReqModel({
    required this.topImagesUrl,
  });

  factory UserApiUploadSubmitPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserApiUploadSubmitPostReqModel(
        topImagesUrl: jsonRes['topImagesUrl'] == null
            ? ''
            : asT<String>("topImagesUrl", jsonRes['topImagesUrl'])!,
      );

  String topImagesUrl = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'topImagesUrl': topImagesUrl,
      };
}

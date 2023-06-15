import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ZrTopImagesDeleteImagesPostReqModel {
  ZrTopImagesDeleteImagesPostReqModel({
    required this.id,
  });

  factory ZrTopImagesDeleteImagesPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      ZrTopImagesDeleteImagesPostReqModel(
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
      );

  int id = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
      };
}

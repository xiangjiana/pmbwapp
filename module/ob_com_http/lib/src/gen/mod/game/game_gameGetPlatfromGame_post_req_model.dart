import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class GameGameGetPlatfromGamePostReqModel {
  GameGameGetPlatfromGamePostReqModel({
    required this.tag,
  });

  factory GameGameGetPlatfromGamePostReqModel.fromJson(
      Map<String, dynamic> jsonRes) =>
      GameGameGetPlatfromGamePostReqModel(
        tag: jsonRes['tag'] == null
            ? ''
            : asT<String>("tag", jsonRes['tag'])!,
      );

  String tag = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
    'tag': tag,
  };
}

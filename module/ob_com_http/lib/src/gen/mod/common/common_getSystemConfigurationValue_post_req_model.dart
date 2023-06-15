import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';


class CommonGetSystemConfigurationValuePostReqModel {
  CommonGetSystemConfigurationValuePostReqModel({
    required this.key,
  });

  factory CommonGetSystemConfigurationValuePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      CommonGetSystemConfigurationValuePostReqModel(
        key: jsonRes['key'] == null ? '' : asT<String>("key", jsonRes['key'])!,
      );

  String key = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'key': key,
      };
}

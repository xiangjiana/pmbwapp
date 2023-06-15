import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';


class CommonGetSystemConfigurationValuePostRespModel {
  CommonGetSystemConfigurationValuePostRespModel({
    required this.data,
  });

  factory CommonGetSystemConfigurationValuePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      CommonGetSystemConfigurationValuePostRespModel(
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

import 'dart:convert';

import 'package:repository/utils/net.dart';
import 'package:dio/dio.dart';

///获取支持的国家手机号代码
abstract class ConfigGetCommonDict {

  static const String url = '/common/getCommonDict';

  static void post({
    Function(List<CommonDictPhoneCode>)? success,
    Function(int, String)? fail,
  }) {
    Net().post(
      url,
      success: (Response r) {
        success?.call((jsonDecode(r.data['data']) as List).map((e) => CommonDictPhoneCode.fromJson(e)).toList());
      },
      fail: (int code, String msg) {
        fail?.call(code, msg);
      },
    );
  }
}

class CommonDictPhoneCode {
  String? country;
  String? code;
  int? status;
  List<int>? len;

  CommonDictPhoneCode({this.country, this.code, this.status, this.len});

  CommonDictPhoneCode.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    code = json['code'];
    status = json['status'];
    len = json['len'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    data['code'] = code;
    data['status'] = status;
    data['len'] = len;
    return data;
  }
}

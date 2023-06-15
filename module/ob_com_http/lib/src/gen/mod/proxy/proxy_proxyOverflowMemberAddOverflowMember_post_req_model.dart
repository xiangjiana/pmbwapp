import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyOverflowMemberAddOverflowMemberPostReqModel {
  ProxyProxyOverflowMemberAddOverflowMemberPostReqModel({
    required this.applyInfo,
    required this.imgPath,
    required this.promotionDevice,
    required this.promotionLink,
    required this.userName,
  });

  factory ProxyProxyOverflowMemberAddOverflowMemberPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? imgPath =
        jsonRes['imgPath'] is List ? <String>[] : null;
    if (imgPath != null) {
      for (final dynamic item in jsonRes['imgPath']!) {
        if (item != null) {
          imgPath.add(asT<String>("imgPath", item)!);
        }
      }
    }
    return ProxyProxyOverflowMemberAddOverflowMemberPostReqModel(
      applyInfo: jsonRes['applyInfo'] == null
          ? ''
          : asT<String>("applyInfo", jsonRes['applyInfo'])!,
      imgPath: imgPath == null ? [] : imgPath,
      promotionDevice: jsonRes['promotionDevice'] == null
          ? 0
          : asT<int>("promotionDevice", jsonRes['promotionDevice'])!,
      promotionLink: jsonRes['promotionLink'] == null
          ? ''
          : asT<String>("promotionLink", jsonRes['promotionLink'])!,
      userName: jsonRes['userName'] == null
          ? ''
          : asT<String>("userName", jsonRes['userName'])!,
    );
  }

  String applyInfo = '';
  List<String> imgPath;
  int promotionDevice = 0;
  String promotionLink = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'applyInfo': applyInfo,
        'imgPath': imgPath,
        'promotionDevice': promotionDevice,
        'promotionLink': promotionLink,
        'userName': userName,
      };
}

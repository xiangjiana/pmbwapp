import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserApiAddOverflowMemberPostReqModel {
  UserApiAddOverflowMemberPostReqModel({
    required this.accountType,
    required this.applyInfo,
    required this.currentProxyName,
    required this.imgPath,
    required this.promotionDevice,
    required this.promotionLink,
    required this.transferProxyName,
    required this.userName,
  });

  factory UserApiAddOverflowMemberPostReqModel.fromJson(
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
    return UserApiAddOverflowMemberPostReqModel(
      accountType: jsonRes['accountType'] == null
          ? 0
          : asT<int>("accountType", jsonRes['accountType'])!,
      applyInfo: jsonRes['applyInfo'] == null
          ? ''
          : asT<String>("applyInfo", jsonRes['applyInfo'])!,
      currentProxyName: jsonRes['currentProxyName'] == null
          ? ''
          : asT<String>("currentProxyName", jsonRes['currentProxyName'])!,
      imgPath: imgPath == null ? [] : imgPath,
      promotionDevice: jsonRes['promotionDevice'] == null
          ? 0
          : asT<int>("promotionDevice", jsonRes['promotionDevice'])!,
      promotionLink: jsonRes['promotionLink'] == null
          ? ''
          : asT<String>("promotionLink", jsonRes['promotionLink'])!,
      transferProxyName: jsonRes['transferProxyName'] == null
          ? ''
          : asT<String>("transferProxyName", jsonRes['transferProxyName'])!,
      userName: jsonRes['userName'] == null
          ? ''
          : asT<String>("userName", jsonRes['userName'])!,
    );
  }

  int accountType = 0;
  String applyInfo = '';
  String currentProxyName = '';
  List<String> imgPath;
  int promotionDevice = 0;
  String promotionLink = '';
  String transferProxyName = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'accountType': accountType,
        'applyInfo': applyInfo,
        'currentProxyName': currentProxyName,
        'imgPath': imgPath,
        'promotionDevice': promotionDevice,
        'promotionLink': promotionLink,
        'transferProxyName': transferProxyName,
        'userName': userName,
      };
}

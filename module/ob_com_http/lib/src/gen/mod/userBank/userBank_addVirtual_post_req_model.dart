import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankAddVirtualPostReqModel {
  UserBankAddVirtualPostReqModel({
    required this.realName,
    required this.virtualAddress,
    required this.virtualKind,
    required this.virtualProtocol,
  });

  factory UserBankAddVirtualPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      UserBankAddVirtualPostReqModel(
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        virtualAddress: jsonRes['virtualAddress'] == null
            ? ''
            : asT<String>("virtualAddress", jsonRes['virtualAddress'])!,
        virtualKind: jsonRes['virtualKind'] == null
            ? ''
            : asT<String>("virtualKind", jsonRes['virtualKind'])!,
        virtualProtocol: jsonRes['virtualProtocol'] == null
            ? ''
            : asT<String>("virtualProtocol", jsonRes['virtualProtocol'])!,
      );

  String realName = '';
  String virtualAddress = '';
  String virtualKind = '';
  String virtualProtocol = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'realName': realName,
        'virtualAddress': virtualAddress,
        'virtualKind': virtualKind,
        'virtualProtocol': virtualProtocol,
      };
}

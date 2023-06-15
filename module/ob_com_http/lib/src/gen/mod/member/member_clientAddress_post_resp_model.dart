import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class MemberClientAddressPostRespModel {
  MemberClientAddressPostRespModel({
    required this.createdAt,
    required this.createdBy,
    required this.id,
    required this.merchantId,
    required this.remark,
    required this.resourcesType,
    required this.resourcesUrl,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory MemberClientAddressPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      MemberClientAddressPostRespModel(
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        resourcesType: jsonRes['resourcesType'] == null
            ? 0
            : asT<int>("resourcesType", jsonRes['resourcesType'])!,
        resourcesUrl: jsonRes['resourcesUrl'] == null
            ? ''
            : asT<String>("resourcesUrl", jsonRes['resourcesUrl'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String createdAt = '';
  String createdBy = '';
  String id = '';
  String merchantId = '';
  String remark = '';
  int resourcesType = 0;
  String resourcesUrl = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'id': id,
        'merchantId': merchantId,
        'remark': remark,
        'resourcesType': resourcesType,
        'resourcesUrl': resourcesUrl,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

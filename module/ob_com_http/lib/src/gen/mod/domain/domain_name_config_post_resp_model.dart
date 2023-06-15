import 'dart:convert';

import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DomainNameConfigPostRespModel {
  DomainNameConfigPostRespModel({
    required this.data,
  });

  factory DomainNameConfigPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<DomainNameConfigPostRespModelData>? data = jsonRes['data'] is List ? <DomainNameConfigPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(DomainNameConfigPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return DomainNameConfigPostRespModel(
      data: data ?? [],
    );
  }
  List<DomainNameConfigPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class DomainNameConfigPostRespModelData {
  DomainNameConfigPostRespModelData({
    required this.address,
    required this.bizType,
    required this.createdAt,
    required this.createdBy,
    required this.domainDesc,
    required this.domainStatus,
    required this.id,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory DomainNameConfigPostRespModelData.fromJson(Map<String, dynamic> jsonRes) {
    return DomainNameConfigPostRespModelData(
      address: jsonRes['address'] == null
          ? ''
          : asT<String>("address", jsonRes['address'])!,
      bizType: jsonRes['bizType'] == null
          ? 0
          : asT<int>("bizType", jsonRes['bizType'])!,
      createdAt: jsonRes['createdAt'] == null
          ? ''
          : asT<String>("createdAt", jsonRes['createdAt'])!,
      createdBy: jsonRes['createdBy'] == null
          ? ''
          : asT<String>("createdBy", jsonRes['createdBy'])!,
      domainDesc: jsonRes['domainDesc'] == null
          ? ''
          : asT<String>("domainDesc", jsonRes['domainDesc'])!,
      domainStatus: jsonRes['domainStatus'] == null
          ? 0
          : asT<int>("domainStatus", jsonRes['domainStatus'])!,
      id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
      updatedAt: jsonRes['updatedAt'] == null
          ? ''
          : asT<String>("updatedAt", jsonRes['updatedAt'])!,
      updatedBy: jsonRes['updatedBy'] == null
          ? ''
          : asT<String>("updatedBy", jsonRes['updatedBy'])!,
    );
  }

  String address;
  int bizType = 0;
  String createdAt;
  String createdBy;
  String domainDesc;
  int domainStatus = 0;
  String id;
  String updatedAt;
  String updatedBy;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'address': address,
        'bizType': bizType,
        'createdAt': createdAt,
        'createdBy': createdBy,
        'domainDesc': domainDesc,
        'domainStatus': domainStatus,
        'id': id,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

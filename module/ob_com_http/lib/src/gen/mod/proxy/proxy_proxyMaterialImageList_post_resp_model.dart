import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyMaterialImageListPostRespModel {
  ProxyProxyMaterialImageListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyMaterialImageListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyMaterialImageListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyMaterialImageListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyMaterialImageListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyMaterialImageListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes['summary'] == null
          ? Map<String, dynamic>()
          : asT<Object>("summary", jsonRes['summary'])!,
      totalPage: jsonRes['totalPage'] == null
          ? 0
          : asT<int>("totalPage", jsonRes['totalPage'])!,
      totalRecord: jsonRes['totalRecord'] == null
          ? 0
          : asT<int>("totalRecord", jsonRes['totalRecord'])!,
    );
  }

  int pageNum = 0;
  int pageSize = 0;
  List<ProxyProxyMaterialImageListPostRespModelRecord> record;
  Object summary;
  int totalPage = 0;
  int totalRecord = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'pageNum': pageNum,
        'pageSize': pageSize,
        'record': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxyProxyMaterialImageListPostRespModelRecord {
  ProxyProxyMaterialImageListPostRespModelRecord({
    required this.createdAt,
    required this.createdBy,
    required this.displayOrder,
    required this.id,
    required this.imageAddress,
    required this.imageName,
    required this.imageSize,
    required this.imageType,
    required this.remark,
    required this.updatedAt,
    required this.updatedBy,
  });

  factory ProxyProxyMaterialImageListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyMaterialImageListPostRespModelRecord(
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        displayOrder: jsonRes['displayOrder'] == null
            ? 0
            : asT<int>("displayOrder", jsonRes['displayOrder'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        imageAddress: jsonRes['imageAddress'] == null
            ? ''
            : asT<String>("imageAddress", jsonRes['imageAddress'])!,
        imageName: jsonRes['imageName'] == null
            ? ''
            : asT<String>("imageName", jsonRes['imageName'])!,
        imageSize: jsonRes['imageSize'] == null
            ? ''
            : asT<String>("imageSize", jsonRes['imageSize'])!,
        imageType: jsonRes['imageType'] == null
            ? 0
            : asT<int>("imageType", jsonRes['imageType'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
      );

  String createdAt = '';
  String createdBy = '';
  int displayOrder = 0;
  String id = '';
  String imageAddress = '';
  String imageName = '';
  String imageSize = '';
  int imageType = 0;
  String remark = '';
  String updatedAt = '';
  String updatedBy = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'displayOrder': displayOrder,
        'id': id,
        'imageAddress': imageAddress,
        'imageName': imageName,
        'imageSize': imageSize,
        'imageType': imageType,
        'remark': remark,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyDomainQueryProxyDomainPostRespModel {
  ProxyProxyDomainQueryProxyDomainPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyDomainQueryProxyDomainPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyDomainQueryProxyDomainPostRespModelRecord>? record = jsonRes['data'] is List ? <ProxyProxyDomainQueryProxyDomainPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          record
              .add(ProxyProxyDomainQueryProxyDomainPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyProxyDomainQueryProxyDomainPostRespModel(
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
  List<ProxyProxyDomainQueryProxyDomainPostRespModelRecord> record;
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
        'data': record,
        'summary': summary,
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxyProxyDomainQueryProxyDomainPostRespModelRecord {
  ProxyProxyDomainQueryProxyDomainPostRespModelRecord({
    required this.createdAt,
    required this.createdBy,
    required this.description,
    required this.displayOrder,
    required this.domainName,
    required this.domainType,
    required this.id,
    required this.merchantId,
    required this.qqQrCode,
    required this.qqShortChain,
    required this.remark,
    required this.status,
    required this.updatedAt,
    required this.updatedBy,
    required this.wechatQrCode,
    required this.wechatShortChain,
  });

  factory ProxyProxyDomainQueryProxyDomainPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyDomainQueryProxyDomainPostRespModelRecord(
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        createdBy: jsonRes['createdBy'] == null
            ? ''
            : asT<String>("createdBy", jsonRes['createdBy'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
        displayOrder: jsonRes['displayOrder'] == null
            ? 0
            : asT<int>("displayOrder", jsonRes['displayOrder'])!,
        domainName: jsonRes['domainName'] == null
            ? ''
            : asT<String>("domainName", jsonRes['domainName'])!,
        domainType: jsonRes['domainType'] == null
            ? 0
            : asT<int>("domainType", jsonRes['domainType'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        merchantId: jsonRes['merchantId'] == null
            ? ''
            : asT<String>("merchantId", jsonRes['merchantId'])!,
        qqQrCode: jsonRes['qqQrCode'] == null
            ? ''
            : asT<String>("qqQrCode", jsonRes['qqQrCode'])!,
        qqShortChain: jsonRes['qqShortChain'] == null
            ? ''
            : asT<String>("qqShortChain", jsonRes['qqShortChain'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        status: jsonRes['status'] == null
            ? ''
            : asT<String>("status", jsonRes['status'])!,
        updatedAt: jsonRes['updatedAt'] == null
            ? ''
            : asT<String>("updatedAt", jsonRes['updatedAt'])!,
        updatedBy: jsonRes['updatedBy'] == null
            ? ''
            : asT<String>("updatedBy", jsonRes['updatedBy'])!,
        wechatQrCode: jsonRes['wechatQrCode'] == null
            ? ''
            : asT<String>("wechatQrCode", jsonRes['wechatQrCode'])!,
        wechatShortChain: jsonRes['wechatShortChain'] == null
            ? ''
            : asT<String>("wechatShortChain", jsonRes['wechatShortChain'])!,
      );

  String createdAt = '';
  String createdBy = '';
  String description = '';
  int displayOrder = 0;
  String domainName = '';
  int domainType = 0;
  String id = '';
  String merchantId = '';
  String qqQrCode = '';
  String qqShortChain = '';
  String remark = '';
  String status = '';
  String updatedAt = '';
  String updatedBy = '';
  String wechatQrCode = '';
  String wechatShortChain = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'createdBy': createdBy,
        'description': description,
        'displayOrder': displayOrder,
        'domainName': domainName,
        'domainType': domainType,
        'id': id,
        'merchantId': merchantId,
        'qqQrCode': qqQrCode,
        'qqShortChain': qqShortChain,
        'remark': remark,
        'status': status,
        'updatedAt': updatedAt,
        'updatedBy': updatedBy,
        'wechatQrCode': wechatQrCode,
        'wechatShortChain': wechatShortChain,
      };
}

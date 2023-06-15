import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccessRecordDepositPostRespModel {
  AccessRecordDepositPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory AccessRecordDepositPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<AccessRecordDepositPostRespModelRecord>? record = jsonRes['record'] is List ? <AccessRecordDepositPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(AccessRecordDepositPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return AccessRecordDepositPostRespModel(
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
  List<AccessRecordDepositPostRespModelRecord> record;
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

class AccessRecordDepositPostRespModelRecord {
  AccessRecordDepositPostRespModelRecord({
    required this.daily,
    required this.details,
  });

  factory AccessRecordDepositPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) {
    final List<AccessRecordDepositPostRespModelDetails>? details =
        jsonRes['details'] is List ? <AccessRecordDepositPostRespModelDetails>[] : null;
    if (details != null) {
      for (final dynamic item in jsonRes['details']!) {
        if (item != null) {
          details.add(
              AccessRecordDepositPostRespModelDetails.fromJson(asT<Map<String, dynamic>>("details", item)!));
        }
      }
    }
    return AccessRecordDepositPostRespModelRecord(
      daily: jsonRes['daily'] == null
          ? ''
          : asT<String>("daily", jsonRes['daily'])!,
      details: details == null ? [] : details,
    );
  }

  String daily = '';
  List<AccessRecordDepositPostRespModelDetails> details;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'daily': daily,
        'details': details,
      };
}

class AccessRecordDepositPostRespModelDetails {
  AccessRecordDepositPostRespModelDetails({
    required this.appStatus,
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.orderStatus,
    required this.remark,
  });

  factory AccessRecordDepositPostRespModelDetails.fromJson(Map<String, dynamic> jsonRes) => AccessRecordDepositPostRespModelDetails(
        appStatus: jsonRes['appStatus'] == null
            ? 0
            : asT<int>("appStatus", jsonRes['appStatus'])!,
        bizType: jsonRes['bizType'] == null
            ? 0
            : asT<int>("bizType", jsonRes['bizType'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0
            : asT<int>("orderAmount", jsonRes['orderAmount'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
      );

  int appStatus = 0;
  int bizType = 0;
  String createdAt = '';
  String id = '';
  int orderAmount = 0;
  int orderStatus = 0;
  String remark = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appStatus': appStatus,
        'bizType': bizType,
        'createdAt': createdAt,
        'id': id,
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'remark': remark,
      };
}

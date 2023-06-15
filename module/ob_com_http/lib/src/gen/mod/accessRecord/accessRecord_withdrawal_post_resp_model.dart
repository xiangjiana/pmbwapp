import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccessRecordWithdrawalPostRespModel {
  AccessRecordWithdrawalPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory AccessRecordWithdrawalPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<AccessRecordWithdrawalPostRespModelRecord>? record = jsonRes['record'] is List ? <AccessRecordWithdrawalPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(AccessRecordWithdrawalPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return AccessRecordWithdrawalPostRespModel(
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
  List<AccessRecordWithdrawalPostRespModelRecord> record;
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

class AccessRecordWithdrawalPostRespModelRecord {
  AccessRecordWithdrawalPostRespModelRecord({
    required this.daily,
    required this.details,
  });

  factory AccessRecordWithdrawalPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) {
    final List<AccessRecordWithdrawalPostRespModelDetails>? details =
        jsonRes['details'] is List ? <AccessRecordWithdrawalPostRespModelDetails>[] : null;
    if (details != null) {
      for (final dynamic item in jsonRes['details']!) {
        if (item != null) {
          details.add(
              AccessRecordWithdrawalPostRespModelDetails.fromJson(asT<Map<String, dynamic>>("details", item)!));
        }
      }
    }
    return AccessRecordWithdrawalPostRespModelRecord(
      daily: jsonRes['daily'] == null
          ? ''
          : asT<String>("daily", jsonRes['daily'])!,
      details: details == null ? [] : details,
    );
  }

  String daily = '';
  List<AccessRecordWithdrawalPostRespModelDetails> details;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'daily': daily,
        'details': details,
      };
}

class AccessRecordWithdrawalPostRespModelDetails {
  AccessRecordWithdrawalPostRespModelDetails({
    required this.appStatus,
    required this.bizType,
    required this.createdAt,
    required this.id,
    required this.orderAmount,
    required this.orderStatus,
    required this.remark,
  });

  factory AccessRecordWithdrawalPostRespModelDetails.fromJson(Map<String, dynamic> jsonRes) => AccessRecordWithdrawalPostRespModelDetails(
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
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
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
  double orderAmount = 0.0;
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

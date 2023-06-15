import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyProxyWithdrawRecordByVirtualPostRespModel {
  ProxyProxyWithdrawRecordByVirtualPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyProxyWithdrawRecordByVirtualPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyProxyWithdrawRecordByVirtualPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyProxyWithdrawRecordByVirtualPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyProxyWithdrawRecordByVirtualPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyProxyWithdrawRecordByVirtualPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
      summary: jsonRes["summary"] == null
          ? ProxyProxyWithdrawRecordByVirtualPostRespModelSummary.fromJson({})
          : ProxyProxyWithdrawRecordByVirtualPostRespModelSummary.fromJson(
              asT<Map<String, dynamic>>("summary", jsonRes["summary"])!),
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
  List<ProxyProxyWithdrawRecordByVirtualPostRespModelRecord> record;
  ProxyProxyWithdrawRecordByVirtualPostRespModelSummary summary;
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

class ProxyProxyWithdrawRecordByVirtualPostRespModelRecord {
  ProxyProxyWithdrawRecordByVirtualPostRespModelRecord({
    required this.appStatus,
    required this.audit1Desc,
    required this.audit1Operator,
    required this.audit2Desc,
    required this.audit2Operator,
    required this.audit3Desc,
    required this.audit3Operator,
    required this.bankCode,
    required this.createdAt,
    required this.customerIp,
    required this.deviceNo,
    required this.deviceNoControlName,
    required this.deviceType,
    required this.eventId,
    required this.id,
    required this.ipControlName,
    required this.isBig,
    required this.isFirst,
    required this.orderAmount,
    required this.orderStatus,
    required this.realAmount,
    required this.realName,
    required this.remark,
    required this.userName,
    required this.withdrawAccountName,
    required this.withdrawAccountNo,
    required this.withdrawBank,
    required this.withdrawBankAddress,
    required this.withdrawInfo,
    required this.withdrawType,
  });

  factory ProxyProxyWithdrawRecordByVirtualPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyWithdrawRecordByVirtualPostRespModelRecord(
        appStatus: jsonRes['appStatus'] == null
            ? 0
            : asT<int>("appStatus", jsonRes['appStatus'])!,
        audit1Desc: jsonRes['audit1Desc'] == null
            ? ''
            : asT<String>("audit1Desc", jsonRes['audit1Desc'])!,
        audit1Operator: jsonRes['audit1Operator'] == null
            ? ''
            : asT<String>("audit1Operator", jsonRes['audit1Operator'])!,
        audit2Desc: jsonRes['audit2Desc'] == null
            ? ''
            : asT<String>("audit2Desc", jsonRes['audit2Desc'])!,
        audit2Operator: jsonRes['audit2Operator'] == null
            ? ''
            : asT<String>("audit2Operator", jsonRes['audit2Operator'])!,
        audit3Desc: jsonRes['audit3Desc'] == null
            ? ''
            : asT<String>("audit3Desc", jsonRes['audit3Desc'])!,
        audit3Operator: jsonRes['audit3Operator'] == null
            ? ''
            : asT<String>("audit3Operator", jsonRes['audit3Operator'])!,
        bankCode: jsonRes['bankCode'] == null
            ? ''
            : asT<String>("bankCode", jsonRes['bankCode'])!,
        createdAt: jsonRes['createdAt'] == null
            ? ''
            : asT<String>("createdAt", jsonRes['createdAt'])!,
        customerIp: jsonRes['customerIp'] == null
            ? ''
            : asT<String>("customerIp", jsonRes['customerIp'])!,
        deviceNo: jsonRes['deviceNo'] == null
            ? ''
            : asT<String>("deviceNo", jsonRes['deviceNo'])!,
        deviceNoControlName: jsonRes['deviceNoControlName'] == null
            ? ''
            : asT<String>(
                "deviceNoControlName", jsonRes['deviceNoControlName'])!,
        deviceType: jsonRes['deviceType'] == null
            ? 0
            : asT<int>("deviceType", jsonRes['deviceType'])!,
        eventId: jsonRes['eventId'] == null
            ? ''
            : asT<String>("eventId", jsonRes['eventId'])!,
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        ipControlName: jsonRes['ipControlName'] == null
            ? ''
            : asT<String>("ipControlName", jsonRes['ipControlName'])!,
        isBig: jsonRes['isBig'] == null
            ? ''
            : asT<String>("isBig", jsonRes['isBig'])!,
        isFirst: jsonRes['isFirst'] == null
            ? ''
            : asT<String>("isFirst", jsonRes['isFirst'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        realAmount: jsonRes['realAmount'] == null
            ? 0.0
            : asT<double>("realAmount", jsonRes['realAmount'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        remark: jsonRes['remark'] == null
            ? ''
            : asT<String>("remark", jsonRes['remark'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
        withdrawAccountName: jsonRes['withdrawAccountName'] == null
            ? ''
            : asT<String>(
                "withdrawAccountName", jsonRes['withdrawAccountName'])!,
        withdrawAccountNo: jsonRes['withdrawAccountNo'] == null
            ? ''
            : asT<String>("withdrawAccountNo", jsonRes['withdrawAccountNo'])!,
        withdrawBank: jsonRes['withdrawBank'] == null
            ? ''
            : asT<String>("withdrawBank", jsonRes['withdrawBank'])!,
        withdrawBankAddress: jsonRes['withdrawBankAddress'] == null
            ? ''
            : asT<String>(
                "withdrawBankAddress", jsonRes['withdrawBankAddress'])!,
        withdrawInfo: jsonRes['withdrawInfo'] == null
            ? ''
            : asT<String>("withdrawInfo", jsonRes['withdrawInfo'])!,
        withdrawType: jsonRes['withdrawType'] == null
            ? 0
            : asT<int>("withdrawType", jsonRes['withdrawType'])!,
      );

  int appStatus = 0;
  String audit1Desc = '';
  String audit1Operator = '';
  String audit2Desc = '';
  String audit2Operator = '';
  String audit3Desc = '';
  String audit3Operator = '';
  String bankCode = '';
  String createdAt = '';
  String customerIp = '';
  String deviceNo = '';
  String deviceNoControlName = '';
  int deviceType = 0;
  String eventId = '';
  String id = '';
  String ipControlName = '';
  String isBig = '';
  String isFirst = '';
  double orderAmount = 0.0;
  int orderStatus = 0;
  double realAmount = 0.0;
  String realName = '';
  String remark = '';
  String userName = '';
  String withdrawAccountName = '';
  String withdrawAccountNo = '';
  String withdrawBank = '';
  String withdrawBankAddress = '';
  String withdrawInfo = '';
  int withdrawType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'appStatus': appStatus,
        'audit1Desc': audit1Desc,
        'audit1Operator': audit1Operator,
        'audit2Desc': audit2Desc,
        'audit2Operator': audit2Operator,
        'audit3Desc': audit3Desc,
        'audit3Operator': audit3Operator,
        'bankCode': bankCode,
        'createdAt': createdAt,
        'customerIp': customerIp,
        'deviceNo': deviceNo,
        'deviceNoControlName': deviceNoControlName,
        'deviceType': deviceType,
        'eventId': eventId,
        'id': id,
        'ipControlName': ipControlName,
        'isBig': isBig,
        'isFirst': isFirst,
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'realAmount': realAmount,
        'realName': realName,
        'remark': remark,
        'userName': userName,
        'withdrawAccountName': withdrawAccountName,
        'withdrawAccountNo': withdrawAccountNo,
        'withdrawBank': withdrawBank,
        'withdrawBankAddress': withdrawBankAddress,
        'withdrawInfo': withdrawInfo,
        'withdrawType': withdrawType,
      };
}

class ProxyProxyWithdrawRecordByVirtualPostRespModelSummary {
  ProxyProxyWithdrawRecordByVirtualPostRespModelSummary({
    required this.realSubtotal,
    required this.realTotal,
    required this.subtotal,
    required this.total,
  });

  factory ProxyProxyWithdrawRecordByVirtualPostRespModelSummary.fromJson(Map<String, dynamic> jsonRes) => ProxyProxyWithdrawRecordByVirtualPostRespModelSummary(
        realSubtotal: jsonRes['realSubtotal'] == null
            ? 0.0
            : asT<double>("realSubtotal", jsonRes['realSubtotal'])!,
        realTotal: jsonRes['realTotal'] == null
            ? 0.0
            : asT<double>("realTotal", jsonRes['realTotal'])!,
        subtotal: jsonRes['subtotal'] == null
            ? 0.0
            : asT<double>("subtotal", jsonRes['subtotal'])!,
        total: jsonRes['total'] == null
            ? 0.0
            : asT<double>("total", jsonRes['total'])!,
      );

  double realSubtotal = 0.0;
  double realTotal = 0.0;
  double subtotal = 0.0;
  double total = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'realSubtotal': realSubtotal,
        'realTotal': realTotal,
        'subtotal': subtotal,
        'total': total,
      };
}

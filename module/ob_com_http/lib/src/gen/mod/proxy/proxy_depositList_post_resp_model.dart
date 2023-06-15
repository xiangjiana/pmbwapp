import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyDepositListPostRespModel {
  ProxyDepositListPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ProxyDepositListPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<ProxyDepositListPostRespModelRecord>? record = jsonRes['record'] is List ? <ProxyDepositListPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ProxyDepositListPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ProxyDepositListPostRespModel(
      pageNum: jsonRes['pageNum'] == null
          ? 0
          : asT<int>("pageNum", jsonRes['pageNum'])!,
      pageSize: jsonRes['pageSize'] == null
          ? 0
          : asT<int>("pageSize", jsonRes['pageSize'])!,
      record: record == null ? [] : record,
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
  List<ProxyDepositListPostRespModelRecord> record;
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
        'totalPage': totalPage,
        'totalRecord': totalRecord,
      };
}

class ProxyDepositListPostRespModelRecord {
  ProxyDepositListPostRespModelRecord({
    required this.createdAt,
    required this.customerIp,
    required this.deviceNo,
    required this.deviceNoControlName,
    required this.deviceType,
    required this.id,
    required this.ipControlName,
    required this.orderAmount,
    required this.orderStatus,
    required this.payType,
    required this.realAmount,
    required this.realName,
    required this.thirdOrderNo,
    required this.userName,
  });

  factory ProxyDepositListPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ProxyDepositListPostRespModelRecord(
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
        id: jsonRes['id'] == null ? '' : asT<String>("id", jsonRes['id'])!,
        ipControlName: jsonRes['ipControlName'] == null
            ? ''
            : asT<String>("ipControlName", jsonRes['ipControlName'])!,
        orderAmount: jsonRes['orderAmount'] == null
            ? 0.0
            : asT<double>("orderAmount", jsonRes['orderAmount'])!,
        orderStatus: jsonRes['orderStatus'] == null
            ? 0
            : asT<int>("orderStatus", jsonRes['orderStatus'])!,
        payType: jsonRes['payType'] == null
            ? 0
            : asT<int>("payType", jsonRes['payType'])!,
        realAmount: jsonRes['realAmount'] == null
            ? 0.0
            : asT<double>("realAmount", jsonRes['realAmount'])!,
        realName: jsonRes['realName'] == null
            ? ''
            : asT<String>("realName", jsonRes['realName'])!,
        thirdOrderNo: jsonRes['thirdOrderNo'] == null
            ? ''
            : asT<String>("thirdOrderNo", jsonRes['thirdOrderNo'])!,
        userName: jsonRes['userName'] == null
            ? ''
            : asT<String>("userName", jsonRes['userName'])!,
      );

  String createdAt = '';
  String customerIp = '';
  String deviceNo = '';
  String deviceNoControlName = '';
  int deviceType = 0;
  String id = '';
  String ipControlName = '';
  double orderAmount = 0.0;
  int orderStatus = 0;
  int payType = 0;
  double realAmount = 0.0;
  String realName = '';
  String thirdOrderNo = '';
  String userName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'createdAt': createdAt,
        'customerIp': customerIp,
        'deviceNo': deviceNo,
        'deviceNoControlName': deviceNoControlName,
        'deviceType': deviceType,
        'id': id,
        'ipControlName': ipControlName,
        'orderAmount': orderAmount,
        'orderStatus': orderStatus,
        'payType': payType,
        'realAmount': realAmount,
        'realName': realName,
        'thirdOrderNo': thirdOrderNo,
        'userName': userName,
      };
}

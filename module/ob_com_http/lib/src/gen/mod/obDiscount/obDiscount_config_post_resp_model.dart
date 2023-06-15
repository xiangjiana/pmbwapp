import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ObDiscountConfigPostRespModel {
  ObDiscountConfigPostRespModel({
    required this.pageNum,
    required this.pageSize,
    required this.record,
    required this.summary,
    required this.totalPage,
    required this.totalRecord,
  });

  factory ObDiscountConfigPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<ObDiscountConfigPostRespModelRecord>? record = jsonRes['record'] is List ? <ObDiscountConfigPostRespModelRecord>[] : null;
    if (record != null) {
      for (final dynamic item in jsonRes['record']!) {
        if (item != null) {
          record
              .add(ObDiscountConfigPostRespModelRecord.fromJson(asT<Map<String, dynamic>>("record", item)!));
        }
      }
    }
    return ObDiscountConfigPostRespModel(
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
  List<ObDiscountConfigPostRespModelRecord> record;
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

class ObDiscountConfigPostRespModelRecord {
  ObDiscountConfigPostRespModelRecord({
    required this.bannerSrcMobile,
    required this.bannerSrcPc,
    required this.createAt,
    required this.createBy,
    required this.discountContent,
    required this.discountTitle,
    required this.fristTypeId,
    required this.id,
    required this.introductionMapSrc,
    required this.merchantId,
    required this.secondTypeId,
  });

  factory ObDiscountConfigPostRespModelRecord.fromJson(Map<String, dynamic> jsonRes) => ObDiscountConfigPostRespModelRecord(
        bannerSrcMobile: jsonRes['bannerSrcMobile'] == null
            ? ''
            : asT<String>("bannerSrcMobile", jsonRes['bannerSrcMobile'])!,
        bannerSrcPc: jsonRes['bannerSrcPc'] == null
            ? ''
            : asT<String>("bannerSrcPc", jsonRes['bannerSrcPc'])!,
        createAt: jsonRes['createAt'] == null
            ? ''
            : asT<String>("createAt", jsonRes['createAt'])!,
        createBy: jsonRes['createBy'] == null
            ? ''
            : asT<String>("createBy", jsonRes['createBy'])!,
        discountContent: jsonRes['discountContent'] == null
            ? ''
            : asT<String>("discountContent", jsonRes['discountContent'])!,
        discountTitle: jsonRes['discountTitle'] == null
            ? ''
            : asT<String>("discountTitle", jsonRes['discountTitle'])!,
        fristTypeId: jsonRes['fristTypeId'] == null
            ? 0
            : asT<int>("fristTypeId", jsonRes['fristTypeId'])!,
        id: jsonRes['id'] == null ? 0 : asT<int>("id", jsonRes['id'])!,
        introductionMapSrc: jsonRes['introductionMapSrc'] == null
            ? ''
            : asT<String>("introductionMapSrc", jsonRes['introductionMapSrc'])!,
        merchantId: jsonRes['merchantId'] == null
            ? 0
            : asT<int>("merchantId", jsonRes['merchantId'])!,
        secondTypeId: jsonRes['secondTypeId'] == null
            ? 0
            : asT<int>("secondTypeId", jsonRes['secondTypeId'])!,
      );

  String bannerSrcMobile = '';
  String bannerSrcPc = '';
  String createAt = '';
  String createBy = '';
  String discountContent = '';
  String discountTitle = '';
  int fristTypeId = 0;
  int id = 0;
  String introductionMapSrc = '';
  int merchantId = 0;
  int secondTypeId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'bannerSrcMobile': bannerSrcMobile,
        'bannerSrcPc': bannerSrcPc,
        'createAt': createAt,
        'createBy': createBy,
        'discountContent': discountContent,
        'discountTitle': discountTitle,
        'fristTypeId': fristTypeId,
        'id': id,
        'introductionMapSrc': introductionMapSrc,
        'merchantId': merchantId,
        'secondTypeId': secondTypeId,
      };
}

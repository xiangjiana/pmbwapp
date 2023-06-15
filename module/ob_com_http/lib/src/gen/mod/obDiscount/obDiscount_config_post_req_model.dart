import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ObDiscountConfigPostReqModel {
  ObDiscountConfigPostReqModel({
    required this.discountContent,
    required this.discountTitle,
    required this.fristTypeId,
    required this.pageNum,
    required this.pageSize,
    required this.secondTypeId,
  });

  factory ObDiscountConfigPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      ObDiscountConfigPostReqModel(
        discountContent: jsonRes['discountContent'] == null
            ? ''
            : asT<String>("discountContent", jsonRes['discountContent'])!,
        discountTitle: jsonRes['discountTitle'] == null
            ? ''
            : asT<String>("discountTitle", jsonRes['discountTitle'])!,
        fristTypeId: jsonRes['fristTypeId'] == null
            ? 0
            : asT<int>("fristTypeId", jsonRes['fristTypeId'])!,
        pageNum: jsonRes['pageNum'] == null
            ? 0
            : asT<int>("pageNum", jsonRes['pageNum'])!,
        pageSize: jsonRes['pageSize'] == null
            ? 0
            : asT<int>("pageSize", jsonRes['pageSize'])!,
        secondTypeId: jsonRes['secondTypeId'] == null
            ? 0
            : asT<int>("secondTypeId", jsonRes['secondTypeId'])!,
      );

  String discountContent = '';
  String discountTitle = '';
  int fristTypeId = 0;
  int pageNum = 0;
  int pageSize = 0;
  int secondTypeId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'discountContent': discountContent,
        'discountTitle': discountTitle,
        'fristTypeId': fristTypeId,
        'pageNum': pageNum,
        'pageSize': pageSize,
        'secondTypeId': secondTypeId,
      };
}

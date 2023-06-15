import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class DiscountReceiveDiscountPostReqModel {
  DiscountReceiveDiscountPostReqModel({
    required this.receiveDisCountListReqDTOList,
  });

  factory DiscountReceiveDiscountPostReqModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<String>? receiveDisCountListReqDTOList =
        jsonRes['receiveDisCountListReqDTOList'] is List ? <String>[] : null;
    if (receiveDisCountListReqDTOList != null) {
      for (final dynamic item in jsonRes['receiveDisCountListReqDTOList']!) {
        if (item != null) {
          receiveDisCountListReqDTOList
              .add(asT<String>("receiveDisCountListReqDTOList", item)!);
        }
      }
    }
    return DiscountReceiveDiscountPostReqModel(
      receiveDisCountListReqDTOList: receiveDisCountListReqDTOList == null
          ? []
          : receiveDisCountListReqDTOList,
    );
  }

  List<String> receiveDisCountListReqDTOList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'receiveDisCountListReqDTOList': receiveDisCountListReqDTOList,
      };
}

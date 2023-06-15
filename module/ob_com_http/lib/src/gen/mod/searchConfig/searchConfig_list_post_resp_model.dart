import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class SearchConfigListPostRespModel {
  SearchConfigListPostRespModel({
    required this.obSearchConfigHistoryList,
    required this.obSearchConfigHotList,
  });

  factory SearchConfigListPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<String>? obSearchConfigHistoryList =
        jsonRes['obSearchConfigHistoryList'] is List ? <String>[] : null;
    if (obSearchConfigHistoryList != null) {
      for (final dynamic item in jsonRes['obSearchConfigHistoryList']!) {
        if (item != null) {
          obSearchConfigHistoryList
              .add(asT<String>("obSearchConfigHistoryList", item)!);
        }
      }
    }

    final List<String>? obSearchConfigHotList =
        jsonRes['obSearchConfigHotList'] is List ? <String>[] : null;
    if (obSearchConfigHotList != null) {
      for (final dynamic item in jsonRes['obSearchConfigHotList']!) {
        if (item != null) {
          obSearchConfigHotList
              .add(asT<String>("obSearchConfigHotList", item)!);
        }
      }
    }
    return SearchConfigListPostRespModel(
      obSearchConfigHistoryList:
          obSearchConfigHistoryList == null ? [] : obSearchConfigHistoryList,
      obSearchConfigHotList:
          obSearchConfigHotList == null ? [] : obSearchConfigHotList,
    );
  }

  List<String> obSearchConfigHistoryList;
  List<String> obSearchConfigHotList;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'obSearchConfigHistoryList': obSearchConfigHistoryList,
        'obSearchConfigHotList': obSearchConfigHotList,
      };
}

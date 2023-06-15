import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

/// [userId]去掉该参数&后端不获取该参数值
class AccountNoTransferPostReqModel {
  AccountNoTransferPostReqModel({
    required this.noTransfer,
  });

  factory AccountNoTransferPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      AccountNoTransferPostReqModel(
        noTransfer: jsonRes['noTransfer'] == null
            ? 0
            : asT<int>("noTransfer", jsonRes['noTransfer'])!,
      );

  int noTransfer = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'noTransfer': noTransfer,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class AccountMoneyNoTransferPostReqModel {
  AccountMoneyNoTransferPostReqModel({
    required this.noTransfer,
    required this.userId,
  });

  factory AccountMoneyNoTransferPostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      AccountMoneyNoTransferPostReqModel(
        noTransfer: jsonRes['noTransfer'] == null
            ? 0
            : asT<int>("noTransfer", jsonRes['noTransfer'])!,
        userId: jsonRes['userId'] == null
            ? 0
            : asT<int>("userId", jsonRes['userId'])!,
      );

  int noTransfer = 0;
  int userId = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'noTransfer': noTransfer,
        'userId': userId,
      };
}

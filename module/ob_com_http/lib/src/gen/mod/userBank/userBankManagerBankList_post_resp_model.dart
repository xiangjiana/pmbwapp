import 'dart:convert';
import 'package:models/models.dart';
import 'package:ob_com_http/src/utils/as_t.dart';

import '../../../../ob_com_http.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class UserBankManagerBankListPostRespModel {
  UserBankManagerBankListPostRespModel({
    required this.bankDtoList,
  });

  factory UserBankManagerBankListPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<BankNameResp> bankDtoList = <BankNameResp>[] ;
    if (bankDtoList != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          bankDtoList.add(BankNameResp.fromJson(asT<Map<String, dynamic>>("bankList", item)!));
        }
      }
    }


    return  UserBankManagerBankListPostRespModel(
      bankDtoList: bankDtoList,
    );
  }

  List<BankNameResp> bankDtoList ;


  @override
  String toString() {
    return jsonEncode(this);
  }

}

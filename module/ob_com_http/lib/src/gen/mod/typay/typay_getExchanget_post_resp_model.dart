import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class TypayGetExchangetPostRespModel {
  TypayGetExchangetPostRespModel({
    required this.sellPrice,
    required this.buyPrice,
  });

  factory TypayGetExchangetPostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      TypayGetExchangetPostRespModel(
        sellPrice: jsonRes['sellPrice'] == null
            ? 0.0
            : asT<double>("sellPrice", jsonRes['sellPrice'])!,
        buyPrice: jsonRes['buyPrice'] == null
            ? 0.0
            : asT<double>("buyPrice", jsonRes['buyPrice'])!,
      );

  double sellPrice = 0.0;
  double buyPrice = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'sellPrice': sellPrice,
        'buyPrice': buyPrice,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameRecordQueryAllPostRespModel {
  GameRecordQueryAllPostRespModel({
    required this.betAmountTotal,
    required this.countTotal,
    required this.metas,
    required this.netAmountTotal,
  });

  factory GameRecordQueryAllPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<Metas>? metas = jsonRes['metas'] is List ? <Metas>[] : null;
    if (metas != null) {
      for (final dynamic item in jsonRes['metas']!) {
        if (item != null) {
          metas.add(Metas.fromJson(asT<Map<String, dynamic>>("metas", item)!));
        }
      }
    }
    return GameRecordQueryAllPostRespModel(
      betAmountTotal: jsonRes['betAmountTotal'] == null
          ? 0.0
          : asT<double>("betAmountTotal", jsonRes['betAmountTotal'])!,
      countTotal: jsonRes['countTotal'] == null
          ? 0
          : asT<int>("countTotal", jsonRes['countTotal'])!,
      metas: metas == null ? [] : metas,
      netAmountTotal: jsonRes['netAmountTotal'] == null
          ? 0.0
          : asT<double>("netAmountTotal", jsonRes['netAmountTotal'])!,
    );
  }

  double betAmountTotal = 0.0;
  int countTotal = 0;
  List<Metas> metas;
  double netAmountTotal = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmountTotal': betAmountTotal,
        'countTotal': countTotal,
        'metas': metas,
        'netAmountTotal': netAmountTotal,
      };
}

class Metas {
  Metas({
    required this.betAmount,
    required this.count,
    required this.venueCode,
    required this.venueName,
    required this.netAmount,
    required this.venueIconUrlApp,
  });

  factory Metas.fromJson(Map<String, dynamic> jsonRes) => Metas(
        betAmount: jsonRes['betAmount'] == null
            ? 0.0
            : asT<double>("betAmount", jsonRes['betAmount'])!,
        count: jsonRes['count'] == null
            ? ''
            : asT<String>("count", jsonRes['count'])!,
        venueCode: jsonRes['venueCode'] == null
            ? ''
            : asT<String>("venueCode", jsonRes['venueCode'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
       venueIconUrlApp: jsonRes['venueIconUrlApp'] == null
        ? ''
        : asT<String>("venueIconUrlApp", jsonRes['venueIconUrlApp'])!,
        netAmount: jsonRes['netAmount'] == null
            ? 0.0
            : asT<double>("netAmount", jsonRes['netAmount'])!,
      );

  double betAmount = 0.0;
  String count = '';
  String venueCode = '';
  String venueName = '';
  String venueIconUrlApp = '';
  double netAmount = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'betAmount': betAmount,
        'count': count,
        'venueCode': venueCode,
        'venueName': venueName,
        'netAmount': netAmount,
      };
}

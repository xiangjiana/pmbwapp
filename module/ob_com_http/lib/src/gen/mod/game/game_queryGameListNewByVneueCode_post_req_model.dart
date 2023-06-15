import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class GameQueryGameListNewByVenueCodePostReqModel {
  GameQueryGameListNewByVenueCodePostReqModel({
    required this.venueCode,
  });

  factory GameQueryGameListNewByVenueCodePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameQueryGameListNewByVenueCodePostReqModel(
        venueCode: jsonRes['venueCode'] == null
            ? ""
            : asT<String>("venueCode", jsonRes['venueCode'])!,
      );

  String venueCode = "";

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueCode': venueCode,
      };
}

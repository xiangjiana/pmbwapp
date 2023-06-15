import 'dart:convert';
import '../../utils/type_convert.dart';

T? asT<T>(String key, dynamic value) {
  // if (value is T) {
  //   return value;
  // }
  return asTFix(key, value, CustomTrace(StackTrace.current));
}

class DomainNameConfigPostReqModel {
  DomainNameConfigPostReqModel({
    required this.number,
    required this.bigType,
  });

  factory DomainNameConfigPostReqModel.fromJson(Map<String, dynamic> jsonRes) =>
      DomainNameConfigPostReqModel(
        number: jsonRes['number'] == null
            ? 0
            : asT<int>("number", jsonRes['number'])!,
        bigType: jsonRes['bigType'] == null
            ? 0
            : asT<int>("bigType", jsonRes['bigType'])!,
      );

  int number = 0;
  int bigType = 0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'number': number,
        'bigType': bigType,
      };
}

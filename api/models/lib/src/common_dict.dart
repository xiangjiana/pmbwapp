import 'package:dart_json_mapper/dart_json_mapper.dart';

/// country : "China"
/// code : "+86"
/// status : 1
/// currency : "CNY"
/// len : [11]
@jsonSerializable
class CommonDict {
  String? country;
  String? code;
  int? status;
  List<int>? len;

  CommonDict({this.country, this.code, this.status, this.len});

  CommonDict.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    code = json['code'];
    status = json['status'];
    len = json['len'].cast<int>();
  }

  Map<String, dynamic> toJson() {
    // ignore: prefer_collection_literals
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['country'] = country;
    data['code'] = code;
    data['status'] = status;
    data['len'] = len;
    return data;
  }
}

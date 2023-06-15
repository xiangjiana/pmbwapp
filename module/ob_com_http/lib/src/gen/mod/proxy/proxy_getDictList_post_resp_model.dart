import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyGetDictListPostRespModel {
  ProxyGetDictListPostRespModel({
    required this.virtualType,
    required this.virtualProtocolType,
  });

  factory ProxyGetDictListPostRespModel.fromJson(Map<String, dynamic> jsonRes) {
    final List<VirtualType>? virtualType =
        jsonRes['virtualType'] is List ? <VirtualType>[] : null;
    if (virtualType != null) {
      for (final dynamic item in jsonRes['virtualType']!) {
        if (item != null) {
          virtualType.add(VirtualType.fromJson(
              asT<Map<String, dynamic>>("virtualType", item)!));
        }
      }
    }

    final List<VirtualProtocolType>? virtualProtocolType =
        jsonRes['virtualProtocolType'] is List ? <VirtualProtocolType>[] : null;
    if (virtualProtocolType != null) {
      for (final dynamic item in jsonRes['virtualProtocolType']!) {
        if (item != null) {
          virtualProtocolType.add(VirtualProtocolType.fromJson(
              asT<Map<String, dynamic>>("virtualProtocolType", item)!));
        }
      }
    }
    return ProxyGetDictListPostRespModel(
      virtualType: virtualType == null ? [] : virtualType,
      virtualProtocolType:
          virtualProtocolType == null ? [] : virtualProtocolType,
    );
  }

  List<VirtualType> virtualType;
  List<VirtualProtocolType> virtualProtocolType;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'virtualType': virtualType,
        'virtualProtocolType': virtualProtocolType,
      };
}

class VirtualType {
  VirtualType({
    required this.code,
    required this.description,
  });

  factory VirtualType.fromJson(Map<String, dynamic> jsonRes) => VirtualType(
        code: jsonRes['code'] == null
            ? ''
            : asT<String>("code", jsonRes['code'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
      );

  String code = '';
  String description = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'description': description,
      };
}

class VirtualProtocolType {
  VirtualProtocolType({
    required this.code,
    required this.description,
  });

  factory VirtualProtocolType.fromJson(Map<String, dynamic> jsonRes) =>
      VirtualProtocolType(
        code: jsonRes['code'] == null
            ? ''
            : asT<String>("code", jsonRes['code'])!,
        description: jsonRes['description'] == null
            ? ''
            : asT<String>("description", jsonRes['description'])!,
      );

  String code = '';
  String description = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'code': code,
        'description': description,
      };
}

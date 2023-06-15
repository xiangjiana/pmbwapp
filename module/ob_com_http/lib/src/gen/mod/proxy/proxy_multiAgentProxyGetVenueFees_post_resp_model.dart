import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

// T? asT<T>(String key, dynamic value) {
//   // if (value is T) {
//   //   return value;
//   // }
//   return asTFix(key, value, CustomTrace(StackTrace.current));
// }

class ProxyMultiAgentProxyGetVenueFeesPostRespModel {
  ProxyMultiAgentProxyGetVenueFeesPostRespModel({
    required this.data,
  });

  factory ProxyMultiAgentProxyGetVenueFeesPostRespModel.fromJson(
      Map<String, dynamic> jsonRes) {
    final List<ProxyMultiAgentProxyGetVenueFeesPostRespModelData>? data = jsonRes['data'] is List ? <ProxyMultiAgentProxyGetVenueFeesPostRespModelData>[] : null;
    if (data != null) {
      for (final dynamic item in jsonRes['data']!) {
        if (item != null) {
          data.add(ProxyMultiAgentProxyGetVenueFeesPostRespModelData.fromJson(asT<Map<String, dynamic>>("data", item)!));
        }
      }
    }
    return ProxyMultiAgentProxyGetVenueFeesPostRespModel(
      data: data == null ? [] : data,
    );
  }

  List<ProxyMultiAgentProxyGetVenueFeesPostRespModelData> data;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

class ProxyMultiAgentProxyGetVenueFeesPostRespModelData {
  ProxyMultiAgentProxyGetVenueFeesPostRespModelData({
    required this.platformAmount,
    required this.totalNetAmount,
    required this.venueName,
    required this.venueRate,
  });

  factory ProxyMultiAgentProxyGetVenueFeesPostRespModelData.fromJson(Map<String, dynamic> jsonRes) => ProxyMultiAgentProxyGetVenueFeesPostRespModelData(
        platformAmount: jsonRes['platformAmount'] == null
            ? 0.0
            : asT<double>("platformAmount", jsonRes['platformAmount'])!,
        totalNetAmount: jsonRes['totalNetAmount'] == null
            ? 0.0
            : asT<double>("totalNetAmount", jsonRes['totalNetAmount'])!,
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
        venueRate: jsonRes['venueRate'] == null
            ? 0.0
            : asT<double>("venueRate", jsonRes['venueRate'])!,
      );

  double platformAmount = 0.0;
  double totalNetAmount = 0.0;
  String venueName = '';
  double venueRate = 0.0;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'platformAmount': platformAmount,
        'totalNetAmount': totalNetAmount,
        'venueName': venueName,
        'venueRate': venueRate,
      };
}

import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class GameGameCenterWalletAllToVenuePostRespModel {
  GameGameCenterWalletAllToVenuePostRespModel({
    required this.data,
  });

  factory GameGameCenterWalletAllToVenuePostRespModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameGameCenterWalletAllToVenuePostRespModel(
        data: jsonRes['data'] == null
            ? false
            : asT<bool>("data", jsonRes['data'])!,
      );

  bool data = false;

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data,
      };
}

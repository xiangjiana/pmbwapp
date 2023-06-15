import 'dart:convert';
import 'package:ob_com_http/src/utils/as_t.dart';

class GameGameCenterWalletAllToVenuePostReqModel {
  GameGameCenterWalletAllToVenuePostReqModel({
    required this.venueName,
  });

  factory GameGameCenterWalletAllToVenuePostReqModel.fromJson(
          Map<String, dynamic> jsonRes) =>
      GameGameCenterWalletAllToVenuePostReqModel(
        venueName: jsonRes['venueName'] == null
            ? ''
            : asT<String>("venueName", jsonRes['venueName'])!,
      );

  String venueName = '';

  @override
  String toString() {
    return jsonEncode(this);
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'venueName': venueName,
      };
}

import 'package:dart_json_mapper/dart_json_mapper.dart';




@jsonSerializable
class GameBottomBanner {

  String id;

  String merchantId;

  String bannerName;

  int isLink;

  int linkTargetId;

  String linkTargetUrl;

  String pictureUrl;


  int status;
  int gameId;

  String venueTypeCode;
  String venueCode;

  GameBottomBanner(this.id,this.merchantId,this.bannerName,this.isLink,this.linkTargetId,this.linkTargetUrl,this.pictureUrl,this.status,this.gameId,this.venueTypeCode,this.venueCode);


}



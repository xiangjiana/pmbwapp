

import 'package:dart_json_mapper/dart_json_mapper.dart';


@jsonSerializable
class MyCollectionGameList  {

  int pageNum;


  int pageSize;


 late List<MyCollectionGameListRecord> record;



  int totalPage;

  int totalRecord;

  MyCollectionGameList(this.pageNum,this.pageSize,record,this.totalPage,this.totalRecord,){
    this.record =record.cast<MyCollectionGameListRecord>();
  }


}



@jsonSerializable
class MyCollectionGameListRecord  {

  String collectId;

  int collectStatus; ///0–未收藏 1–已收藏

  String gameName;

  String gameId;


  String venueName;

  int iconStatus;

  String iconUrl;

  String id;

  String memberId;

  String merchantId;

  int status;

  String supportTerminals;

  String venueCode;

  String venueTypeCode;

  MyCollectionGameListRecord(this.collectId,this.collectStatus,this.gameName,this.gameId,this.iconStatus,this.iconUrl,this.id,this.memberId,this.merchantId,this.status,this.supportTerminals,this.venueCode,this.venueTypeCode,this.venueName);



}




  

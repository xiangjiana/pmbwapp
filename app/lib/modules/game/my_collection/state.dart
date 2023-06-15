import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:models/models.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MyCollectionState {
  List<MyCollectionGameListRecord>? myCollectionGameListRecord;
  int type = 0;//0 收藏 1 最近游戏  2
  int pageNum = 1;
  int total = 0;
  bool isFetchingData = false;
  MyCollectionState() {
    type = Get.arguments['type'] ;
  }
}

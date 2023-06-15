import 'package:game/game.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';

import 'state.dart';

class MyCollectionLogic extends GetxController {
  final MyCollectionState state = MyCollectionState();

  @override
  void onReady() {
    queryMyCollectionGameList();
    super.onReady();
  }

  queryMyCollectionGameList({bool isRefresh =true}) async {
    if (state.isFetchingData) return;
    if(state.myCollectionGameListRecord!=null){
      if (state.myCollectionGameListRecord!.isNotEmpty && state.total == state.myCollectionGameListRecord!.length) return;
    }
    state.isFetchingData = true;
    try{
      MyCollectionGameList? myCollectionGameList;
      if(state.type==0){
        myCollectionGameList   =   await    Get.find<GameApi>().queryMyCollectionGameList(MyCollectionParam(
          pageNum: state.pageNum,pageSize: 999, gameId: 0,
        ));
      }else if(state.type==1){
        myCollectionGameList   =   await    Get.find<GameApi>().queryNearVenueGameList(NearVenueGameListParam(nearFlag: 1,
          pageNum: state.pageNum,pageSize: state.pageNum==1?28:4,
        ));
      }else{
        myCollectionGameList   = await Get.find<GameApi>()
            .queryRecommendVenueGameList(
            RecommendVenueGameListParam(pageNum:  state.pageNum, pageSize: state.pageNum==1?28:4));
      }
      if(state.pageNum==1){
        state.pageNum=8;
      }else{
        state.pageNum++;
      }
      if(isRefresh){
        state.total = myCollectionGameList.totalRecord;
      }
      state.myCollectionGameListRecord ??= [];
      state.myCollectionGameListRecord!.addAll(myCollectionGameList.record);
    }catch (e){

    }finally{
      state.isFetchingData = false;
      update();
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

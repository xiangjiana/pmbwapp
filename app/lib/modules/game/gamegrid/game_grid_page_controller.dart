import 'package:flutter/material.dart';
import 'package:game/game.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:params/params.dart';

class GameGridPageController extends GetxController {
  final gameApi = Get.find<GameApi>();
  final mainApi = Get.find<MainApi>();
  RxList<MyCollectionGameListRecord> list = <MyCollectionGameListRecord>[].obs;
  RxInt total = 0.obs;
  ScrollController scrollController = ScrollController();
  bool isFetchingData = false;
  int pageNum = 1;
  RxInt orderKey = 3.obs; //排序类型(1-游戏名称 a-z 2.游戏名称z-a 3–热门 4–最新)
  RxBool showFilter1 = false.obs;
  RxBool showFilter2 = false.obs;
  RxList<VenueTypeCodeAndVenues> venueTypeCodeAndVenues =
      <VenueTypeCodeAndVenues>[].obs; //全部可选的场馆
  RxList<Venue> venueListSelected = <Venue>[].obs; //已选的
  RxList<Venue> venueListTempSelected = <Venue>[].obs; //已选的
  RxString venueTypeCode = "".obs;
  RxString title = "".obs;
  RxList<Map> orders=<Map>[].obs;

  @override
  void onInit() {
    super.onInit();
    orders.add({"value":1,"name":"A-Z","iconAssetPath":Assets.images.jiantouDown3x1.path});
    orders.add({"value":2,"name":"Z-A","iconAssetPath":Assets.images.jiantouUP3x.path});
    orders.add({"value":4,"name":"up_to_date".tr,"iconAssetPath":Assets.images.new3x.path});
    orders.add({"value":3,"name":"hotest".tr,"iconAssetPath":Assets.images.hot3x.path});
    venueTypeCode.value = Get.parameters['venueTypeCode'] ?? "";
    title.value = Get.parameters['title'] ?? "";
    fetchVenueTypeCodeAndVenues();
    fetchData();
    scrollController.addListener(() {
      if (scrollController.offset / scrollController.position.maxScrollExtent >
          0.99) {
        // fetchData();
      }
    });
  }

  fetchVenueTypeCodeAndVenues() async {
    List<VenueTypeCodeAndVenues> r = await mainApi.venueList();
    r.forEach((element) {
      if (element.venueTypeCode == venueTypeCode.value) {
        venueTypeCodeAndVenues.add(element);
      }
    });
  }

  refreshData() {
    list.clear();
    pageNum = 1;
    fetchData();
  }

  fetchData() async {
    try {
      if (isFetchingData) return;
      if (list.isNotEmpty && total.value == list.length) return;
      isFetchingData = true;
      VenueGameListParam venueGameListParam = VenueGameListParam(
          venueCode:
              venueListSelected.map((element) => element.venueCode).join(","),
          pageNum: pageNum,
          pageSize: pageNum==1?28:4,
          orderBy: "",
          oderKey: orderKey.value,
          venueTypeCode: venueTypeCode.value);
      MyCollectionGameList myCollectionGameList =
          (await gameApi.queryVenueGameList(venueGameListParam));
      total.value = myCollectionGameList.totalRecord;
      list.addAll(myCollectionGameList.record); 
      isFetchingData = false;
      if(pageNum==1){
        pageNum=8;
      }else{
        pageNum++;
      }
    } catch (e) {
      isFetchingData = false;
    }
  }
}

import 'package:flutter/material.dart';
import 'package:game/game.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:models/models.dart';
import 'package:params/params.dart';

class VenueListPageController extends GetxController {
  final gameApi = Get.find<GameApi>();
  final mainApi = Get.find<MainApi>();
  RxList<ConfigGameNew> list = <ConfigGameNew>[].obs;
  RxInt total = 0.obs;
  ScrollController scrollController = ScrollController();
  bool isFetchingData = false;
  int pageNum=1;
  RxInt orderKey=1.obs;//排序类型(1-游戏名称 a-z 2.游戏名称z-a 3.)
  String orderBy="";//排序方式(ASC 和 DESC)
  RxBool showFilter1=false.obs;
  RxBool showFilter2=false.obs;
  RxList<VenueTypeCodeAndVenues> venueTypeCodeAndVenues=<VenueTypeCodeAndVenues>[].obs;//全部可选的场馆
  RxList<Venue> venueListSelected=<Venue>[].obs;//已选的
  RxString venueTypeCode="".obs;
  RxString title="".obs;

  @override
  void onInit() {
    super.onInit();
    venueTypeCode.value = Get.parameters['venueTypeCode'] ?? "";
    title.value = Get.parameters['title'] ?? "";
    fetchVenueTypeCodeAndVenues();
  //  fetchData();
    scrollController.addListener(() {
      if (scrollController.offset / scrollController.position.maxScrollExtent >
          0.99) {
       // fetchData();
      }
    });
  }

  fetchVenueTypeCodeAndVenues()async{
    List<VenueTypeCodeAndVenues> r=await mainApi.venueList();
    r.forEach((element) { 
      if(element.venueTypeCode==venueTypeCode.value){
        venueTypeCodeAndVenues.add(element);
      }
    });
  }

  refreshData(){
    list.clear();
    pageNum=1;
    fetchData();
  }
  fetchData() async {
    try {
      if (isFetchingData) return;
      if (list.isNotEmpty&&total.value==list.length) return;
      isFetchingData = true;
      VenueDyPcParam venueDyPcParam=VenueDyPcParam(
              venueCode: venueListSelected.map((element) => element.venueCode).join(","),
              pageNum: pageNum,
              pageSize: 28,
              orderBy: orderBy,
              oderKey: orderKey.value,
              venueTypeCode: venueTypeCode.value);
      VenueDyPcPageResponse venueDyPcPageResponse = (await mainApi.venueDyPc(venueDyPcParam ));
      print(venueDyPcPageResponse);
      total.value = venueDyPcPageResponse.totalRecord;
      list.addAll(venueDyPcPageResponse.record);
      isFetchingData = false;
      pageNum++;
    } catch (e) {
      isFetchingData = false;
    }
  }
}

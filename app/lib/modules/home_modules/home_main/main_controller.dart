import 'dart:async';

import 'package:bank/bank.dart';
import 'package:config/config.dart';
import 'package:game/game.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_package/modules/home/components/controller/home_widget_auto_refresh_manager.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/src/gen/mod/messageCenter/messageCenter_selectAnnounceList_post_resp_model.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page_controller.dart';
import 'package:ob_package/utils/GameUtils.dart';
import 'package:params/params.dart';
import 'package:sp_util/sp_util.dart';

import '../../../utils/showcaseview/src/showcase_widget.dart';
import '../../home/home_controller.dart';
import '../../records/discount/discount_activity_controller.dart';
import '../../records/discount/discount_controller.dart';

class MainController extends GetxController {
  late BuildContext context;
  final AuthService authService;
  final repository = Get.find<HomeRepository>();
  MainController(this.authService);
  final GlobalKey one = GlobalKey();
  RxList<VenueTypeCodeAndVenues> venueDataList = <VenueTypeCodeAndVenues>[].obs;
  RxList<VenueTypeCodeAndVenues> bottomVenueDataList =
      <VenueTypeCodeAndVenues>[].obs;
  List<VenueTypeCodeAndVenues> oriDataList = <VenueTypeCodeAndVenues>[];
  late StreamSubscription refreshListener;
  List<GameBottomBanner> gameBottomBanner = <GameBottomBanner>[];

  List<MyCollectionGameListRecord> recommendVenueGameLists = [];
  @override
  void onInit() {
    super.onInit();
    Get.put(DiscountActivityController());

    refreshListener = eventBus.on<HomeModuleEvent>().listen((event) {
      if ((Get.currentRoute == AppRoutes.HOME ||
              Get.currentRoute.startsWith("/web_iframe")) &&
          Store.currentRootPageIndex == 0 &&
          event.name == homeTopTimerRefresh) {
         getMainMerchantGameListPost();
         queryRecommendVenueGameList();
      }
    });
    initData();
  }

  initData(){
    getMainMerchantGameListPost();
    getRecommendBanner();
    queryRecommendVenueGameList();
    getBottomBanner();
  }

  setCollection(int index, int collectStatus, int collectId, int gameId,
      MyCollectionGameListRecord record) async {
    await Get.find<GameApi>().collectVenueGame(CollectVenueGameParam(
        collectFlag: collectStatus == 0 ? 1 : 0,
        collectId: collectId,
        gameId: gameId));
    record.collectStatus = collectStatus == 0 ? 1 : 0;
    update([index]);
  }

  queryRecommendVenueGameList() async {
    MyCollectionGameList recommendVenueGameList = await Get.find<GameApi>()
        .queryRecommendVenueGameList(
            RecommendVenueGameListParam(pageNum: 1, pageSize: 20));
    recommendVenueGameLists = recommendVenueGameList.record;
    update(['queryRecommendVenueGameList']);
  }

  getRecommendBanner() async {
    final resp  =  await Get.find<ConfigApi>()
        .clientConfigAll(ClientConfigParam(resourcesType: '0'));
    /// banner
    final resBannerList = resp.configBannerRespDTOList;
    Store.bannerList.value = resBannerList;
    update(['recommendBanner']);
  }

  getBottomBanner() async {
    GameBottomBanner gameBottomBanner =
        await Get.find<GameApi>().queryBottomBanner();
    this.gameBottomBanner.clear();
    this.gameBottomBanner.add(gameBottomBanner);
    update(['bottomBanner']);
  }

  @override
  void onClose() {
    refreshListener.cancel();
    super.onClose();
  }

  bool isFirst = true;

  String lastData = "";

  /**
   * 获取首页场馆列表数据
   */
  Future<void> getMainMerchantGameListPost() async {
    try {
      final List<VenueTypeCodeAndVenues> res =
          await repository.getMainMerchantGameListPost();
      res.removeWhere((element) {
        return element.venueList.isEmpty;
      });
      //请求到的数据同时存一份给h5那边使用
      GameUtils.gameTypeList = [];
      GameUtils.gameTypeList!
          .addAll(res.where((element) => element.venueList.length > 0));
      if (!kIsWeb) {
        GameUtils.syncNativeGameTypeList(res);
      } else {
        //同时如果当前打开了h5游戏页面那么刷新抽屉数据
        var webIframePageController = Get.findOrNull<WebIframePageController>();
        if (webIframePageController != null) {
          webIframePageController.onGameTypeListUpdate(res);
        }
      }
      lastData = JsonMapper.serialize(res);
      oriDataList = res;
      handleDataListAndUpdate();
    } catch (_) {
    } finally {
      // if (isFirst) {
      //   int showCaseNum = SpUtil.getInt(
      //     'showCaseNum',
      //   )!;
      //   if (showCaseNum < 3) {
      //     ShowCaseWidget.of(context).startShowCase([
      //       Get.find<MainController>().one,
      //     ]);
      //     Future.delayed(Duration(seconds: 4), () {
      //       ShowCaseWidget.of(context).dismiss();
      //     });
      //   }
      // }
      //
      // isFirst = false;
    }
  }


  Future<void> updateVenue(String? gameType,String? gameCode) async {
    if(gameType!=null&&gameCode!=null){
      await SpUtil.putString(gameType,
          gameCode);
      handleDataListAndUpdate();
    }
  }

  void handleDataListAndUpdate() {
    List<VenueTypeCodeAndVenues> hDataList = <VenueTypeCodeAndVenues>[];
    if (oriDataList.isEmpty) return;
    hDataList.addAll(oriDataList);

    ///处理：默认选中ob场馆  ///status状态(0已禁用,1开启中,2维护中)
    hDataList.forEach((element) {
      String? venueCode = SpUtil.getString(
        element.venueTypeCode,
      );

      ///1.优先查找最近玩的游戏
      if (ObjectUtil.isNotEmpty(venueCode)) {
        for (int i = 0; i < element.venueList.length; i++) {
          if (element.venueList[i].venueCode == venueCode) {
            if (element.venueList[i].status != 0) {
              element.venueSelected = element.venueList[i];
            }
            break;
          }
        }
      }

      ///2.如果没从最近完的游戏中查到，从ob里面赋值
      if (element.venueSelected == null) {
        for (int i = 0; i < element.venueList.length; i++) {
          if (element.venueList[i].isOb == 1) {
            if (element.venueList[i].status != 0) {
              element.venueSelected = element.venueList[i];
            }
            break;
          }
        }
      }

      ///3.从最近的顺序获取
      if (element.venueSelected == null) {
        for (int i = 0; i < element.venueList.length; i++) {
          if (element.venueList[i].status != 0) {
            element.venueSelected = element.venueList[i];
            break;
          }
        }
      }
    });
    // List<VenueTypeCodeAndVenues> preVenueDataList = [];
    // preVenueDataList.addAll(hDataList);
    //
    // ///1.先移除ob电子和ob哈希
    // preVenueDataList.removeWhere((element) =>
    //     element.venueTypeCode == "qkl" || element.venueTypeCode == "dy");
    // venueDataList.value = preVenueDataList;

    venueDataList.value = hDataList;
    // ///2.底部的ob电子和ob哈希
    // List<VenueTypeCodeAndVenues> preBottomVenueDataList = [];
    // preBottomVenueDataList.addAll(hDataList);
    // preBottomVenueDataList.removeWhere((element) =>
    //     element.venueTypeCode != "qkl" && element.venueTypeCode != "dy");
    // bottomVenueDataList.value = preBottomVenueDataList;
  }

  List<MessageCenterSelectAnnounceListPostRespModelData> removeDuplicates(
      List<MessageCenterSelectAnnounceListPostRespModelData> list) {
    var _a = new Set();
    List<MessageCenterSelectAnnounceListPostRespModelData> _h = [];
    for (int i = 0; i < list.length; i++) {
      _a.add(list[i].id);
    }
    List _b = _a.toList();
    for (int j = 0; j < _a.length; j++) {
      for (int i = 0; i < list.length; i++) {
        if (_b[j] == list[i].id) {
          _h.add(list[i]);
          break;
        }
      }
    }
    return _h;
  }
}

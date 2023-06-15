import 'dart:async';

import 'package:exception/exception.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:models/models.dart' hide GameLogin;
import 'package:ob_com_base/ob_com_base.dart' hide window;
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/login_game/login_game.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_package/modules/home_modules/home_main/main_controller.dart';
import 'package:ob_package/utils/GameUtils.dart';
import 'package:params/params.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:sp_util/sp_util.dart';

import './ui_fake.dart' if (dart.library.html) 'dart:html';
import './ui_fake.dart' if (dart.library.html) 'dart:ui' as ui;
import './ui_fake.dart' if (dart.library.html) 'dart:js' as js;
import 'components/flow_details_dialog.dart';

class WebIframePageController extends GetxController {
  final mainApi = Get.find<MainApi>();
  IFrameElement? iFrameElement; //html的iframe元素
  Rx<double> progeess = 0.0.obs; //进度条进度0~1
  Rx<bool> progeessShow = true.obs; //是否显示进度条 加载完成1秒后隐藏
  Rx<bool> loaded = false.obs; //是否加载完成
  Rx<bool> fullscreen = false.obs; //是否全屏
  Rx<bool> showGames = false.obs; //是否显示分类下面游戏 暂时用这个控制  后面根据接口数据改
  late final StreamSubscription? listener; //加载事件监听
  AnimationController? animationController; //进度条动画控制器
  String viewId = "";
  RxList<VenueTypeCodeAndVenues> gameTypeList =
      (GameUtils.gameTypeList ?? []).where((element) => element.venueList.length > 0).toList().obs; //游戏分类和分类下的游戏数据
  Rx<int> gameTypeIndex = (-1).obs; //当前选中的分类，默认-1是没有对应的分类，比如电子，就不展示两层抽屉
  // Rx<int> gameIndex = 0.obs; //当前选中的游戏
  Rx<bool> expanded = false.obs; //是否显示当前分类下的游戏
  Rx<bool> runWaterHide = true.obs; //是否显示流水图标
  Rx<bool> isInTopPage =
      true.obs; //当前是不是在顶部页面，因为使用了PointerInterceptor，如果不在本页面需要隐藏PointerInterceptor相关，否则影响上层页面点击，导致不能返回。
  Rx<String> gameCode = "".obs;
  Rx<String> venueType = "".obs;
  RxList<ConfigGameNew> dyGameList = <ConfigGameNew>[].obs; //电游数据列表
  final repository = Get.find<HomeRepository>();

  //游戏code和对应小图标的映射
  Map<String, String> gameCodeIconMap = {
    "ty": Assets.images.venue.typeTiyu.path,
    "zr": Assets.images.venue.typeZhenren.path,
    "qp": Assets.images.venue.typeQipai.path,
    "cp": Assets.images.venue.typeCaipiao.path,
    "dj": Assets.images.venue.typeDianjin.path,
    "by": Assets.images.venue.typeBuyu.path,
    "qkl": Assets.images.venue.typeHaxi.path,
    "dy": Assets.images.venue.typeDianzi.path,
  };

  //游戏code和对应背景图的映射
  Map<String, String> gameCodeBgMap = {
    "ty": Assets.images.venue.cgJumpTiyu.path,
    "zr": Assets.images.venue.cgJumpZhenren.path,
    "qp": Assets.images.venue.cgJumpQipai.path,
    "cp": Assets.images.venue.cgJumpCaipiao.path,
    "dj": Assets.images.venue.cgJumpDianjing.path,
    "by": Assets.images.venue.cgJumpBuyu.path,
    "qkl": Assets.images.venue.cgJumpQukuailian.path,
    "dy": Assets.images.venue.cgJumpDianzi.path,
  };
  String gameUrl = ''; //游戏url，用于刷新
  Rx<String> gameName = ''.obs; //游戏名称
  Rx<String> dyGameVenueName = ''.obs; //电游场馆名称
  ScrollController gameCatesScrollController=ScrollController();
  @override
  void onInit() {
    super.onInit();
    eventBus.fire(FloatBonusEvent(show: false));
    Store.nativeRouting = AppRoutes.GAME;
    viewId = 'web-iframe-page#${DateTime.now().millisecondsSinceEpoch}';
    gameCode.value = Get.parameters['gameCode'] ?? "";
    String gameType = Get.parameters['gameType'] ?? "";
    Future.delayed(Duration(milliseconds: 100), () {
      setGameTopToolsZIndexAndPosition();
    });
    findGameTypeIndex();
    ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      IFrameElement element = IFrameElement();
      element.style.border = 'none';
      iFrameElement = element;
      element.addEventListener("load", (e) {
        loaded.value = true;
        animationController?.reset();
        //加载完成3秒后全屏，3秒后需要先判断loaded以免3秒内用户点了刷新或者切换别的游戏导致还在加载中
        Future.delayed(Duration(seconds: 5), () {
          if (loaded.value) {
            progeessShow.value = false;
            fullscreen.value = true;
          }
        });
      });
      return element;
    });
    listener = window.onMessage.listen(messageHandler);
    if (gameType == 'dy') {
      fullscreen.value = true;
      progeessShow.value = false;
      getGameListByVenueCode(gameCode.value);
      toogleShowGames(gameTypeList[gameTypeIndex.value]);
      gameName.value = findVenue(gameCode.value, gameType)?.venueName ?? "";
      showGames.value = false;
      String? gameId=Get.parameters['gameId'];
      if(gameId!=null&&gameId.isNotEmpty){
        loginGame(gameCode.value, gameType,gameId: Get.parameters['gameId']);
      }
      dyGameVenueName.value = Get.parameters['gameName'] ?? "";
    }else{
      ifShouldShowWaterFlowIcon();
      loginGame(gameCode.value, gameType,gameId: Get.parameters['gameId']);
    }
    gameCatesScrollTo();
    Future.delayed(Duration(milliseconds: 500),(){
        gameCatesScrollTo();
    });
  }
  //滚动游戏类别到合适位置
  gameCatesScrollTo(){
    if(gameTypeIndex.value>=4){
      try {
        gameCatesScrollController.jumpTo(gameCatesScrollController.position.maxScrollExtent);
      } catch (e) {

      }
    }
  }

  //获取电子游戏列表
  getGameListByVenueCode(String venueCode) async {
    runCatch(() async {
      List<ConfigGameNew> games = await mainApi.venueDyNew(VenueDyNewParam(venueCode: venueCode));
      games.removeWhere((element) => element.status == 0);
      dyGameList.value = games;
      fullscreen.value = false;
    }, onError: (e) {
      showToast(e.toString());
    });
  }

  //调用js方法设置游戏页面顶部工具栏的position和index作为，避免一些游戏遮挡住点击事件
  setGameTopToolsZIndexAndPosition() {
    js.context.callMethod("setGameTopToolsZIndexAndPosition", []);
  }

  //游戏列表数据更新的回调
  onGameTypeListUpdate(List<VenueTypeCodeAndVenues> data) {
    gameTypeList.clear();
    gameTypeList.addAll(data.where((element) => element.venueList.length > 0));
    //findGameTypeIndex();
  }

  //根据具体当前游戏的gameCode找到是属于哪个分类的，让这个分类高亮
  findGameTypeIndex() {
    gameTypeIndex.value = -1;
    gameTypeList.forEach((element) {
      element.venueList.forEach((vneue) {
        if (vneue.venueCode == gameCode.value) {
          gameTypeIndex.value = gameTypeList.indexOf(element);
        }
      });
    });
  }

  //获取场馆
  Venue? findVenue(gameCode_, venueType_) {
    Venue? venueList;
    gameTypeList.forEach((gameType) {
      if (gameType.venueTypeCode == venueType_) {
        gameType.venueList.forEach((venue) {
          if (venue.venueCode == gameCode_) {
            venueList = venue;
          }
        });
      }
    });
    return venueList;
  }

  //登录别的游戏
  loginGame(gameCode_, venueType_, {String? gameId}) {
    if (!CoolDownManager.handler(key: 'h5LoginGame', duration: 500)) return;
    //判断是否维护中
    if (findVenue(gameCode_, venueType_)?.status == 2) {
      OBDialogUtil.show(
        PointerInterceptor(
            child: ObDialog.alert(
          title: 'alert'.tr,
          content: 'this_venue_is_under_maintenance_please_select_another_venue'.tr,
          confirmText: 'confirm'.tr,
          onConfirmListener: () {
            Get.back();
          },
        )),
      );
      return;
    }
    var req = LoginGameParam(
      gameCode: gameCode_,
      gameId: gameId!=null?int.tryParse(gameId):null,
      backUrl: getBackUrl(gameCode_,venueType_),
    ); 
    progeessShow.value = false;
    animationController?.reset();
    showLoading();
    if (h5GameShouldOpenInNewWindow(gameCode_, venueType_)) {
      WebUtil.windowPreOpen();
    }

    mainApi.login(req).then(
      (resp) {
        dismissLoading();
        String url = resp.url;
        if(gameCode_=="wgb"){
          url+=";embedStyle=iframe";
        }
        if (h5GameShouldOpenInNewWindow(gameCode_, venueType_)) {
          WebUtil.openInBrowser(url);
          return;
        }
        animationController?.animateTo(1);
        loaded.value = false;
        progeessShow.value = true;
        gameCode.value = gameCode_;
        venueType.value = venueType_;
        iFrameElement!.src = url;
        gameUrl = url;
        showGames.value = !showGames.value;
        if (resp.type == 0) {
          GameLoginUtils.showTransferWebDialog(url, 0, gameCode.value, "", "");
        }
        runWaterHide.value = true;
        ifShouldShowWaterFlowIcon();
        gameName.value = findVenue(gameCode_, venueType_)?.venueName ?? "";
      },
      onError: (e) {
      try {
        final serviceException = e.error as ServerException;
        gameCatesScrollTo();
        OBDialogUtil.show(
          PointerInterceptor(
              child: ObDialog.alert(
            title: 'alert'.tr,
            content: serviceException.message,
            confirmText: 'confirm'.tr,
            onConfirmListener: () {
              Get.back();
            },
            // onCancelListener: () {
            //   Get.back();
            // },
          )),
        );
      } catch (e) {
        print(e);
      }
    }
    ).catchError(
      (code, msg) {
        if (h5GameShouldOpenInNewWindow(gameCode_, venueType_)) {
          WebUtil.windowClose();
        }
        dismissLoading();
        OBDialogUtil.show(
          PointerInterceptor(
              child: ObDialog.alert(
            title: 'alert'.tr,
            content: msg,
            confirmText: 'confirm'.tr,
            onConfirmListener: () {
              Get.back();
            },
            // onCancelListener: () {
            //   Get.back();
            // },
          )),
        );
      },
    );
  }


  //判断是否需要显示流水图标
  ifShouldShowWaterFlowIcon() async {
    await BalanceManager.syncAll();
    final wallet = BalanceManager.walletItems.where((e) => e.id == gameCode.value).toList();
    if (wallet.isNotEmpty) {
      runWaterHide.value = !wallet.first.vipActivityGoing;
    } else {
      runWaterHide.value = true;
    }
  }

  showRunWater() async {
    final model = await myWalletRepository.getFlowDetail(gameCode.value);
    // 已完成流水 不弹对话框
    if (model.billAmount == 0) {
      showToast("completed_the_event_for_this_venue".tr);
      return;
    }
    var activityName = model.activityName;
    var billAmount = model.billAmount;
    var completeBillAmount = model.completeBillAmount;

    OBDialogUtil.show(
      PointerInterceptor(
          child: FlowDetailsDialog(
        activityName: activityName,
        billAmount: billAmount.toDouble(),
        completeBillAmount: completeBillAmount.toDouble(),
        percentage: double.tryParse(
          numberFormat(model.completeBillAmount / model.billAmount * 100),
        )!,
      )),
    );
  }

  void messageHandler(event) {
    final data = event.data;
    try {
      //处理真人的退出游戏事件
      if (data['eventType'] == 'game-close') {
        Get.back();
      }
    } catch (e) {}
  }

  //刷新
  void refresh() {
    // animationController?.reset();
    // loaded.value = false;
    // progeessShow.value = true;
    // iFrameElement!.src = gameUrl;
    loginGame(gameCode.value, venueType.value);
  }

  //切换全屏
  void toogleFullscreen() {
    fullscreen.value = !fullscreen.value;
    //从全屏切换到非全屏刷新抽屉数据，这里直接调用首页的方法
    if (!fullscreen.value) {
      Get.findOrNull<MainController>()?.getMainMerchantGameListPost();
    }
  }

  //如果点击的是当前选中的分类那么切换是否显示分类下的游戏，如果点击的是其他分类那么直接显示分类下游戏
  void toogleShowGames(VenueTypeCodeAndVenues gameTypeData) {
    if (gameTypeData == gameTypeList[gameTypeIndex.value]) {
      showGames.value = !showGames.value;
    } else {
      gameTypeIndex.value = gameTypeList.indexOf(gameTypeData);
      showGames.value = true;
    }
  }

  @override
  void onClose() {
    super.onClose();
    Store.nativeRouting = "";
    listener?.cancel();
  }
}

//h5游戏是否应该在新窗口打开
bool h5GameShouldOpenInNewWindow(String gameCode, String gameType) {
  List<String> gameCodes = [
    'by',
    'zr',
    'agby',
    'agzr',
    'imone-sb',
    'evo-zr',
  ];
  List<String> gameTypes = ['dy'];
  if (gameCodes.contains(gameCode) || gameTypes.contains(gameType)) {
    return true;
  }
  return false;
}

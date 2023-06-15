import 'dart:async';
import 'dart:convert';

import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:models/models.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_package/modules/home_modules/home_float/float_controller.dart';
import 'package:ob_package/utils/store2.dart';

import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_package/modules/home/home_repository.dart';
import 'package:ob_package/modules/home_modules/home_user/user_controller.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart';
import 'components/controller/home_widget_auto_refresh_manager.dart';

class HomePageController extends AppGetController with KeyboardManager {
  static double? bottomNavigationBarHeight;
  GlobalKey drawerKey = GlobalKey();
  ScrollController singleChildScrollViewScrollController = ScrollController();
  PageController pageCtrl = PageController(keepPage: false); //设置小于1以便pageview可以预加载前后的页面内容，提高用户体验
  ScrollController scrollController = ScrollController();
  late StreamSubscription refreshListener; // home tab eventBus
  late StreamSubscription refreshTimerListener; // home  timer eventBus
  late Timer gameLoginRefreshTimer;
  late StreamSubscription backTopListener;
  final repository = Get.find<HomeRepository>();
  RxBool isBackTop = false.obs;
  var currentIndex = 0.obs;
  double collectionPageHeight = 1.sh - 70.w;
  RxBool isShow = false.obs;
  RxInt gameIndex = 0.obs; //选择标
  int asyncFinishIndex = -1;
  final List hasRequestedList = List.filled(
    Store.homeGameModules.length,
    false,
  );
  final _obscureAmount = true.obs;

  //隐藏显示余额
  bool get obscureAmount => _obscureAmount.value;

  void toggleObscure() => _obscureAmount.value = !obscureAmount;
  var addEventListener;

  String getChangGuanBg(int index) {
    String path = "";
    switch (index) {
      case 0:
        path = Assets.images.icon.changguanTy.path;
        break;
      case 1:
        path = Assets.images.icon.changguanZr.path;
        break;
      case 2:
        path = Assets.images.icon.changguanDj.path;
        break;
      case 3:
        path = Assets.images.icon.changguanQp.path;
        break;
      case 4:
        path = Assets.images.icon.changguanPy.path;
        break;
      case 5:
        path = Assets.images.icon.changgaunCp.path;
        break;
    }

    return path;
  }

  @override
  void onInit() {
    super.onInit();
    hideKeyboard();
    NativeUtils.applyNavigationBarColor(1);
    currentIndex.value = 0;
    Store.appActiveTime = DateTime.now();
    loadHomeDataAndQuery();
    initSupportPhoneCode();
    // tab eventBus
    refreshListener = eventBus.on<HomeTabChange>().listen((event) {
      if (event.index == 0) {
        refreshHomeData(event.index);
        BalanceManager.syncAll();
      }
    });
    refreshListener = eventBus.on<HomeModuleEvent>().listen((event) {
      if (event.name == memberUnReadAndBonusTimerRefresh) {
        memberUnReadAndBonus(currentIndex.value);
      }
    });
    // timer eventBus
    refreshTimerListener = eventBus.on<HomeModuleEvent>().listen((event) {
      if (event.name == homeTopTimerRefresh) {
        refreshHomeData(currentIndex.value);
      }
    });
    HomeWidgetAutoRefreshManager.instance.startRefreshTimer();

    backTopListener = eventBus.on<BackTopEvent>().listen((event) {
      isBackTop.value = event.show;
    });

    getDownloadUrl();
  }

  void onTap(int index) async {
    try {
      if ((index == 2 || index == 3) && !Store.isLogin.value) {
        if((drawerKey.currentState as ScaffoldState).isDrawerOpen){
          (drawerKey.currentState as ScaffoldState).closeDrawer();
        }
        Get.toNamed(AppRoutes.LOGIN);
        return;
      }
      if(index!=0){
        if((drawerKey.currentState as ScaffoldState).isDrawerOpen){
          (drawerKey.currentState as ScaffoldState).closeDrawer();
        }
      }


      // if (index == 0 && index == currentIndex.value) {
      //   //多次点击回到顶部
      //   scrollController.animateTo(0,
      //       duration: Duration(milliseconds: 300), curve: Curves.linear);
      // }
      Store.currentRootPageIndex = index;
      currentIndex.value = index;
      pageCtrl.jumpToPage(index);
      eventBus.fire(HomeTabChange(index));
      if (0 == index) {
        BalanceManager.syncAll();
      }
    } catch (_) {
      //滚动出错时，重置
      pageCtrl = PageController(initialPage: index);
    }
  }

  final commonApi = Get.find<CommonApi>();
  void initSupportPhoneCode() {
    runCatch(() async {
      final resps = await commonApi.getCommonDict();
      List<CommonDict> resp = (jsonDecode(resps) as List)
          .map((e) => CommonDict.fromJson(e))
          .toList();
      Store.callingCode = resp
          .map((e) => UiCallingCode(e.code.toString(), e.code.toString(),
              e.code.toString(), e.len ?? []))
          .toList();
    }, onError: (e) async {
    });
  }
  void loadHomeDataAndQuery() async {
    final userController = Get.findOrNull<UserController>();
    await userController?.getMemberMemberInfoAllPostFuture;
    await userController?.getMemberUnReadAmountFuture;
  }

  void memberUnReadAndBonus(int index) {
    final userController = Get.findOrNull<UserController>();
    if ((Get.currentRoute == AppRoutes.HOME && (index == 0 || index == 3))) {
      //首页未读消息红点  在首页 游戏 我的  三秒刷新一次
      userController?.getMemberUnReadAmount();
    }
    showHasUnReceivedBonusCheck();
  }

  void refreshHomeData(int index) {
    final userController = Get.findOrNull<UserController>();

    if (Store.nativeRouting == AppRoutes.GAME) {
      userController?.getMemberMemberInfoAll();
      return;
    }

    //停服维护，优惠页 2 帮助页 3 没有被提出APP到登录页面
    if ((Get.currentRoute.contains(AppRoutes.HOME) &&
            (index == 0 || index == 3)) ||
        Get.currentRoute.contains(AppRoutes.VIP_LEVEL) ||
        Get.currentRoute.contains(AppRoutes.MY_WALLET) ||
        Get.currentRoute.contains(AppRoutes.DEPOSIT) ||
        Get.currentRoute.contains(AppRoutes.TRANSFER) ||
        Get.currentRoute.contains(AppRoutes.DISCOUNT_DETAIL) ||
        Get.currentRoute.contains(AppRoutes.DEPOSIT_COURSE) ||
        Get.currentRoute.contains(AppRoutes.COMMON_COURSE) ||
        Get.currentRoute.contains(AppRoutes.FEEDBACK)) {
      //在首页 我的 钱包 充值 转账 VIP中心 三秒刷新一次余额
      //停服维护后停留静态页面，没有被提出APP到登录页面，增加：活动详情 教程
      userController?.getMemberMemberInfoAll();
      BalanceManager.syncAll();
    }
    if ((Get.currentRoute == AppRoutes.HOME && (index == 0 || index == 3))) {
      userController?.getMemberUnReadAmount(); //首页未读消息红点  在首页 游戏 我的  三秒刷新一次
    }

    showHasUnReceivedBonusCheck();
  }

  final authService = Get.find<AuthService>();

  void showHasUnReceivedBonusCheck() {
    if (!authService.isLogin) return;
    final floatController = Get.findOrNull<FloatController>();
    if (!Store.isUpgradeDialogShow && Get.currentRoute == AppRoutes.HOME) {
      floatController?.getMessageCenterHasUnReceivedBonus(); //首页红利浮窗
    }
  }

  void getDownloadUrl() {
    ConfigGetCodeDownloadUrl.post(
      success: (ApiConfigGetCodeDownloadUrl data) {
        Store2.downloadUrl = data.downUrl;
      },
      fail: (int code, String msg) {},
    );
  }

  @override
  Future<void> onClose() async {
    HomeWidgetAutoRefreshManager.instance.cancelRefreshTimer();
    backTopListener.cancel();
    refreshListener.cancel();
    refreshTimerListener.cancel();
    scrollController.dispose();
    pageCtrl.dispose();
    super.onClose();
  }
}

import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_http/src/gen/api/domainName_apis.dart';

enum HomeWidgetType {
  home_sports, //体育
  home_baccarat, //真人
  home_eSports, //电竞
  home_liveVideo, //直播
  home_lottery, //彩票
  home_qiPai, //棋牌
  home_electronic, //电子
  home_newGame, //最新游戏
  home_ranking, //排行
  home_aggregate, //全家桶
}

final String homeTopTimerRefresh = "homeTopTimerRefresh";
final String memberUnReadAndBonusTimerRefresh =
    "memberUnReadAndBonusTimerRefresh";
final String memberUnReadMessageTimerRefresh =
    "memberUnReadMessageTimerRefresh";

//定时刷新在web端加大刷新间隔，以免消耗web性能，真人的涉及到路纸不能动
final int _homeCommonRefreshTime = kIsWeb ? 30 : 3;
final int _homeBaccaratRefreshTime = kIsWeb ? 30 : 3; // 真人需3秒刷新
final int _homeTopRefreshTime = kIsWeb ? 30 : 3; //  消息红点、红利、余额
final int _memberUnReadAndBonusTime = 3; //  消息红点、红利、 3秒刷新
final int _memberUnReadMessageTime = kIsWeb ? 30 : 3; //  消息数量1
final int _homeHeartBeat = kIsWeb ? 90 : 60; // 心跳十分钟进行一次刷新

class HomeWidgetAutoRefreshManager {
  HomeWidgetAutoRefreshManager._privateConstructor();

  static final HomeWidgetAutoRefreshManager _instance =
      HomeWidgetAutoRefreshManager._privateConstructor();

  static HomeWidgetAutoRefreshManager get instance {
    return _instance;
  }

  Timer? _refreshTimer;
  Timer? _heartBeatTimer;
  Timer? _refreshTimerBaccarat;
  Timer? _refreshTimerTop;
  Timer? _refreshTimerMemberUnReadAndBonus;
  Timer? _refreshTimerMessageUnRead;
  Map<HomeWidgetType, bool> _refreshMap = <HomeWidgetType, bool>{};
  Map<HomeWidgetType, bool> _refreshMapBaccarat = <HomeWidgetType, bool>{};

  void startRefreshTimer() {
    startCommonRefreshTimer();
    startBaccaratRefreshTimer();
    startTopRefreshTimer();
    startHeartBeat();
    startMemberUnReadAndBonusTimer();
  }

  void startHeartBeat() {
    if (_heartBeatTimer != null && _heartBeatTimer!.isActive) {
      return;
    }
    _heartBeatTimer =
        Timer.periodic(Duration(seconds: _homeHeartBeat), (timer) {
      DomainNameApis.heartbeat();
    });
  }

  void startCommonRefreshTimer() {
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      return;
    }
    _refreshTimer =
        Timer.periodic(Duration(seconds: _homeCommonRefreshTime), (timer) {
      if (Store.nativeRouting == AppRoutes.GAME) {
        return;
      }
      if (Get.currentRoute == AppRoutes.HOME &&
          Store.currentRootPageIndex == 0) {
        //web加延迟避免刚进首页请求多渲染多造成卡死
        Future.delayed(Duration(milliseconds: kIsWeb ? 500 : 0), () {
          sendHomeEventBus(Constants.homeTimerRefresh, _refreshMap);
        });
      }
    });
  }

  void startBaccaratRefreshTimer() {
    if (_refreshTimerBaccarat != null && _refreshTimerBaccarat!.isActive) {
      return;
    }
    _refreshTimerBaccarat =
        Timer.periodic(Duration(seconds: _homeBaccaratRefreshTime), (timer) {
      if (Store.nativeRouting == AppRoutes.GAME) {
        return;
      }

      if (Get.currentRoute == AppRoutes.HOME &&
          Store.currentRootPageIndex == 0) {
        //web加延迟避免刚进首页请求多渲染多造成卡死
        Future.delayed(Duration(milliseconds: kIsWeb ? 500 : 0), () {
          sendHomeEventBus(Constants.homeTimerRefresh, _refreshMapBaccarat);
        });
      }
    });
  }

  void startTopRefreshTimer() {
    if (_refreshTimerTop != null && _refreshTimerTop!.isActive) {
      return;
    }
    _refreshTimerTop =
        Timer.periodic(Duration(seconds: _homeTopRefreshTime), (timer) {
      sendHomeEventBus(homeTopTimerRefresh, {});
    });
    if (Get.currentRoute == AppRoutes.HOME && Store.currentRootPageIndex == 0) {
      sendHomeEventBus(homeTopTimerRefresh, {});
    }
  }

  void startMemberUnReadAndBonusTimer() {
    if (_refreshTimerMemberUnReadAndBonus != null &&
        _refreshTimerMemberUnReadAndBonus!.isActive) {
      return;
    }
    _refreshTimerMemberUnReadAndBonus =
        Timer.periodic(Duration(seconds: _memberUnReadAndBonusTime), (timer) {
      sendHomeEventBus(memberUnReadAndBonusTimerRefresh, {});
    });
  }

  void startMessageUnReadTimer() {
    if (_refreshTimerMessageUnRead != null &&
        _refreshTimerMessageUnRead!.isActive) {
      return;
    }
    _refreshTimerMessageUnRead =
        Timer.periodic(Duration(seconds: _memberUnReadMessageTime), (timer) {
      sendHomeEventBus(memberUnReadMessageTimerRefresh, {});
    });
  }

  void cancelRefreshTimer() {
    cancelCommonRefreshTimer();
    cancelBaccaratRefreshTimer();
    cancelTopRefreshTimer();
    cancelHeartBeat();
    cancelMemberUnReadAndBonusTimer();
  }

  void cancelHeartBeat() {
    if (_heartBeatTimer != null && _heartBeatTimer!.isActive) {
      _heartBeatTimer!.cancel();
    }
  }

  cancelMemberUnReadAndBonusTimer() {
    if (_refreshTimerMemberUnReadAndBonus != null &&
        _refreshTimerMemberUnReadAndBonus!.isActive) {
      _refreshTimerMemberUnReadAndBonus!.cancel();
    }
  }

  cancelMessageUnReadTimer() {
    if (_refreshTimerMessageUnRead != null &&
        _refreshTimerMessageUnRead!.isActive) {
      _refreshTimerMessageUnRead!.cancel();
    }
  }

  void cancelCommonRefreshTimer() {
    if (_refreshTimer != null && _refreshTimer!.isActive) {
      _refreshTimer!.cancel();
    }
  }

  void cancelBaccaratRefreshTimer() {
    if (_refreshTimerBaccarat != null && _refreshTimerBaccarat!.isActive) {
      _refreshTimerBaccarat!.cancel();
    }
  }

  void cancelTopRefreshTimer() {
    if (_refreshTimerTop != null && _refreshTimerTop!.isActive) {
      _refreshTimerTop!.cancel();
    }
  }

  void setRefreshFlag(HomeWidgetType type, bool show) {
    _refreshMap[type] = show;
  }

  void setBaccaratRefreshFlag(HomeWidgetType type, bool show) {
    _refreshMapBaccarat[type] = show;
  }

  void sendHomeEventBus(String name, Map refreshMap) {
    eventBus.fire(HomeModuleEvent(name, refreshMap));
  }
}

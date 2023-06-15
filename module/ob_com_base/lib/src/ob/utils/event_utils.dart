import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class HomeModuleEvent {
  String name;
  Map refreshMap;

  HomeModuleEvent(this.name, this.refreshMap);
}

class MessageStartEvent {


  MessageStartEvent();
}

class FloatBonusEvent {
  bool show;

  FloatBonusEvent({this.show = false});
}

class GlobalBackTopEvent {
  String? eventRunTimeType;

  GlobalBackTopEvent({this.eventRunTimeType});
}

class GameChangeEvent {
  String url;
  String gameType;
  String gameCode;
  String title;
  String gameId;
  int type;
  bool testify;

  GameChangeEvent(
      {this.url = '',
      required this.gameType,
      required this.gameCode,
      required this.title,
      required this.gameId,
      this.type = 0,
      this.testify = false});
}

class HomeTabChange {
  int index;

  HomeTabChange(this.index); //首页tab切换下标
}

class HomeScrollStopEvent {
  int status;

  HomeScrollStopEvent(this.status); //1 停止滚动   2开始滚动

}

class GameRightPageChange {
  String type;

  GameRightPageChange(this.type);
}

class GameLeftTabChange {
  String type;

  GameLeftTabChange(this.type);
}

class PromotionChildRefresh {
  PromotionChildRefresh();
}

class ActivityChange {
  int index;

  ActivityChange(this.index);
}

class BackTopEvent {
  bool show;

  BackTopEvent(this.show);
}

class GamePreloadEvent {
  String gameCode; //'' 如果为空更新全部

  GamePreloadEvent(this.gameCode);
}

class DepositRefreshEvent {
  DepositRefreshEvent();
}


class LoginModuleEvent {

  bool needUpdate;

  LoginModuleEvent(this.needUpdate);

}

class CustomerServiceEvent {
  CustomerServiceEvent();
}

class UserToggleEvent {
  UserToggleEvent();
}
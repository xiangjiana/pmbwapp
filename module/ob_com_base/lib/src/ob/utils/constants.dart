//用来放一些全局使用的常量 值
import 'package:flutter/material.dart';
import 'package:ob_com_base/src/base_x.dart';
import 'package:get/get.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver();

class Constants {
  //首页下拉刷新字符串
  static final String homePullRefresh = "homePullRefresh";


  //首页定时器刷新字符串
  static final String homeTimerRefresh = "homeTimerRefresh";

  //游戏登录 预加载 刷新字符串
  static final String gamePreloadRefresh = "gamePreloadRefresh";

  //是否将网络日志写入文件
  static final String writeNetworkLogEnable = "writeNetworkLogEnable";

  static final String writeCrashLogEnable = "writeCrashLogEnable";
  //当前货币
  static final String appCurrency = "appCurrency";

  static final int homeRefreshTime = 3;

  //游戏登录 token认证超时 刷新
  static final int gameRefreshTime = 10;

  //打印请求信息
  static final bool requestInfoPrint = true;

  //打印请求头信息
  static final bool requestHeaderPrint = false;

  //打印请求body
  static final bool requestBodyPrint = true;

  //打印请求返回body
  static final bool responseBodyPrint = true;

  //打印返回头信息
  static final bool responseHeaderPrint = false;

  //打印请求错误信息
  static final bool requestErrorPrint = true;

  //打印返回信息
  static final bool responseInfoPrint = true;

  //是否将请求日志写入文件
  static bool writeNetworkLog = true;
  static String? networkLogDirPath;

  //是否将请求日志写入文件
  static bool writeCrashLog = true;
  static String? crashLogDirPath;

  //红利领取消息弹窗 关闭 false  开启 true
  static bool currentLoginMessageDontPrompt = true;

  //游戏缓存 体育
  static bool gameTyPreloadflag = false;
  static bool gameDjPreloadflag = false;


  //一下是游戏页面数据（后期抽离）
  static List<String> gameList = [
    'collect'.tr,
    'suports'.tr,
    'real_person'.tr,
    'chess_and_cards'.tr,
    'lottery'.tr,
    'e_sports'.tr,
    'e_games'.tr,
    'baccarat'.tr,
    'time_color'.tr,
    'opel'.tr,
    'football'.tr,
    'slot_machine'.tr,
  ];

  // 是否开始银行卡二元验证，认证真实银行卡
  static bool isVerifyRealBankCard = false;

  // 用户无操作在后台超过2小时，进行重启
  static int autoRestartAppDuration = 2;

  Constants.init() {
    Constants.currentLoginMessageDontPrompt = true;
    BaseX.instance.baseCallback?.Constants_init();
  }

  //
  Constants.gamePreloadInit() {
    Constants.gameTyPreloadflag = false;
    Constants.gameDjPreloadflag = false;
  }
}

import 'dart:async';
import 'dart:convert';

import 'package:capital/capital.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:main/main.dart';
import 'package:models/models.dart' hide GameLogin;
import 'package:ob_package/login_game/login_game.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_finance/src/modules/finance/my_wallet/repository/my_wallet_repository.dart';
import 'package:ob_com_finance/src/modules/finance/transfer/repository/transfer_repository.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page_controller.dart';
import 'package:params/params.dart';
import 'package:sp_util/sp_util.dart';
import 'package:sprintf/sprintf.dart';
import '../modules/home_modules/home_main/main_controller.dart';
import 'ob_channel/native_configure.dart';
import 'ob_channel/ob_channel_manager.dart';
import 'package:ob_com_http/src/gen/mod/main/game_queryMerchantList_post_resp_model.dart';
import 'package:ob_com_http/src/gen/mod/main/game_queryMerchantDyNew_post_resp_model.dart' hide Data;

class GameUtils {
  final runWaterHide = true.obs;
  final myWalletRepository = MyWalletRepository();
  final transferRepository = TransferRepository();

  ValueChanged<bool>? _needCallback;
  late StreamSubscription _streamSubscription;
  late String routes;
  String? gameType;
  String? gameCode;
  late String gameId;
  late String url;
  late String title = '';
  bool testify = false; //判断是否登录
  bool isFromHomePage = false;
  bool isScrollEnabled = false;
  final authService = Get.find<AuthService>();
  final capitalApi = Get.find<CapitalApi>();
  var allowsInlineMediaPlayback = true;

  /// 是否可重新获取最新游戏地址
  bool getURLable = false;

  // String kCenterBalance = '0';

  /// 是否自动转额
  get isAutoTransferOpen => authService.isAutoTransferOpen;

  GameUtils();

  Future autoTransfer(Map arguments, String key) async {
    String? type = arguments["type"];
    if (type != null) {
      if (type == "get") {
        OBChannelManager.instance.sendEventToNative(key, {
          "type": "getNative",
          "autoTransfer": isAutoTransferOpen ? "true" : "false"
        });
      } else if (type == "set") {
        runCatch(() async {
          final cancel = NativeUtils.showNativeLoading("");

          await capitalApi.noTransfer(SetTransferInfoParam(
            noTransfer: authService.user.isAutoTransferOpen ? 0 : 1,
          ));
          cancel();
          String toastStr = authService.user.isAutoTransferOpen
              ? 'my_wallet_automatic_carry_in_amount_is_turned_off'.tr
              : 'my_wallet_automatic_transfer_amount_is_turned_on'.tr;
          NativeUtils.showNativeToast(toastStr);
          authService
              .syncUserAutoUpdateSetting(!authService.user.isAutoTransferOpen);
          OBChannelManager.instance.sendEventToNative(key, {
            "type": "getNative",
            "autoTransfer": isAutoTransferOpen ? "true" : "false"
          });
        }, handleError: (e) {
          NativeUtils.showNativeToast("${e.toString()}");
        });
      }
    }
  }

  void onInit(Map<dynamic, dynamic> arguments, {bool withoutListen = false}) {
    runCatch(() async {
      getURLable = Store.getURLable;
      Get.find<MainController>().updateVenue(arguments["gameType"], arguments["gameCode"]);
      initParams(
        arguments["gameType"],
        arguments["gameCode"],
        arguments["gameId"],
        arguments["url"],
        arguments["title"],
        arguments["testify"],
      );
      if (url.isEmpty) {
        initLoginGame();
      }
      eventBus.fire(FloatBonusEvent(show: false));
      if (withoutListen == false) {
        eventBusListen();
      }

      if (authService.isTryPlay == false) {
        await BalanceManager.syncAll();
        final wallet =
        BalanceManager.walletItems.where((e) => e.id == gameCode).toList();
        if (wallet.isNotEmpty) {
          runWaterHide.value = !wallet.first.vipActivityGoing;
        } else {
          runWaterHide.value = true;
        }
        NativeUtils.sendEventIsHideWater(runWaterHide.value);
      }
    }, onError: (_) {});
  }

  void recycleAll(Map arguments) {
    String? type = arguments["type"];

    if (type != null) {
      if (type == "action") {
        if (CoolDownManager.handler(
            key: 'kCoolDownEventIdentifierRecycleAll', duration: 1000)) {
          recyclerBalance();
        } else {
          OBChannelManager.instance
              .sendEventToNative(NativeEvent.eventIdentifierRecycleAll, {
            "type": "getNative",
            "error": '${"recycle_too_many_times".tr}',
          });
        }
      }
    }
  }

  Future dialogTransferAction(Map arguments) async {
    // 防止转账多笔
    if (CoolDownManager.handler(
        key: 'kCoolDownEventDialogTransferAction', duration: 1000)) {
      String? type = arguments["type"];
      if (type != null) {
        if (type == "action") {
          String gameCode = arguments["accountId"];
          double amount = double.tryParse(arguments["amount"]) ?? 0.0;
          String url = arguments["url"];
          int type = int.tryParse(arguments["typeNum"]) ?? 0;
          String gameName = arguments["gameName"];
          String gameId = arguments["gameId"];
          bool testify = arguments["testify"] == "true";

          bool done = await balanceToTransfer(
              gameCode, amount, url, type, gameName, gameId, testify);
          if (done) {
            NativeUtils.sendEventToNative(NativeEvent.eventDialogTransferAction,
                {"type": "getNative", "status": "true"});
          }
        }
      }
    }
  }

  Future getWallerList(Map arguments, String key) async {
    String? type = arguments["type"];
    if (type != null && type == "get") {
      String? reload = arguments["reload"];
      String? action = arguments["action"];

      runCatch(() async {
        if (reload != null) {
          NativeUtils.showNativeToast("balance_refresh_successfully".tr);
        }
        OBChannelManager.instance.sendEventToNative(key, {
          "type": "getNative",
          if (action != null) "action": action,
          if (reload != null) "reload": "reload",
          "centerWalletBalance": BalanceManager.centerBalance.value,
          "walletList": BalanceManager.walletItems
              .map((element) => element.toMap())
              .toList()
        });
      }, handleError: (e) {
        if (reload != null) {
          NativeUtils.showNativeToast(e);
        }
      });
    }
  }

  Future getWaterInfo(Map arguments, String key) async {
    String? gameCode = arguments["gameCode"];
    if (gameCode != null && gameCode.length > 0) {
      String? depositFlow = arguments["depositFlow"];
      if (depositFlow != null) {
        showDepositFlow(gameCode);
      } else {
        var model = await myWalletRepository.getFlowDetail(gameCode);
        var activityName = model.activityName;
        var billAmount = model.billAmount;
        var completeBillAmount = model.completeBillAmount;
        OBChannelManager.instance.sendEventToNative(key, {
          "type": "getNative",
          "gameCode": gameCode,
          "activityName": activityName,
          "billAmount": billAmount.toString(),
          "completeBillAmount": completeBillAmount.toString(),
          "percentage":
          numberFormat(model.completeBillAmount / model.billAmount * 100),
        });
      }
    }
  }

  void transferAction(Map arguments) {
    String? type = arguments["type"];
    if (type != null) {
      if (type == "action") {
        String? accountId = arguments["accountId"];
        String? transferInAmount = arguments["transferInAmount"];
        String? gameCode = arguments["gameCode"];
        if (accountId == null || transferInAmount == null || gameCode == null) {
          OBChannelManager.instance
              .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
            "type": "getNative",
            "error": 'transfer_error'.tr,
          });
          return;
        }
        transfer(accountId, transferInAmount, gameCode);
      } else if (type == "askCallBack") {
        if (_needCallback != null) {
          String? confirmed = arguments["confirmed"];
          if (confirmed != null && confirmed == "true") {
            _needCallback?.call(true);
          } else {
            _needCallback?.call(false);
          }

          _needCallback = null;
        }
      }
    }
  }

  static Future<bool> balanceToTransfer(String gameCode, double amount,
      String url, int type, String gameName, String gameId, bool testify) {
    final completer = Completer<bool>();
    var cancel = NativeUtils.showNativeLoading("transferring".tr);
    GameApis.gameBalancetransferPost(
      parameters: {
        "gameCode": gameCode,
        "transferType": 0,
        "amount": amount,
      },
      success: (GameBalancetransferPostRespModel resp) {
        cancel();
        NativeUtils.showNativeToast("successful_transfer".tr);
        completer.complete(true);
      },
      fail: (int code, String message) {
        cancel();
        NativeUtils.showNativeToast(message);
        completer.complete(false);
      },
    );
    return completer.future;
  }

  void initParams(
      String? kGameType,
      String? kGameCode,
      String? kGameId,
      String? kGameUrl,
      String? kGameTitle,
      bool? kGameTestify,
      ) {
    gameType = kGameType.isNullOrEmpty ? '' : kGameType!;
    gameCode = kGameCode.isNullOrEmpty ? '' : kGameCode!;
    gameId = kGameId.isNullOrEmpty ? '' : kGameId!;
    url = kGameUrl.isNullOrEmpty ? '' : kGameUrl!;
    title = kGameTitle.isNullOrEmpty ? '' : kGameTitle!;
    testify = kGameTestify ?? false;
    isScrollEnabled = kGameCode == "zr" ? false : true;
  }

  void eventBusListen() {
    _streamSubscription = eventBus.on<GameChangeEvent>().listen((event) {
      if (event.url.isEmpty) {
        return;
      }
      initParams(
        event.gameType,
        event.gameCode,
        event.gameId,
        event.url,
        event.title,
        event.testify,
      );
      testify = event.testify;

      _loadURL(url);
    });
  }


  void _loadURL(String url) async {
    Get.find<MainController>().updateVenue(gameType,gameCode);
    if (kIsWeb) {
      WebIframePageController? webIframePageController =
      Get.findOrNull<WebIframePageController>();
      if (webIframePageController != null &&
          webIframePageController.iFrameElement != null) {
        webIframePageController.iFrameElement!.src = url;
      }
      return;
    }
    NativeUtils.sendEventToNative(NativeEvent.webViewPageEvent_seturl, {
      "title": title,
      "url": url,
      "gameId": gameId,
      "gameCode": gameCode,
      "gameType": gameType,
      "isScrollEnabled": isScrollEnabled,
    });
  }

  /// reload WebView
  /// 中线钱包的金额一旦发生变动，并且开启了自动转额时，刷新时会重新获取最新地址。
  /// 如果手动在此页面操作开启自动转额或者手动转额，也会重新获取最新地址。
  /// 除此之外，都只是进行webView reload操作
  /// 原因是后台的机制问题，游戏的金额变动需要重新获取最新链接才能看到最新的金额。只是刷新是无法看到金额变化的
  Future<void> refresh() async {
    //网络检查
    ConnectivityResult isConnected = await Connectivity().checkConnectivity();
    if (isConnected == ConnectivityResult.none) {
      NativeUtils.showNativeToast("please_check_your_network".tr);
      return;
    }
    // final balance = await getCurrentBalance();
    // 如果在本页面操作临时转额、临时开启自动转额， getURLable = true
    GameLoginUtils.loginH5GamePlatform(
      gameCode!,
      gameId,
      gameType!,
      title: title,
      testify: testify,
      allowWaterToast: false,
    );
    getURLable = false;
    // 如果是后台等其他非app内的金额操作，中心钱包金额变动了，并且打开了自动转额，则重新获取链接，以更新游戏内的金额
    // else if (double.parse(balance) > 0 && isAutoTransferOpen) {
    //   GameLogin.loginH5GamePlatform(
    //     gameCode,
    //     gameId,
    //     title: title,
    //     testify: testify,
    //     allowWaterToast: false,
    //   );
    // } else {
    //   NativeUtils.sendEventToNative("webViewPageEvent_reload", {});
    // }
  }

  /// 获取最新中心钱包余额
  Future<String> getCurrentBalance() async {
    await BalanceManager.syncAll();
    return BalanceManager.centerBalance.value;
  }

  //登录第三方游戏平台  目前真人、体育、电竞登录需要区分接口
  void initLoginGame() {
    GameLoginUtils.loginH5GamePlatform(
      gameCode!,
      gameId,
      gameType!,
      title: title,
      testify: testify,
    );
  }

  //流水dialog
  void showDepositFlow(String gameCode) {
    final cancel = NativeUtils.showNativeLoading("");
    runCatch(() async {
      final model = await myWalletRepository.getFlowDetail(gameCode);
      cancel();

      // 已完成流水 不弹对话框
      if (model.billAmount == 0) {
        NativeUtils.showNativeToast('completed_the_event_for_this_venue'.tr);
        return;
      }

      var activityName = model.activityName;
      var billAmount = model.billAmount;
      var completeBillAmount = model.completeBillAmount;
      OBChannelManager.instance
          .sendEventToNative(NativeEvent.eventGetWaterInfo, {
        "type": "getNative",
        "depositFlow": "depositFlow",
        "gameCode": gameCode,
        "activityName": activityName,
        "billAmount": GetPlatform.isIOS?billAmount.toString():  AppCurrencyUtils.dealBalance(billAmount.toString()) ,
        "completeBillAmount": GetPlatform.isIOS?completeBillAmount.toString(): AppCurrencyUtils.dealBalance(completeBillAmount.toString()),
        "percentage":
        numberFormat(model.completeBillAmount / model.billAmount * 100),
      });
    }, handleError: (e) {
      cancel();
      NativeUtils.showNativeToast(e.toString());
    });
  }

  void transfer(String accountId, String transferInAmount, String gameCode) {
    /// 交易类型：0 钱包到场馆 1 场馆到钱包
    final transferType = accountId == '0' ? '0' : '1';
    void transferRequest() {
      runCatch(() async {
        if (CoolDownManager.handler(key: 'kCoolDownTransfer', duration: 1000)) {
          final cancel = NativeUtils.showNativeLoading("");
          await capitalApi.balanceTransfer(BalanceTransferParam(
              amount: transferInAmount,
              gameCode: gameCode,
              transferType: transferType));
          await BalanceManager.syncAll();

          /***发送金额数据到原生***/
          OBChannelManager.instance.sendEventToNative(NativeEvent.eventIdentifierWalletList, {
            "type": "getNative",
            "centerWalletBalance": BalanceManager.centerBalance.value,
            "walletList": BalanceManager.walletItems.map((e) => e.toMap()).toList(),
          });

          cancel();
          NativeUtils.showNativeToast('successful_transfer'.tr);
          /***发送金额数据到原生***/
          Store.getURLable = true;
        } else {
          OBChannelManager.instance
              .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
            "type": "getNative",
            "error": 'frequent_transfers'.tr,
          });
        }
      }, handleError: (e) {
        OBChannelManager.instance
            .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
          "type": "getNative",
          "error": '${e.toString()}',
        });
        NativeUtils.showNativeToast('${e.toString()}');
      });
    }

    /// 从中心钱包到场馆
    if (transferType == '0') {
      final merchant = BalanceManager.walletItems // merchantGames
          .firstWhereOrNull((e) => e.id == gameCode);
      if (merchant != null) {
        if (merchant.enabled) {
          if (merchant.vipActivityGoing) {
            final cancel = NativeUtils.showNativeLoading("");
            runCatch(() async {
              final res = await myWalletRepository.getFlowDetail(merchant.id);
              final transferAmount =
              double.parse(transferInAmount.replaceAll(',', ''));
              final flowLimit =
                  (res.billAmount - res.completeBillAmount) + transferAmount;
              cancel();

              OBChannelManager.instance.sendEventToNative(
                  NativeEvent.eventIdentifierTransferAction, {
                "type": "getNative",
                "ask": {
                  "title": "alert".tr,
                  "content": sprintf(
                      'transfer_since_the_activity_of_this_platform_is_in_progress'.tr,
                      [AppCurrencyUtils.dealBalance(flowLimit.toString())])
                },
              });

              _needCallback = (bool confirmed) {
                if (confirmed == true) {
                  transferRequest();
                }
              };
            }, handleError: (e) {
              cancel();
              NativeUtils.showNativeToast('${e.toString()}');
              OBChannelManager.instance.sendEventToNative(
                  NativeEvent.eventIdentifierTransferAction, {
                "type": "getNative",
                "error": '${e.toString()}',
              });
            });
          } else {
            transferRequest();
          }
        } else {
          NativeUtils.showNativeToast('unable_to_transfer'.tr);
          OBChannelManager.instance
              .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
            "type": "getNative",
            "error": 'unable_to_transfer'.tr,
          });
        }
      } else {
        OBChannelManager.instance
            .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
          "type": "getNative",
          "error": 'transfer_error_venue_cannot_be_found'.tr,
        });
      }
    }

    /// 从场馆到中心钱包
    if (transferType == '1') {
      final merchant = BalanceManager.walletItems // merchantGames
          .firstWhereOrNull((e) => e.id == gameCode);
      if (merchant != null) {
        if (merchant.enabled) {
          if (merchant.vipActivityGoing) {
            NativeUtils.showNativeToast(
                'transfer_in_activities_cannot_be_transferred_out'.tr);
            OBChannelManager.instance
                .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
              "type": "getNative",
              "error": 'activities_cannot_be_transferred_out'.tr,
            });
          } else {
            transferRequest();
          }
        } else {
          NativeUtils.showNativeToast(
              'unable_to_transfer_out_during_venue_maintenance'.tr);
          OBChannelManager.instance
              .sendEventToNative(NativeEvent.eventIdentifierTransferAction, {
            "type": "getNative",
            "error": 'unable_to_transfer_out_during_venue_maintenance'.tr,
          });
        }
      }
    }
  }

  void reloadSendBalanceToNative() {}

  void recyclerBalance() async {
    runCatch(() async {
      await capitalApi.withdraw();
      await BalanceManager.syncAll();
      NativeUtils.showNativeToast('my_wallet_one_click_recovery_success'.tr);
      OBChannelManager.instance.sendEventToNative(NativeEvent.eventIdentifierRecycleAll, {
        "type": "getNative",
        "done": "done",
      });
      OBChannelManager.instance.sendEventToNative(NativeEvent.eventIdentifierWalletList, {
        "type": "getNative",
        "centerWalletBalance": BalanceManager.centerBalance.value,
        "walletList": BalanceManager.walletItems.map((e) => e.toMap()).toList(),
      });
    }, handleError: (e) {
      NativeUtils.showNativeToast('${e.toString()}');
      OBChannelManager.instance
          .sendEventToNative(NativeEvent.eventIdentifierRecycleAll, {
        "type": "getNative",
        "error": '${e.toString()}',
      });
    });
  }

  void onClose() {
    try {
      _streamSubscription.cancel();
      eventBus.fire(FloatBonusEvent(show: true));
    } catch (e) {}
  }

  void asynWalletAmount() async {
    final cancel = NativeUtils.showNativeLoading("");
    await BalanceManager.syncAll();
    OBChannelManager.instance.sendEventToNative(NativeEvent.eventIdentifierWalletList, {
      "type": "getNative",
      "centerWalletBalance": BalanceManager.centerBalance.value,
      "walletList": BalanceManager.walletItems.map((e) => e.toMap()).toList(),
    });
    cancel.call();
  }

  static List<VenueTypeCodeAndVenues>? gameTypeList;

  void onGameTypeList(Map arguments) async {
    String? type = arguments["type"];
    if (type != null && type == "get") {
      final List<VenueTypeCodeAndVenues> res =
      await getMainMerchantGameListPost();
      List<VenueTypeCodeAndVenues> venueDataList = [];
      venueDataList.addAll(res);
      gameTypeList = venueDataList;

      syncNativeGameTypeList(venueDataList);
    }
  }

  static void syncNativeGameTypeList(List<VenueTypeCodeAndVenues> venueDataList) {
    Map gameTypeListMap = {"type": "getNative"};
    List<VenueTypeCodeAndVenues> vList = [];
    vList.addAll(venueDataList);
    gameTypeListMap["list"] = vList;

    OBChannelManager.instance.sendEventToNative(
      NativeEvent.eventIdentifierGameTypeList,
      {'data': jsonEncode(gameTypeListMap)},
    );
  }

  final mainApi = Get.find<MainApi>();
  Future<List<VenueTypeCodeAndVenues>> getMainMerchantGameListPost() {
    try {
      return mainApi.venueList();
    } catch (e) {
      return Future.error(e);
    }
  }

  void onDyGameList(Map arguments) async {
    Get.find<MainController>().updateVenue("dy",arguments["gameCode"]);
    String? type = arguments["type"];
    if (type != null && type == "get") {

      String? gameCode = arguments["gameCode"];
      final GameQueryMerchantDyNewPostRespModel res = await getGameQueryMerchantDyNewPost(gameCode ?? "");
      List gameDataList = [];
      gameDataList.addAll(res.data);

      syncNativeDyGameList(gameDataList);
    }
  }

  static void syncNativeDyGameList(List gameDataList) {
    Map gameDyListMap = {"type": "getNative"};
    gameDyListMap["list"] = gameDataList;

    OBChannelManager.instance.sendEventToNative(
      NativeEvent.eventIdentifierDyGameList,
      {'data': jsonEncode(gameDyListMap)},
    );
  }

  Future<GameQueryMerchantDyNewPostRespModel> getGameQueryMerchantDyNewPost(String venueCode) {
    final completer = Completer<GameQueryMerchantDyNewPostRespModel>();
    GameApis.gameQueryMerchantDyNewPost(
      parameters: {"venueCode": venueCode},
      success: (GameQueryMerchantDyNewPostRespModel resp) {
        completer.complete(resp);
      },
      fail: (int code, String message) {
        completer.completeError(message);
      },
    );
    return completer.future;
  }

  void webViewPageEventSetUrlGameLogin(Map arguments) {
    String? type = arguments["type"];
    if (type != null && type == "get") {
      onInit(arguments, withoutListen: true);
    }
  }

  /// 跳转游戏客服页面
  void toCustomerPage(Map arguments) {
    String? type = arguments["type"];
    if (type != null && type == "get") {
      final cancel = NativeUtils.showNativeLoading("");
      runCatch(() async {
        Store.memberCustomerUrl = await PublicResources.getCustomerServiceLink(0);
        cancel.call();
        if (Store.memberCustomerUrl.trim().isEmpty) {
          NativeUtils.sendEventToNative(NativeEvent.customerServiceUrl, {
            "type": "getNative",
            "url": Store.memberCustomerUrl,
          });
        } else {
          if (Store.memberCustomerUrl.replaceAll(' ', '') != '') {
            Store.memberCustomerUrl = Store.memberCustomerUrl.replaceAll(' ', '');
            Store.memberCustomerUrl = Store.memberCustomerUrl.contains('http')
                ? Store.memberCustomerUrl
                : 'https://' + Store.memberCustomerUrl;
          }
          NativeUtils.sendEventToNative(NativeEvent.customerServiceUrl, {
            "type": "getNative",
            "url": Store.memberCustomerUrl,
          });
        }

      }, onError: (_) {
        cancel.call();
        NativeUtils.sendEventToNative(NativeEvent.customerServiceUrl, {
          "type": "getNative",
          "url": Store.memberCustomerUrl,
        });
      });
    }
  }
}

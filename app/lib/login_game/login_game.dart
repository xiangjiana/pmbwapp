import 'dart:async';
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart' hide Navigator;
import 'package:ob_com_finance/src/modules/finance/my_wallet/balance_manager.dart';
import 'package:ob_com_http/ob_com_http.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_package/modules/web_iframe/web_iframe_page_controller.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:ob_package/utils/web_util2.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:repository/utils/device_type.dart';
import 'package:repository/utils/net.dart';
import 'package:sp_util/sp_util.dart';

String appNativeGoBackProtocol = "http://finishtoback"; //app native用的backurl

class GameLoginUtils {

  //内部加载URL连接  跳转H5页面后加载
  static openH5GamPage(
    String gameCode,
    String gameType,
    String? gameId, {
    String title = "",
    bool testify = false,
  }) {
    if (gameCode.isEmpty) {
      showToast("game_is_unavaliable_templariay".tr);
      return;
    }
    // 重复登录间隔限制
    if (CoolDownManager.handler(key: 'kCoolDownLoginH5GamePlatform', duration: 500)) {
      bool isFromHomePage = false;
      if (Get.currentRoute == AppRoutes.HOME) {
        final homePageController = Get.findOrNull<HomePageController>();
        if (homePageController != null && Store.currentRootPageIndex == 0) {
          isFromHomePage = true;
        }
      }
      if (GetPlatform.isWeb) {
        GameLoginUtils.loginH5GamePlatform(
          gameCode,
          gameId,
          gameType,
          title: title,
          testify: testify,
        );
      } else {
        Store.nativeRouting = AppRoutes.GAME;
        NativeUtils.sendEventToNative(NativeEvent.openNativeGamePageEvent, {
          "routes": AppRoutes.GAME,
          "title": title,
          "url": "",
          "gameCode": gameCode,
          "symbol": AppCurrencyUtils.getAppCurrencySymbol(),
          "gameType": gameType,
          "gameId": gameId,
          "testify": testify,
          "isFromHomePage": isFromHomePage,
        });
      }
    }
  }

  static openWeb(String gameCode, String url, String gameName, String gameId, {bool testify = false}) {
    switch (gameCode) {
      case "cp": //彩票
      case "dj": //电竞
      case "dy": //捕鱼
      case "qp": //棋牌
      case "ty": //体育
      case "zr": //真人
      case "lhj": //老虎机
      case "by": //捕鱼
        Navigator.pop(Get.context!);
        WebUtil2.openGameInApp(
          "$url",
          title: gameName,
          gameCode: gameCode,
          gameId: gameId,
          testify: testify,
          gameType: 'by',
        );
    }
  }

  static loginH5GamePlatform(
    String gameCode,
    String? gameId,
    String gameType, {
    String title = "",
    bool testify = false,
    bool weakhint = true,
    bool allowWaterToast = true,
  }) {
    //登录游戏需要请求一次 获取活动状态 不能直接跳转到游戏页面
    try {
      if (gameCode == "ty" && testify) {
        GameLoginUtils.sportsLogin(gameId ?? "",
            testify: testify,
            weakhint: weakhint,
            allowWaterToast: allowWaterToast);
      } else if (gameCode == "dj" && testify) {
        GameLoginUtils.esportsLogin(gameId ?? "",
            testify: testify,
            weakhint: weakhint,
            allowWaterToast: allowWaterToast);
      } else if (gameCode == "zr" && testify) {
        GameLoginUtils.zrLogin(gameId ?? "",
            testify: testify,
            weakhint: weakhint,
            allowWaterToast: allowWaterToast);
      } else {
        GameLoginUtils.loginGamePlatform(gameCode, gameId, title,
            testify: testify,
            weakhint: weakhint,
            allowWaterToast: allowWaterToast,
            gameType: gameType);

      }
    } catch (e) {
      e.toString();
    }
  }

  //外部加载URL连接
  static loginGamePlatform(String gameCode, String? gameId, String gameName,
      {bool testify = false, bool weakhint = true, bool allowWaterToast = true, String gameType = ''}) {
    try {
      var req = {
        "deviceType": InstallDeviceType.deviceType,
        "gameCode": gameCode,
        "lang": 1,
        "gameId": gameId == '0' ? "" : gameId,
      };
      req["backUrl"] = getBackUrl(gameCode,gameType);
      if (kIsWeb) {
        if (!h5GameShouldOpenInNewWindow(gameCode, gameType)||gameType=='dy') {
          Get.toNamed(AppRoutes.WEB_IFRAME, parameters: {"gameCode": gameCode, "gameType": gameType,"gameId":gameId??"",  "gameName": gameName});
          return;
        }
      }
      showLoading();
      if (kIsWeb && h5GameShouldOpenInNewWindow(gameCode, gameType) && Net().isConnect && GetPlatform.isIOS) {
        WebUtil.windowPreOpen();
      }
      GameApis.gameLoginPost(
          parameters: req,
          success: (GameLoginPostRespModel resp) async {
            dismissLoading();
            // 参加首存送活动，并开启自动转账，进入游戏无提示
            if (resp.type == 0 && allowWaterToast) {
              if (GetPlatform.isWeb) {
                if (h5GameShouldOpenInNewWindow(gameCode, gameType) && GetPlatform.isIOS) {
                  WebUtil.windowClose();
                }
                //延迟1秒弹出 以便在游戏页面弹出 ,如果是捕鱼或者电游那么不延迟，因为是需要新标签页打开的
                Future.delayed(Duration(seconds: h5GameShouldOpenInNewWindow(gameCode, gameType) ? 0 : 1), () {
                  showTransferWebDialog(resp.url, resp.type, gameCode, gameName, gameId,
                      testify: testify, gameType: gameType);
                });
              } else {
                showTransferDialog(
                  resp.url,
                  resp.type,
                  gameCode,
                  gameName,
                  gameId,
                  testify: testify,
                );
              }
            }
            //如果是web且是电游或者ob捕鱼那么先弹窗，再打开新标签页面
            if (!kIsWeb || (kIsWeb && !h5GameShouldOpenInNewWindow(gameCode, gameType))) {
              WebUtil.openGameInApp("${resp.url}",
                  title: gameName, gameCode: gameCode, gameId: gameId ?? "", gameType: gameType, testify: testify);
            } else if (resp.type != 0 || !allowWaterToast) {
              WebUtil.openInBrowser(resp.url);
            }
          },
          fail: (int code, String message) {
            if (kIsWeb && h5GameShouldOpenInNewWindow(gameCode, gameType)) {
              WebUtil.windowClose();
            }
            dismissLoading();
            _onWarningMessage(code, message, weakhint);
          });
    } catch (e) {
      e.toString();
    }
  }

  //电竞登录
  static esportsLogin(String matchId, {bool testify = true, bool weakhint = true, bool allowWaterToast = true}) {
    String gameCode = 'dj';
    String gameName = 'ob_gaming'.tr;
    try {
      var req = {"matchId": matchId, "backUrl": getBackUrl(gameCode,"dj")};
      GameApis.gameDjEnterGamePost(
          parameters: req,
          success: (GameDjEnterGamePostRespModel resp) async {
            // 参加首存送活动，并开启自动转账，进入游戏无提示
            if (resp.type == 0 && allowWaterToast) {
              if (GetPlatform.isWeb) {
                await showTransferWebDialog(resp.url, resp.type, gameCode, gameName, matchId, testify: testify);
              } else {
                showTransferDialog(resp.url, resp.type, gameCode, gameName, matchId, testify: testify);
              }
            }
            //流水达标
            WebUtil2.openGameInApp("${resp.url}",
                title: gameName, gameCode: gameCode, gameId: matchId, testify: testify, gameType: 'dj');
          },
          fail: (int code, String message) {
            _onWarningMessage(code, message, weakhint);
          });
    } catch (e) {}
  }

  //体育登陆
  static sportsLogin(String mid, {bool testify = true, bool weakhint = true, bool allowWaterToast = true}) {
    try {
      var req = {
        "mid": mid,
        "mobile": true,
        "backUrl": getBackUrl("ty","ty"),
      };
      // showLoading(msg: "登陆OB体育中...");
      GameApis.gameEnterGamePost(
        parameters: req,
        success: (GameEnterGamePostRespModel resp) async {
          // 参加首存送活动，并开启自动转账，进入游戏无提示
          if (resp.type == 0 && allowWaterToast) {
            if (GetPlatform.isWeb) {
              await showTransferWebDialog(resp.url, resp.type, "ty", "ob_sport".tr, mid);
            } else {
              showTransferDialog(resp.url, resp.type, "ty", "ob_sport".tr, mid);
            }
          }
          //流水达标
          WebUtil2.openGameInApp("${resp.url}", title: "ob_sport".tr, gameCode: "ty", gameId: mid, testify: testify, gameType: "ty");
        },
        fail: (int code, String message) {
          _onWarningMessage(code, message, weakhint);
        },
      );
    } catch (e) {}
  }

  //真人登陆
  static zrLogin(String tableId, {bool testify = true, bool weakhint = true, bool allowWaterToast = true}) {
    try {
      var req = {
        "deviceType": InstallDeviceType.deviceType,
        "lang": 1,
        "tableId": tableId,
        "backUrl": getBackUrl("zr","zr"),
      };
      GameApis.gameForwardGamePost(
          parameters: req,
          success: (GameForwardGamePostRespModel resp) async {
            // 参加首存送活动，并开启自动转账，进入游戏无提示
            if (resp.type == 0 && allowWaterToast) {
              if (GetPlatform.isWeb) {
                await showTransferWebDialog(resp.url, resp.type, "zr", "ob_real".tr, tableId.toString());
              } else {
                showTransferDialog(resp.url, resp.type, "zr", "ob_real".tr, tableId.toString());
              }
            }
            //流水达标
            WebUtil2.openGameInApp("${resp.url}",
                title: "ob_real".tr, gameCode: "zr", gameId: tableId, testify: testify, gameType: "zr");
          },
          fail: (int code, String message) {
            _onWarningMessage(code, message, weakhint);
          });
    } catch (e) {}
  }

  static TextEditingController? moneyInput;
  static FocusNode? focusNode;

  static Future<void> showTransferDialog(
    String url,
    int type,
    String gameCode,
    String title,
    String? gameId, {
    bool testify = false,
  }) async {
    await myWalletRepository.getFlowDetail(gameCode);
    double centerBalance = double.tryParse(BalanceManager.centerBalance.value) ?? 0.0;
    if (centerBalance < 1 || BalanceManager.minActivityAmount > centerBalance) {
      return;
    }

    Future.delayed(Duration(milliseconds: 250), () {
      NativeUtils.sendEventToNative(NativeEvent.showTransferDialogEvent, {
        "type": "getNative",
        "url": url,
        "typeNum": type.toString(),
        "gameCode": gameCode,
        "title": title,
        "gameId": gameId,
        "testify": testify ? "true" : "false",
        "centerAmount": centerBalance.toString()
      });
    });
  }

  static Future<void> showTransferWebDialog(String url, int type, String gameCode, String title, String? gameId,
      {bool testify = false, String gameType = ''}) async {
    showLoading();
    await BalanceManager.syncAll();
    await myWalletRepository.getFlowDetail(gameCode);

    dismissLoading();
    bool curIsVND = SpUtil.getString(Constants.appCurrency, defValue: Store.merchantCurrency) == 'VND';
    double centerBalance = double.tryParse(BalanceManager.centerBalance.value) ?? 0.0;
    if (centerBalance < 1 || BalanceManager.minActivityAmount > centerBalance) {
      return Future.value(false);
    }
    moneyInput = TextEditingController();
    focusNode = FocusNode();
    if (curIsVND) {
      focusNode!.addListener(() {
        if (!focusNode!.hasFocus) {
          moneyInput!.text = '${moneyInput!.text.substring(0, moneyInput!.text.length - 1)}0';
          focusNode!.unfocus();
        }
      });
    }

    return Get.dialog(
      PointerInterceptor(
        child: AlertDialog(
          contentPadding: EdgeInsets.zero,
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          actionsPadding: EdgeInsets.zero,
          buttonPadding: EdgeInsets.zero,
          actions: [
            Container(
              decoration: BoxDecoration(
                color: Color(0xff1D2933),
                borderRadius: BorderRadius.circular(
                  8.w,
                ),
                border: Border.all(color: Color(0xffffffff).withOpacity(.1), width: 1), //边框
              ),
              padding: EdgeInsets.only(
                left: 16.w,
                right: 16.w,
              ),
              width: 330.w,
              height: (Get.locale!.languageCode == 'vi'||Get.locale!.languageCode == 'en') ? 340.w : 298.w,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.only(
                      top: 24.w,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          "transfer_in_amount".tr,
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.white, height: 1),
                        ),
                        /*GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: ObImage.asset(
                            Assets.images.comCloseWhite.path,
                            width: 24.w,
                            height: 24.w,
                          ),
                        ),*/
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                      top: 12.w,
                    ),
                    width: 327.w,
                    child: Text(
                      "you_are_join_activity_can_not_transfer_out".tr,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white.withOpacity(.6),
                      ),
                    ),
                  ),
                  Container(
                    height: 60.w,
                    child: Column(
                      children: [
                        Expanded(child: SizedBox()),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              child: Text(
                                "vip_level_trans_content".tr,
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white.withOpacity(.6),
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 16.w),
                              child: Obx(() => Text(
                                    "${BalanceManager.formatCenterBalance}",
                                    style: TextStyle(
                                      height: 0.9,
                                      fontFamily: FontFamily.gothamMedium,
                                      package: BaseX.pkg2,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xffE1A100),
                                    ),
                                  )),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 22.w,
                  ),
                  Container(
                    child: Row(
                      children: [
                        Baseline(
                          baseline: 16,
                          baselineType: TextBaseline.ideographic,
                          child: Container(
                            child: Text(
                              'symbol'.tr,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                              margin: EdgeInsets.only(
                                left: 8.w,
                              ),
                              child: ObTheme(
                                child: TextField(
                                  focusNode: focusNode,
                                  keyboardType: CustomNumberKeyboard.inputFloatNumberPad,
                                  inputFormatters: [
                                    PrecisionLimitFormatter(2),
                                    curIsVND
                                        ? TextNumberLimitFormatter(double.tryParse(BalanceManager.centerBalance.value)!,
                                            selectionOffsetToLast: true)
                                        : TextNumberLimitFormatter(double.tryParse(BalanceManager.centerBalance.value)!,
                                            selectionOffsetToLast: true),
                                    MaskMoneyTextInputFormatter(),
                                  ],
                                  controller: moneyInput,
                                  cursorColor: Get.theme.colorScheme.primary,
                                  style: TextStyle(
                                    textBaseline: TextBaseline.alphabetic,
                                    fontSize: 24,
                                    fontFamily: FontFamily.gothamMedium,
                                    package: BaseX.pkg2,
                                    fontWeight: FontWeight.w500,
                                  ),
                                  decoration: InputDecoration(
                                    hintText: 'vip_level_trans_hintText'.tr,
                                    hintStyle: TextStyle(
                                      textBaseline: TextBaseline.alphabetic,
                                      color: Get.theme.textSelectionTheme.selectionColor,
                                      fontSize: 14,
                                    ),
                                    contentPadding: EdgeInsets.all(0),
                                    border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.0), // 边框颜色
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.0), // 边框颜色
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      //选中时外边框颜色
                                      borderSide: BorderSide(
                                        color: Colors.white.withOpacity(0.0),
                                      ),
                                    ),
                                    floatingLabelBehavior: FloatingLabelBehavior.never,
                                  ),
                                  onChanged: (value) {},
                                ),
                              )),
                        ),
                        !AppCurrencyUtils.getAppCurrencySymbolIsVND()
                            ? GestureDetector(
                                onTap: () {
                                  String moneyText = "";
                                  if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
                                    moneyText = numberFormat(double.parse(BalanceManager.centerBalance.value) / 1000);
                                  } else {
                                    moneyText =
                                        double.tryParse(BalanceManager.centerBalance.value)!.fixed(2).toString();
                                  }
                                  moneyInput!.text = moneyText;
                                  moneyInput!.selection = TextSelection.fromPosition(
                                    TextPosition(offset: moneyText.length),
                                  );
                                },
                                child: Container(
                                  height: 40.w,
                                  color: Colors.transparent,
                                  child: Align(
                                    child: Baseline(
                                      baseline: 12,
                                      baselineType: TextBaseline.ideographic,
                                      child: Container(
                                        child: Text(
                                          "vip_level_trans_all".tr,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color(0xffE1A100),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            : Row(
                                children: [
                                  const Text(
                                    "K ",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontFamily: FontFamily.gothamMedium,
                                      package: BaseX.pkg2,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      String moneyText = "";
                                      if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
                                        moneyText =
                                            numberFormat(double.parse(BalanceManager.centerBalance.value) / 1000);
                                      } else {
                                        moneyText =
                                            double.tryParse(BalanceManager.centerBalance.value)!.fixed(2).toString();
                                      }
                                      moneyInput!.text = moneyText;
                                      moneyInput!.selection = TextSelection.fromPosition(
                                        TextPosition(offset: moneyText.length),
                                      );
                                    },
                                    child: Container(
                                      height: 40.w,
                                      color: Colors.transparent,
                                      child: Align(
                                        child: Baseline(
                                          baseline: 12,
                                          baselineType: TextBaseline.ideographic,
                                          child: Container(
                                            child: Text(
                                              "vip_level_trans_all".tr,
                                              style: TextStyle(
                                                fontSize: 12,
                                                color: Color(0xffE1A100),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                      ],
                    ),
                  ),
                  Container(
                    height: 1.w,
                    width: 1.sw,
                    color: Colors.white.withOpacity(0.06),
                  ),
                  Expanded(child: SizedBox()),
                  Container(
                    margin: EdgeInsets.only(bottom: 16.w),
                    // padding: EdgeInsets.only(top: 24.w),
                    child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                          eventBus.fire(GameChangeEvent(
                              title: title,
                              type: type,
                              url: url,
                              gameCode: gameCode,
                              gameId: gameId ?? "",
                              testify: testify,
                              gameType: gameType,
                          ));
                          if (h5GameShouldOpenInNewWindow(gameCode, gameType)) {
                            WebUtil.openInBrowser(url);
                          }
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: 135.w,
                          height: 32.w,
                          child: Center(
                            child: Text(
                              "go_in_game".tr,
                              style: TextStyle(
                                fontSize: Get.locale!.languageCode == 'vi' ? 14 : 16,
                                height: 1,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            image: DecorationImage(
                              image:
                              AssetImage(Assets.images.btnbg3.path, package: BaseX.pkg),
                              fit: BoxFit.fill,
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(
                                2.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                      Expanded(child: SizedBox()),
                      GestureDetector(
                        onTap: () {
                          if (moneyInput!.text.isEmpty) {
                            showToast("enter_amount".tr);
                            return;
                          }
                          String moneyText = moneyInput!.text;
                          double moneyAmount = double.tryParse(moneyText.replaceAll(',', '')) ?? 0.0;
                          if (AppCurrencyUtils.getAppCurrencySymbolIsVND()) {
                            moneyAmount = moneyAmount * 1000;
                          }
                          if (moneyAmount <= 0.0) {
                            showToast("transfer_in_amount_can_not_be_zero".tr);
                            return;
                          }
                          balanceTransfer(gameType, gameCode, moneyAmount, url, type, title, gameId ?? "", testify);
                          if (h5GameShouldOpenInNewWindow(gameCode, gameType)) {
                            WebUtil.openInBrowser(url);
                          }
                        },
                        behavior: HitTestBehavior.translucent,
                        child: Container(
                          width: 135.w,
                          height: 32.w,
                          child: Center(
                            child: Text(
                              "confirm".tr,
                              style: TextStyle(
                                  fontSize: Get.locale!.languageCode == 'vi' ? 14 : 16, height: 1, color: Colors.white),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  2.w,
                                ),
                              ),
                            image: DecorationImage(
                              image:
                              AssetImage(Assets.images.btnbg2.path, package: BaseX.pkg),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      barrierDismissible: false,
    );
  }

  static balanceTransfer(
    String gameType,
    String gameCode,
    double amount,
    String url,
    int type,
    String gameName,
    String gameId,
    bool testify,
  ) {
    showLoading(msg: "transferring".tr);
    GameApis.gameBalancetransferPost(
        parameters: {
          "gameCode": gameCode,
          "transferType": 0,
          "amount": amount,
        },
        success: (GameBalancetransferPostRespModel resp) {
          dismissLoading();
          showToast("successful_transfer".tr);

          Future.delayed(Duration(seconds: 1), () {
            Get.back(result: true);
            eventBus.fire(GameChangeEvent(
              title: gameName,
              type: type,
              url: url,
              gameCode: gameCode,
              gameId: gameId,
              testify: testify,
              gameType: gameType,
            ));
          });
        },
        fail: (int code, String message) {
          dismissLoading();
          showToast(message);
        });
  }

  static Future<bool> balanceToTransfer(
    String gameType,
    String gameCode,
    double amount,
    String url,
    int type,
    String gameName,
    String gameId,
    bool testify,
  ) {
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

        eventBus.fire(GameChangeEvent(
          title: gameName,
          type: type,
          url: url,
          gameCode: gameCode,
          gameId: gameId,
          testify: testify,
          gameType: gameType,
        ));
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

  ///默认 weakhint true 显示弹窗， weakhint false Toast 提示
  static _onWarningMessage(int code, String message, bool weakhint) {
    var confirmText = "confirm".tr;
    if (code == 403) {
      confirmText = "back".tr;
    }
    Future.delayed(Duration(milliseconds: 250), () {
      if (GetPlatform.isWeb) {
        OBDialogUtil.show(
          ObDialog.alert(
            title: 'alert'.tr,
            content: message,
            confirmText: confirmText,
            onConfirmListener: () {
              Get.back();
            },
          ),
        );
        return;
      }
      NativeUtils.sendEventToNative(NativeEvent.openNativeLoginGameErrorEvent,
          {"title": 'alert'.tr, "message": message, "confirmText": confirmText});
    });
  }
}

//AG场馆的游戏  在login的时候ag的backUrl只能传域名不能加/close.html，区别于其他游戏
String getBackUrl(String gameCode,String gameType){
  if(!kIsWeb){
    return appNativeGoBackProtocol;
  }
  if(gameCode.toLowerCase().startsWith("ag")){
    return WebUtil.getWebSiteOrigin();
  }
  return WebUtil.getWebSiteOrigin() + "/close.html";
}
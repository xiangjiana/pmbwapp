
import 'package:get/get.dart';
import 'package:ob_package/modules/home/home_controller.dart';
import 'package:ob_package/utils/ob_channel/native_configure.dart';
import 'package:ob_com_base/ob_com_base.dart';

import 'GameUtils.dart';

class WebUtil2 {
  //打开游戏H5页面
  static void openGameInApp(String url, {
    String title = "",
    required String gameCode,
    required String gameType,
    required String gameId,
    bool testify = false,
  }) {
    try {
      if (url == 'null' || url.trim() == '') {
        if (GetPlatform.isWeb) {
          showToast("failed_to_get_venue_link".tr);
        }else {
          NativeUtils.showNativeToast("failed_to_get_venue_link".tr);
        }
        return;
      }

      if (Store.nativeRouting == AppRoutes.GAME) {
        eventBus.fire(GameChangeEvent(
            title: title,
            url: url,
            gameCode: gameCode,
            gameId: gameId,  
            testify: testify,
            gameType: gameType,));
      } else {
        bool isFromHomePage = false;
        if (Get.currentRoute == AppRoutes.HOME) {
          HomePageController? homePageController = Get.findOrNull<
              HomePageController>();
          if (homePageController != null && Store.currentRootPageIndex == 0) {
            isFromHomePage = true;
          }
        }
        if (GetPlatform.isWeb) {
          //判断如果是电游或者ob捕鱼，那么用新标签页的方式打开，避免iframe内存溢出页面重载
          if(gameCode=='by'||gameType=='dy'){
            WebUtil.openInBrowser(url);
          }else{ 
            Get.toNamed(
              AppRoutes.WEB_IFRAME,
              parameters: {"url": url,"gameType":gameType,"gameCode":gameCode,"gameId":gameId,"testify":testify.toString(),"title":title},
            );
          }
          return;
        }
        NativeUtils.sendEventToNative(NativeEvent.openNativeGamePageEvent, {
          "title": title,
          "url": url,
          "gameType":gameType,
          "gameCode": gameCode,
          "gameId": gameId,
          "symbol": AppCurrencyUtils.getAppCurrencySymbol(),
          "testify": testify,
          "isFromHomePage": isFromHomePage,
        });
      }
    } catch (e) {}
  }

}

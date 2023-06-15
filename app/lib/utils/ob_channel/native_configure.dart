import 'package:get/get.dart';
import 'package:ob_package/utils/ob_channel/ob_channel_manager.dart';
import 'package:ob_com_base/ob_com_base.dart';

typedef CancelBoostFunc = void Function();

class NativeEvent {

  static const String webViewPageEvent_updateTitle =
      "webviewpageevent_updatetitle";
  static const String webViewPageEvent_seturl = "webViewPageEvent_seturl";
  static const String show_native_toast = "show_native_toast";
  static const String is_show_run_water = "is_show_run_water";
  static const String show_native_loading = "show_native_loading";
  static const String dismiss_native_loading = "dismiss_native_loading";
  static const String finish_native_webview = "finish_native_webview";
  static const String showTransferDialogEvent = "showTransferDialogEvent";
  static const String exit_app = "exit_app";
  static const String backUntilNativeEvent = "backUntilNativeEvent";

  static const String openNativeGamePageEvent = "openNativeGamePageEvent";
  static const String openNativeWebPageEvent = "openNativeWebPageEvent";
  static const String openNativeLoginGameErrorEvent = "openNativeLoginGameErrorEvent";

  static const String eventIdentifierAutoTransfer = "OBEventIdentifier_autoTransfer";
  static const String eventIdentifierWalletList = "OBEventIdentifier_walletList";
  static const String eventIdentifierTransferAction = "OBEventIdentifier_transferAction";
  static const String eventIdentifierRecycleAll = "OBEventIdentifier_recycleAll";
  static const String eventGetWaterInfo = "eventGetWaterInfo";
  static const String eventDialogTransferAction = "eventDialogTransferAction";
  static const String systeminfo = "systemInfo";
  static const String applyNavigationBarColor = "applyNavigationBarColor";
  static const String eventSyncWalletAmount = "eventsyncwalletamount"; //同步中心钱包和游戏钱包

  static const String gameWebLoadUrlError = "gameWebLoadUrlError";

  // 游戏场馆类型列表
  static const String eventIdentifierGameTypeList = "eventIdentifierGameTypeList";
  // 同步设置原生语言
  static const String syncNativeLanguages = "syncNativeLanguages";

  static const  String customerServiceUrl = "customerServiceUrl";//获取客服

// 按场馆-电子游戏列表
  static const String eventIdentifierDyGameList = "eventIdentifierDyGameList";

}

class NativeUtils {
  ///当id<0 color=#151E25，当id>0 color=#1D2933，当id=0 color=透明
  static applyNavigationBarColor(int id) {
    if (!GetPlatform.isAndroid) {
      return;
    }
    OBChannelManager.instance.sendEventToNative(
      NativeEvent.applyNavigationBarColor,
      {"id": id},
    );
  }

  //toast 原生
  static showNativeToast(String message) {
    if (Store.nativeRouting.isNotEmpty) {
      OBChannelManager.instance.sendEventToNative(
          NativeEvent.show_native_toast, {"message": message});
    } else {
      showToast(message);
    }
  }

  static CancelBoostFunc showNativeLoading(String message) {
    if (Store.nativeRouting.isNotEmpty) {
      OBChannelManager.instance.sendEventToNative(
          NativeEvent.show_native_loading, {"message": message});
      return () {
        dismissNativeLoading();
      };
    } else {
      return showGaLoading();
    }
  }

  static dismissNativeLoading() {
    OBChannelManager.instance
        .sendEventToNative(NativeEvent.dismiss_native_loading, {});
  }

  // 发消息 隐藏显示 流水图标
  static sendEventIsHideWater(bool isHide) {
    OBChannelManager.instance
        .sendEventToNative(NativeEvent.is_show_run_water, {"isHide": isHide});
  }

  // 发消息 隐藏显示 流水图标
  static sendEventFinishNativeWeb() {
    OBChannelManager.instance
        .sendEventToNative(NativeEvent.finish_native_webview, {});
  }

  static DateTime? lastClickTime;

  static exitApp() {
    if (lastClickTime == null ||
        (DateTime.now().difference(lastClickTime!) > Duration(seconds: 4))) {
      lastClickTime = DateTime.now();
      showToast('operate_again_to_exit_the_app'.tr);
      return;
    }

    OBChannelManager.instance.sendEventToNative(NativeEvent.exit_app, {});
  }

  static backUntilNativeEvent() {
    OBChannelManager.instance
        .sendEventToNative(NativeEvent.backUntilNativeEvent, {});
  }

  static sendEventToNative(String key, Map args) {
    OBChannelManager.instance.sendEventToNative(key, args);
  }
}

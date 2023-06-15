package com.example.ob_app;

public interface NativeEvent {
    static String webViewPageEvent_updateTitle = "webviewpageevent_updatetitle";
    static String webViewPageEvent_seturl = "webViewPageEvent_seturl";
    static String show_native_toast = "show_native_toast";
    static String is_show_run_water = "is_show_run_water";
    static String finish_native_webview = "finish_native_webview";
    static String showTransferDialogEvent = "showTransferDialogEvent";
    static String exit_app = "exit_app";
    static String backUntilNativeEvent = "backUntilNativeEvent";

    static String openNativeGamePageEvent = "openNativeGamePageEvent";
    static String openNativeLoginGameErrorEvent = "openNativeLoginGameErrorEvent";
    static String webViewPageEvent_reload = "webViewPageEvent_reload";

    static String eventIdentifierAutoTransfer = "OBEventIdentifier_autoTransfer";
    static String show_native_loading = "show_native_loading";
    static String dismiss_native_loading = "dismiss_native_loading";
    static String eventIdentifierWalletList = "OBEventIdentifier_walletList";
    static String eventIdentifierTransferAction = "OBEventIdentifier_transferAction";
    static String eventGetWaterInfo = "eventGetWaterInfo";
    static String eventIdentifierRecycleAll = "OBEventIdentifier_recycleAll";
    static String eventDialogTransferAction = "eventDialogTransferAction";
    static String eventpublic_webview = "eventpublic_webview";
    static String systeminfo = "systemInfo";
    static String applyNavigationBarColor = "applyNavigationBarColor";
    static String eventSyncWalletAmount = "eventsyncwalletamount";//同步中心钱包和游戏钱包
    static String eventIdentifierGameTypeList = "eventIdentifierGameTypeList";
    static String syncNativeLanguages = "syncNativeLanguages";
    static String customerServiceUrl = "customerServiceUrl";
    static String eventIdentifierDyGameList = "eventIdentifierDyGameList";
}


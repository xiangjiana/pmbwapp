package com.example.ob_app.utils;

import android.content.Intent;
import android.util.Log;

import com.example.ob_app.FinishActivityManager;
import com.example.ob_app.MainActivity;
import com.example.ob_app.NativeEvent;
import com.example.ob_app.activity.ActivityGameWebView;
import com.example.ob_app.activity.ActivityPublicWebView;
import com.example.ob_app.activity.ActivityTransfer;
import com.example.ob_app.bean.ApiGame;
import com.example.ob_app.bean.ApiGame2;
import com.example.ob_app.event.EventAutoCustom;
import com.example.ob_app.event.EventDialogTransfer;
import com.example.ob_app.event.EventDyGameList;
import com.example.ob_app.event.EventGameList;
import com.example.ob_app.event.EventIsShowWater;
import com.example.ob_app.event.EventLoginGameError;
import com.example.ob_app.event.EventNativeNavBarColor;
import com.example.ob_app.event.EventNativeToast;
import com.example.ob_app.event.EventRecycleOneClick;
import com.example.ob_app.event.EventRunWaterInfo;
import com.example.ob_app.event.EventShowTransferDialog;
import com.example.ob_app.event.EventTransferNow;
import com.example.ob_app.event.EventUpdateGameWebView;
import com.example.ob_app.event.EventWalletList;
import com.google.gson.Gson;

import org.greenrobot.eventbus.EventBus;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import io.flutter.plugin.common.BasicMessageChannel;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.StandardMessageCodec;

/**
 *
 */
public class BasicMessageUtil {
    private static BasicMessageChannel<Object> mMessageChannel;
    static String channel = "game.ob.flutter.pigeon.sendEvent";
    public static ApiGame apiGame;
    public static String moneySymbol = "";
    public static String lanCode = "";
    public static String moneySymbolNV = "₫";
    public static String customerServiceUrl = "";

    public static final BasicMessageUtil getInstance() {
        return BasicMessageUtil.SingletonHolder.INSTANCE;
    }


    //定义的静态内部类
    private static class SingletonHolder {
        private static final BasicMessageUtil INSTANCE = new BasicMessageUtil();  //创建实例的地方
    }

    private BasicMessageUtil() {

    }

    private EventUpdateGameWebView getGameWebViewBean(Map<String, Object> arguments) {
        String gameId1 = (String) arguments.get("gameId");
        String routes1 = (String) arguments.get("routes");
        String gameCode1 = (String) arguments.get("gameCode");
        String gameType = "";
        if (arguments.containsKey("gameType")) {
            gameType = (String) arguments.get("gameType");
        }

        if (arguments.containsKey("symbol")) {
            BasicMessageUtil.moneySymbol = (String) arguments.get("symbol");
        }

        String title1 = (String) arguments.get("title");
        String url1 = (String) arguments.get("url");

        Object testify1 = arguments.get("testify");
        Object isFromHomePage1 = arguments.get("isFromHomePage");
        EventUpdateGameWebView update = new EventUpdateGameWebView();
        update.setGameId(gameId1);
        update.setRoutes(routes1);
        update.setGameCode(gameCode1);
        update.setGameType(gameType);
        update.setTitle(title1);
        update.setUrl(url1);

        if (testify1 != null) {
            update.setTestify((Boolean) testify1);
        }
        if (isFromHomePage1 != null) {
            update.setFromHomePage((Boolean) isFromHomePage1);
        }

        return update;
    }

    private EventGameList getEventGameList(Map<String, Object> arguments) {
        String json = (String) arguments.get("data");
        apiGame = new Gson().fromJson(json, ApiGame.class);
        return new EventGameList(apiGame.getData());
    }

    private EventDyGameList getEventDyGameList(Map<String, Object> arguments) {
        String json = (String) arguments.get("data");
        ApiGame2 apiGame2 = new Gson().fromJson(json, ApiGame2.class);
        return new EventDyGameList(apiGame2.getData());
    }

    public void messageChannelFunction(BinaryMessenger binaryMessenger, MainActivity mainActivity) {


        //消息接收监听
        //BasicMessageChannel （主要是传递字符串和一些半结构体的数据）
        mMessageChannel = new BasicMessageChannel<Object>(binaryMessenger, channel, StandardMessageCodec.INSTANCE);
        // 接收消息监听
        mMessageChannel.setMessageHandler(new BasicMessageChannel.MessageHandler<Object>() {
            @Override
            public void onMessage(Object o, BasicMessageChannel.Reply<Object> reply) {
                Map<String, Object> map = (Map<String, Object>) o;
                String key = (String) map.get("key");
                Map<String, Object> arguments = (Map<String, Object>) map.get("arguments");
                Log.d("aaaaaa", key.toString());
                Log.d("aaaaaa", "onMessage: arguments=" + arguments.toString());
                switch (key) {
                    case NativeEvent.systeminfo:
                        sendSystemInfo();
                        break;
                    case NativeEvent.openNativeGamePageEvent:
                        EventUpdateGameWebView gameWebViewBean = getGameWebViewBean(arguments);
                        if (gameWebViewBean.getUrl().isEmpty()) {
                            Intent intent = new Intent(mainActivity, ActivityGameWebView.class);
                            intent.putExtra("data", gameWebViewBean);
                            mainActivity.startActivity(intent);
                        } else {
                            EventBus.getDefault().post(gameWebViewBean);
                        }
                        break;
                    case NativeEvent.eventpublic_webview:
                        Intent intentDeposit = new Intent(mainActivity, ActivityPublicWebView.class);
                        if (arguments != null) {
                            Object title = arguments.get("title");
                            Object url = arguments.get("url");
                            if (null != title) {
                                intentDeposit.putExtra("title", (String) title);
                            }
                            if (null != url) {
                                intentDeposit.putExtra("url", (String) url);
                            }

                            mainActivity.startActivity(intentDeposit);

                        }

                        break;


                    case NativeEvent.webViewPageEvent_seturl:
                        EventBus.getDefault().post(getGameWebViewBean(arguments));
                        break;

                    case NativeEvent.backUntilNativeEvent:
                        BasicMessageUtil.getInstance().gameDesotry();
                        FinishActivityManager.getManager().finishActivity(ActivityTransfer.class);
                        FinishActivityManager.getManager().finishActivity(ActivityGameWebView.class);
                        break;

                    case NativeEvent.webViewPageEvent_reload:
                        //刷新数据
                        EventBus.getDefault().post(NativeEvent.webViewPageEvent_reload);
                        break;

                    case NativeEvent.applyNavigationBarColor:
                        //刷新数据
                        int id = (int) arguments.get("id");
                        EventBus.getDefault().post(new EventNativeNavBarColor(id));
                        break;

                    case NativeEvent.eventIdentifierAutoTransfer:
                        //更新自动带入金额状态
                        EventAutoCustom eventTransfer = new EventAutoCustom();
                        eventTransfer.setArguments(arguments);
                        eventTransfer.setEvent(key);
                        EventBus.getDefault().post(eventTransfer);
                        break;
                    case NativeEvent.show_native_toast:
                        String message = (String) arguments.get("message");
                        EventBus.getDefault().post(new EventNativeToast(message));
                        break;

                    case NativeEvent.openNativeLoginGameErrorEvent:
                        EventLoginGameError eventLoginGameError = new EventLoginGameError();
                        eventLoginGameError.setArguments(arguments);
                        eventLoginGameError.setEvent(key);
                        EventBus.getDefault().post(eventLoginGameError);
                        break;
                    case NativeEvent.dismiss_native_loading:
                    case NativeEvent.show_native_loading:
                        EventBus.getDefault().post(key);
                        break;
                    case NativeEvent.eventIdentifierWalletList:
                        EventWalletList eventWalletList = new EventWalletList();
                        eventWalletList.setArguments(arguments);
                        eventWalletList.setEvent(key);
                        EventBus.getDefault().post(eventWalletList);
                        break;


                    case NativeEvent.eventIdentifierTransferAction:
                        EventTransferNow now = new EventTransferNow();
                        now.setArguments(arguments);
                        now.setEvent(key);
                        EventBus.getDefault().post(now);

                        break;

                    case NativeEvent.eventDialogTransferAction:
                        EventDialogTransfer eventDialogTransfer = new EventDialogTransfer();
                        eventDialogTransfer.setArguments(arguments);
                        eventDialogTransfer.setEvent(key);
                        EventBus.getDefault().post(eventDialogTransfer);

                        break;

                    case NativeEvent.is_show_run_water:
                        EventIsShowWater eventIsShowWater = new EventIsShowWater();
                        eventIsShowWater.setArguments(arguments);
                        eventIsShowWater.setEvent(key);
                        EventBus.getDefault().post(eventIsShowWater);
                        break;

                    case NativeEvent.showTransferDialogEvent:
                        EventShowTransferDialog eventShowTransferDialog = new EventShowTransferDialog();
                        eventShowTransferDialog.setArguments(arguments);
                        eventShowTransferDialog.setEvent(key);
                        EventBus.getDefault().post(eventShowTransferDialog);
                        break;

                    case NativeEvent.eventGetWaterInfo:
                        EventRunWaterInfo eventRunWaterInfo = new EventRunWaterInfo();
                        eventRunWaterInfo.setArguments(arguments);
                        eventRunWaterInfo.setEvent(key);
                        EventBus.getDefault().post(eventRunWaterInfo);
                        break;


                    case NativeEvent.eventIdentifierRecycleAll:
                        EventRecycleOneClick eventRecycleOneClick = new EventRecycleOneClick();
                        eventRecycleOneClick.setArguments(arguments);
                        eventRecycleOneClick.setEvent(key);
                        EventBus.getDefault().post(eventRecycleOneClick);
                        break;

                    case NativeEvent.eventIdentifierGameTypeList:
                        EventBus.getDefault().post(getEventGameList(arguments));
                        break;
                    case NativeEvent.eventIdentifierDyGameList:
                        EventBus.getDefault().post(getEventDyGameList(arguments));
                        break;
                    case NativeEvent.syncNativeLanguages:
                        lanCode = arguments.get("languages").toString().toLowerCase();
                        MultiLanguageUtils.applyLang(mainActivity);
                        Log.d("aaaaaa==", lanCode);
                        break;
                    case NativeEvent.customerServiceUrl:
                        customerServiceUrl = arguments.get("url").toString();
                        break;
                    default:
                        throw new IllegalStateException("Unexpected value: " + key);
                }

            }
        });


    }

    public void sendSystemInfo() {

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.systeminfo);

        String systemName = HarmonyOsUtils.osBandName();
        String version = HarmonyOsUtils.harmonyOsv();
        Map<String, Object> arguments = new HashMap<>();
        if (!systemName.isEmpty()) {
            arguments.put("name", systemName);
            arguments.put("version", version);
        }
        arguments.put("deviceId", DeviceIdUtil.deviceId);
        resultMap.put("arguments", arguments);

        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    public void gameInit(EventUpdateGameWebView data) {
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("routes", data.getRoutes());
        arguments.put("title", data.getTitle());
        arguments.put("url", data.getUrl());
        arguments.put("gameCode", data.getGameCode());
        arguments.put("gameType", data.getGameType());
        arguments.put("gameId", data.getGameId());
        arguments.put("testify", data.isTestify());
        arguments.put("isFromHomePage", data.isFromHomePage());

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", "gameUtilInit");
        resultMap.put("arguments", arguments);
        Log.e("==========gameUtilInit",arguments.toString());
        Log.e("==========",arguments.toString());

        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });


    }

    //游戏页面刷新数据
    public void gameRefresh() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", "onClickReload");
        resultMap.put("arguments", new HashMap<>());
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }


    public void transerNow(String from, String to, String amount) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierTransferAction);
        Map<String, Object> hashMap = new HashMap<>();
        hashMap.put("type", "action");

        hashMap.put("accountId", from);
        hashMap.put("transferInAmount", amount);
        hashMap.put("gameCode", to);
        resultMap.put("arguments", hashMap);

        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    public void confirmActionTransfer() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierTransferAction);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "askCallBack");
        arguments.put("confirmed", "true");
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });

    }

    public void dialogTransfer(String url, String type, String gameCode, String title, String gameId, String testify, String money) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventDialogTransferAction);
        Map<String, Object> hashMap = new HashMap<>();
        hashMap.put("type", "action");
        hashMap.put("accountId", gameCode);
        hashMap.put("amount", money);
        hashMap.put("url", url);
        hashMap.put("typeNum", type);
        hashMap.put("gameName", title);
        hashMap.put("gameId", gameId);
        hashMap.put("testify", testify);

        resultMap.put("arguments", hashMap);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }


    //获取状态
    public void getAutoTransferStatue() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierAutoTransfer);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "get");
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {

            }
        });
    }   //获取状态

    public void asynWalletAmount() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventSyncWalletAmount);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "");
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {

            }
        });
    }

    /*改变自动带入金额状态*/
    public void changeAutoTransferStatue() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierAutoTransfer);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "set");
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    /*获取钱包*/
    public void getWalletList(boolean isRefresh) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierWalletList);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "get");
        if (isRefresh) {
            //点击刷新钱包
            arguments.put("reload", "reload");
        }
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });

    }

    public void getRunWaterDetails(String gameCode, boolean depositFlow) {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventGetWaterInfo);
        HashMap<String, Object> arguments = new HashMap<>();
        if (depositFlow) {
            arguments.put("depositFlow", "depositFlow");
        }
        arguments.put("gameCode", gameCode);
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });

    }

    //一键回收
    public void recycleOnClick() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierRecycleAll);
        HashMap<String, Object> arguments = new HashMap<>();
        arguments.put("type", "action");
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    public void gameDesotry() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", "gameUtilDestory");
        resultMap.put("arguments", new HashMap<>());
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    public void getDyGameList(String gameCode) {
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("type", "get");
        arguments.put("gameCode", gameCode);
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.eventIdentifierDyGameList);
        resultMap.put("arguments", arguments);
        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });
    }

    public void getCustomerServiceUrl() {
        Map<String, Object> arguments = new HashMap<>();
        arguments.put("type", "get");

        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("key", NativeEvent.customerServiceUrl);
        resultMap.put("arguments", arguments);

        mMessageChannel.send(resultMap, new BasicMessageChannel.Reply<Object>() {
            @Override
            public void reply(Object o) {
            }
        });

    }
}

package com.example.ob_app.utils;

import androidx.annotation.Nullable;

import com.example.ob_app.NativeEvent;

import java.util.HashMap;
import java.util.Map;

import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

/**
 *
 */
public class MethodUtil {
    static String channel = "game.ob.flutter.pigeon.sendEvent";
    private static MethodChannel mMethodChannel;
    public static final MethodUtil getInstance() {
        return SingletonHolder.INSTANCE;
    }
    //定义的静态内部类
    private static class SingletonHolder {
        private static final MethodUtil INSTANCE = new MethodUtil();  //创建实例的地方
    }
    private MethodUtil() {
    }

    public void methodChannelFunction(BinaryMessenger binaryMessenger) {


        mMethodChannel = new MethodChannel(binaryMessenger, channel);
        //设置监听
        mMethodChannel.setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        String lMethod = call.method;
                        Object o = call.arguments;

                        Map<String, Object> map = (Map<String, Object>) o;
                        String  key = (String) map.get("key");
                        result.success("返回 给flutter数据");
                        switch (key) {
                            case NativeEvent.openNativeGamePageEvent:
//                                EventOpenGameWebView event = new EventOpenGameWebView();
//                                event.setUrl("https://www.google.com.ph/webhp?tab=rw");
//                                event.setTitle("从flutter过俩");
//                                EventBus.getDefault().post(event);

                                break;
                        }
                    }
                }
        );
    }
    public  void transferNow() {
        Map<String, Object> resultMap = new HashMap<>();
        resultMap.put("message", "android 主动调用 flutter test 方法");
        resultMap.put("code", 200);
        mMethodChannel.invokeMethod("test2", resultMap, new MethodChannel.Result() {
            @Override
            public void success(@Nullable @org.jetbrains.annotations.Nullable Object result) {
            }

            @Override
            public void error(String errorCode, @Nullable @org.jetbrains.annotations.Nullable String errorMessage, @Nullable @org.jetbrains.annotations.Nullable Object errorDetails) {
            }

            @Override
            public void notImplemented() {
            }
        });
    }


}

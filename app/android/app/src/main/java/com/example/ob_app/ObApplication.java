package com.example.ob_app;

import android.app.Application;

import com.example.ob_app.utils.MultiLanguageUtils;
import com.hjq.toast.ToastUtils;
import com.zing.zalo.zalosdk.oauth.ZaloSDKApplication;

public class ObApplication  extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // 初始化 Toast 框架
        ToastUtils.init(this);
        ZaloSDKApplication.wrap(this);
        registerActivityLifecycleCallbacks(MultiLanguageUtils.callbacks);
    }
}

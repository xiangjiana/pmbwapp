package com.example.ob_app.utils;

import android.app.Activity;
import android.app.Application;
import android.content.Context;
import android.content.res.Configuration;
import android.content.res.Resources;
import android.os.Build;
import android.os.Bundle;
import android.os.LocaleList;
import android.text.TextUtils;
import android.util.DisplayMetrics;

import java.util.Locale;

/**
 * 文章https://juejin.cn/post/6844904137226878984
 */
public class MultiLanguageUtils {
    /**
     * 更新应用语言（核心）
     *
     * @param context
     * @param locale
     */
    private static void setAppLanguage(Context context, Locale locale) {
        Resources resources = context.getResources();
        DisplayMetrics metrics = resources.getDisplayMetrics();
        Configuration configuration = resources.getConfiguration();
        //Android 7.0以上的方法
        if (Build.VERSION.SDK_INT >= 24) {
            configuration.setLocale(locale);
            configuration.setLocales(new LocaleList(locale));
            context.createConfigurationContext(configuration);
            //实测，updateConfiguration这个方法虽然很多博主说是版本不适用
            //但是我的生产环境androidX+Android Q环境下，必须加上这一句，才可以通过重启App来切换语言
            resources.updateConfiguration(configuration, metrics);
        } else if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.JELLY_BEAN_MR1) {
            //Android 4.1 以上方法
            configuration.setLocale(locale);
            resources.updateConfiguration(configuration, metrics);
        } else {
            configuration.locale = locale;
            resources.updateConfiguration(configuration, metrics);
        }
    }

    //在Application实现类注册Activity生命周期监听回调，有些版本不加的话多语言切换不回来
    //registerActivityLifecycleCallbacks(callbacks);
    public static Application.ActivityLifecycleCallbacks callbacks = new Application.ActivityLifecycleCallbacks() {
        @Override
        public void onActivityCreated(Activity activity, Bundle savedInstanceState) {
            MultiLanguageUtils.applyLang(activity);
        }

        @Override
        public void onActivityStarted(Activity activity) {

        }

        @Override
        public void onActivityResumed(Activity activity) {
        }

        @Override
        public void onActivityPaused(Activity activity) {
        }

        @Override
        public void onActivityStopped(Activity activity) {
        }

        @Override
        public void onActivitySaveInstanceState(Activity activity, Bundle outState) {
        }

        @Override
        public void onActivityDestroyed(Activity activity) {
        }
    };

    public static void applyLang(Context context) {
        try {
            final String language = BasicMessageUtil.lanCode;
            if (!TextUtils.isEmpty(language)) {
                Locale locale;
                if (language.contains("en")) {
                    locale = Locale.ENGLISH;
                } else if (language.contains("vi")) {
                    locale = new Locale("vi");
                } else if (language.contains("th")) {
                    locale = new Locale("th");
                } else {
                    locale = Locale.SIMPLIFIED_CHINESE;
                }
                setAppLanguage(context, locale);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
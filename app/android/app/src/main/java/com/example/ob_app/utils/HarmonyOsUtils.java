package com.example.ob_app.utils;

import android.content.Context;
import android.os.Build;
import android.provider.Settings;
import android.text.TextUtils;

import java.lang.reflect.Method;

public class HarmonyOsUtils {
    /**
     * 获取华为系统版本名称
     * @return String  返回值：harmony
     * */
    public static String osBandName() {
        try {
            Class clz = Class.forName("com.huawei.system.BuildEx");
            return (String) clz.getMethod("getOsBrand").invoke(clz);
        } catch (Throwable e) {
//            e.printStackTrace();
        }
        return "";
    }
    /**
     * 获取华为系统版本号
     * @return 版本号
     */
    public static String harmonyOsv() {
        return getProp("hw_sc.build.platform.version", "");
    }

    private static String getProp(String property, String defaultValue) {
        try {
            Class spClz = Class.forName("android.os.SystemProperties");
            Method method = spClz.getDeclaredMethod("get", String.class);
            String value = (String) method.invoke(spClz, property);
            if (TextUtils.isEmpty(value)) {
                return defaultValue;
            }
            return value;
        } catch (Throwable e) {
//            e.printStackTrace();
        }
        return defaultValue;
    }
    /**
     * 获取鸿蒙纯净模式状态
     * 0：开启，1：关闭
     *
     * @param context
     * @return
     */
    public static int readPureModeState(Context context) {
        int result = 1;

        try {
            if (context != null) {
                result = Settings.Secure.getInt(context.getContentResolver(), "pure_mode_state", 0);
            }
        } catch (Exception e) {
//            e.printStackTrace();
        }
        return result;
    }
    public static boolean isHuaWei() {
        String manufacturer = Build.MANUFACTURER;
        //这个字符串可以自己定义,例如判断华为就填写huawei,魅族就填写meizu
        if ("huawei".equalsIgnoreCase(manufacturer)) {
            return true;
        }
        return false;
    }

}

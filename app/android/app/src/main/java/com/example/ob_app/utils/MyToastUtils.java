package com.example.ob_app.utils;

import android.content.Context;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.TextView;
import android.widget.Toast;

import com.example.ob_app.R;
import com.hjq.toast.ToastUtils;

public class MyToastUtils {

    public static void showShort(Context context, String msg) {
        try {
            ToastUtils.setView(R.layout.toast_layout);
            ToastUtils.show(msg);
        } catch (Exception e) {
            e.printStackTrace();
            Log.d("aaaaaa", "showShort: e="+e);
        }
    }
}

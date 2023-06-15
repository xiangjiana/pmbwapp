package com.example.ob_app.utils;

import android.content.ClipData;
import android.content.ClipboardManager;
import android.content.Context;
import android.widget.Toast;

import com.hjq.toast.ToastUtils;

public class CopyAndPasteUtils {
    /**
     * 复制
     *
     * @param content
     * @param context
     */
    public static void copy(String content, Context context) {
        ClipboardManager mClipboardManager  = (ClipboardManager) context
                .getSystemService(Context.CLIPBOARD_SERVICE);
        ClipData clipData = ClipData.newPlainText("copy from demo", content);
        mClipboardManager.setPrimaryClip(clipData);
    }

    /**
     * 粘贴
     *
     * @param context
     * @return
     */
    public static String Paste(Context context) {
        ClipboardManager cbm = (ClipboardManager) context
                .getSystemService(Context.CLIPBOARD_SERVICE);
        return cbm.getText().toString().trim();
    }

}

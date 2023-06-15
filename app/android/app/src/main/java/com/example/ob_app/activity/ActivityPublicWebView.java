package com.example.ob_app.activity;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import android.app.AlertDialog;
import android.content.Context;
import android.content.DialogInterface;
import android.content.Intent;
import android.graphics.Bitmap;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Bundle;
import android.util.AttributeSet;
import android.util.Log;
import android.view.View;
import android.webkit.SslErrorHandler;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.ImageView;
import android.widget.TextView;

import com.example.ob_app.FinishActivityManager;
import com.example.ob_app.MyExtKt;
import com.example.ob_app.R;
import com.example.ob_app.SerializableMap;
import com.example.ob_app.utils.BasicMessageUtil;

import org.greenrobot.eventbus.EventBus;
import org.jetbrains.annotations.NotNull;

import java.util.Collections;
import java.util.Map;

public class ActivityPublicWebView extends AppCompatActivity {
    private String emptyUrl = "about:blank";
    private ImageView iv_close;
    private TextView tv_name;
    private WebView webview;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        MyExtKt.applyNavigationBarColor(this, (R.color.color_151E25));
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_deposit_web_view);
        FinishActivityManager.getManager().addActivity(this);
        webview = findViewById(R.id.webview);
        iv_close = findViewById(R.id.iv_close);
        tv_name = findViewById(R.id.tv_name);
        settingWebView();

        iv_close.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                finish();
            }
        });

        getBunderData();

    }

    private void settingWebView() {

        /**支持Js**/
        WebSettings webSettings = webview.getSettings();
        webSettings.setJavaScriptEnabled(true);
        webSettings.setDomStorageEnabled(true);
        webSettings.setMixedContentMode(webSettings.MIXED_CONTENT_ALWAYS_ALLOW);
        // Allow local storage.
        webSettings.setJavaScriptCanOpenWindowsAutomatically(true);
        webSettings.setSupportMultipleWindows(true);
        webview.setLayerType(View.LAYER_TYPE_HARDWARE, null);


        webview.clearCache(true);
        webview.clearHistory();


        webview.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                view.loadUrl(url);
                return true;
            }

            @Override
            public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
                handler.proceed();
            }
        });
        webview.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                super.onProgressChanged(view, newProgress);
            }
        });



    }


    private void getBunderData() {
        try {
            Intent intent = getIntent();
            String url = intent.getStringExtra("url");
            String title = intent.getStringExtra("title");
            if(title != null && !title.isEmpty()){
                tv_name.setText(title);
            }

            if (null != url && !url.isEmpty()) {
                webview.loadUrl(url);
            } else {
                webview.loadUrl(emptyUrl);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean alipay( WebView view, String url) {
        // 获取上下文, H5PayDemoActivity为当前页面

        // ------  对alipays:相关的scheme处理 -------
        if(url.startsWith("alipays:") || url.startsWith("alipay")) {
            try {
                startActivity(new Intent("android.intent.action.VIEW", Uri.parse(url)));
            } catch (Exception e) {
                new AlertDialog.Builder(this)
                        .setMessage(R.string.wei_jian_ce_dao_alipay)
                        .setPositiveButton(R.string.li_ji_an_zhuang, new DialogInterface.OnClickListener() {
                            @Override
                            public void onClick(DialogInterface dialog, int which) {
                                Uri alipayUrl = Uri.parse("https://d.alipay.com");
                                startActivity(new Intent("android.intent.action.VIEW", alipayUrl));
                            }
                        }).setNegativeButton(R.string.qu_xiao, null).show();
            }
            return true;
        }
        // ------- 处理结束 -------
        if (!(url.startsWith("http") || url.startsWith("https"))) {
            return true;
        }
        view.loadUrl(url);
        return true;
    }


    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (webview != null) {
            webview.loadDataWithBaseURL(null, "", "text/html", "utf-8", null);
            webview.clearHistory();
            webview.destroy();
            webview = null;
        }

    }
}
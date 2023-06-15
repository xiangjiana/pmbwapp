package com.example.ob_app.activity;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.app.Activity;
import android.app.ActivityManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.ActivityInfo;
import android.graphics.Bitmap;
import android.media.AudioManager;
import android.net.Uri;
import android.net.http.SslError;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.webkit.DownloadListener;
import android.webkit.JavascriptInterface;
import android.webkit.SslErrorHandler;
import android.webkit.WebChromeClient;
import android.webkit.WebResourceError;
import android.webkit.WebResourceRequest;
import android.webkit.WebResourceResponse;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.ProgressBar;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.widget.LinearLayoutCompat;
import androidx.constraintlayout.widget.ConstraintLayout;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.ob_app.FinishActivityManager;
import com.example.ob_app.MyExtKt;
import com.example.ob_app.NativeEvent;
import com.example.ob_app.R;
import com.example.ob_app.adapter.GameUtils;
import com.example.ob_app.adapter.ItemGame;
import com.example.ob_app.adapter.ItemGame2;
import com.example.ob_app.adapter.ItemGameTab;
import com.example.ob_app.adapter.RecyclerViewUtilsKt;
import com.example.ob_app.bean.Venue;
import com.example.ob_app.dialog.DialogExitFrament;
import com.example.ob_app.dialog.DialogRunWaterFrament;
import com.example.ob_app.dialog.DialogTanHao;
import com.example.ob_app.dialog.DialogTransferAmount;
import com.example.ob_app.event.EventDialogTransfer;
import com.example.ob_app.event.EventDyGameList;
import com.example.ob_app.event.EventGameList;
import com.example.ob_app.event.EventIsShowWater;
import com.example.ob_app.event.EventLoginGameError;
import com.example.ob_app.event.EventNativeToast;
import com.example.ob_app.event.EventRunWaterInfo;
import com.example.ob_app.event.EventShowTransferDialog;
import com.example.ob_app.event.EventUpdateGameWebView;
import com.example.ob_app.utils.BasicMessageUtil;
import com.example.ob_app.utils.CopyAndPasteUtils;
import com.example.ob_app.utils.HarmonyOsUtils;
import com.example.ob_app.utils.MathUtils;
import com.example.ob_app.utils.MyToastUtils;
import com.example.ob_app.utils.PublicUtils;
import com.example.ob_app.view.ExpandableLayout2;
import com.example.ob_app.view.LinearItemDecoration;
import com.example.ob_app.view.TestedGridItemDecoration;
import com.pacific.adapter.AdapterImageLoader;
import com.pacific.adapter.AdapterUtils;
import com.pacific.adapter.AdapterViewHolder;
import com.pacific.adapter.RecyclerAdapter;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ActivityGameWebView extends AppCompatActivity implements View.OnClickListener, AdapterImageLoader {

    //音频管理
    private AudioManager audioManager;

    final String _goBackProtocol = "http://finishtoback";
    final String _goBackProtocol2 = "https://finishtoback";
    private String emptyUrl = "about:blank";
    final String _passOrderAction = "pasteorderaction";
    private String gameCode;
    private String gameType;
    private String gameTitle;
    LinearLayoutCompat toolbar_title_layout;
    ConstraintLayout layout_toolbar;
    ImageView iv_run_water;
    ImageView iv_game_background;
    ImageView iv_show_title;
    ImageView iv_close;
    ImageView iv_menu;
    TextView tv_name;
    ImageView tv_full_screen;
    ImageView iv_refresh;
    ImageView iv_transer;
    WebView webview;
    Activity activity;
    RecyclerView rv_game_tab;
    LinearLayout layout_show;
    ExpandableLayout2 rv_game_expand;
    RecyclerView rv_game;
    ConstraintLayout layout_dy;
    ImageView dy_iv_close;
    TextView dy_tv_title;
    RecyclerView dy_recycler;

    final RecyclerAdapter adapterGameTab = new RecyclerAdapter();
    final RecyclerAdapter adapterGame = new RecyclerAdapter();
    final RecyclerAdapter adapterDyListGame = new RecyclerAdapter();

    private ProgressBar progressBar;
    int titleHeight;
    private int progress = 0;
    private boolean isRefresh = false;
    FrameLayout videoFrame;
    private boolean isDy = false;
    private boolean isImonesb = false;
    private int sPre = -1;
    private ItemGame preItemGame;
    private String url = "", type = "", mGameCode = "", title = "", gameId = "", testify = "", centerAmount = "";
    private View.OnClickListener gameTabOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Object holder = AdapterUtils.INSTANCE.getHolder(v);
            AdapterViewHolder holder2 = (AdapterViewHolder) holder;
            RecyclerView.ViewHolder holder3 = (RecyclerView.ViewHolder) holder;
            ItemGameTab itemGameTab = holder2.item();

            sPre = AdapterUtils.INSTANCE.firstSelectedIndex(adapterGameTab.getAll(), true);
            int cur = holder3.getBindingAdapterPosition();
            if (sPre == cur) {
                itemGameTab.setEnable(!itemGameTab.isEnable());
                adapterGameTab.notifyItemChanged(holder3.getBindingAdapterPosition(), 0);
                if (itemGameTab.isEnable()) {
                    rv_game_expand.expand(true);
                } else {
                    rv_game_expand.collapse(true);
                }
            } else {
                AdapterUtils.INSTANCE.swapIsSelected(sPre, cur, adapterGameTab);
                RecyclerViewUtilsKt.keepItemViewVisible(rv_game_tab, cur, true);
                adapterGame.forceReplaceAll(itemGameTab.getGames());
                itemGameTab.setEnable(true);
                rv_game_expand.expand(true);
            }
        }
    };

    private View.OnClickListener gameOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Object holder = AdapterUtils.INSTANCE.getHolder(v);
            AdapterViewHolder holder2 = (AdapterViewHolder) holder;
            RecyclerView.ViewHolder holder3 = (RecyclerView.ViewHolder) holder;
            ItemGame itemGame = holder2.item();
            int status = itemGame.getData().getStatus();
            if (status == 0 || status == 2) {
                alertInMaintain(false);
                return;
            }

            int pre = AdapterUtils.INSTANCE.firstSelectedIndex(adapterGame.getAll(), true);
            int cur = holder3.getBindingAdapterPosition();
            if (pre == cur) {
                EventUpdateGameWebView data = itemGame.getData().asEventUpdateGameWebView();
                if (data.getGameType().equalsIgnoreCase("dy")) {
                    webview.setVisibility(View.INVISIBLE);
                    layout_dy.setVisibility(View.VISIBLE);
                }
                Log.e("==========gameUtilInit2","gameUtilInit2");
                return;
            }

            if (-1 != sPre) {
                ItemGameTab itemGameTab = adapterGameTab.get(sPre);
                for (ItemGame oo : itemGameTab.getGames()) {
                    oo.setSelected(false);
                }
            }
            if (preItemGame != null) {
                preItemGame.setSelected(false);
            }
            AdapterUtils.INSTANCE.swapIsSelected(pre, cur, adapterGame);
            preItemGame = adapterGame.get(cur);
            RecyclerViewUtilsKt.keepItemViewVisible(rv_game, cur, true);
            EventUpdateGameWebView data = itemGame.getData().asEventUpdateGameWebView();

            if (data.getGameType().equalsIgnoreCase("dy")) {
                setDyGame(data);
            } else {
                getBundleData(data);
                setNavPosition();
            }
        }
    };

    private View.OnClickListener dyGameOnClickListener = new View.OnClickListener() {
        @Override
        public void onClick(View v) {
            Object holder = AdapterUtils.INSTANCE.getHolder(v);
            AdapterViewHolder holder2 = (AdapterViewHolder) holder;
            ItemGame2 itemGame = holder2.item();
            if (itemGame.getData().status != 1) {
                alertInMaintain(true);
                return;
            }
            EventUpdateGameWebView obj = new EventUpdateGameWebView();
            obj.setGameId(String.valueOf(itemGame.getData().gameId));
            obj.setRoutes("/game");
            obj.setGameCode(itemGame.getData().venueCode);
            obj.setGameType("dy");
            obj.setUrl("");
            obj.setTitle(itemGame.getData().gameName);
            obj.setTestify(false);
            obj.setFromHomePage(true);
            if (gameCode.equals(obj.getGameCode()) && gameType.equals(obj.getGameType()) && gameTitle.equals(obj.getTitle())) {
                webview.setVisibility(View.VISIBLE);
                layout_dy.setVisibility(View.INVISIBLE);
                return;
            }
            getBundleData(obj);
        }
    };

    private AdapterImageLoader dyGameImageLoader = new AdapterImageLoader() {
        @Override
        public void load(@NonNull ImageView view, @NonNull AdapterViewHolder holder) {
            ItemGame2 item = holder.item();
            Glide.with(ActivityGameWebView.this).load(item.getData().iconUrl).into(view);
        }
    };

    @SuppressLint("SetJavaScriptEnabled")
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        MyExtKt.applyNavigationBarColor(this, (R.color.color_151E25));
        super.onCreate(savedInstanceState);
        activity = this;
        setContentView(R.layout.activity_web_view);
        FinishActivityManager.getManager().addActivity(this);

        iv_run_water = findViewById(R.id.iv_run_water);
        toolbar_title_layout = findViewById(R.id.toolbar_title_layout);
        layout_toolbar = findViewById(R.id.layout_toolbar);
        iv_show_title = findViewById(R.id.iv_show_title);
        iv_close = findViewById(R.id.iv_close);
        iv_menu = findViewById(R.id.iv_menu);
        tv_name = findViewById(R.id.tv_name);
        tv_full_screen = findViewById(R.id.tv_full_screen);
        iv_refresh = findViewById(R.id.iv_refresh);
        iv_transer = findViewById(R.id.iv_transer);
        webview = findViewById(R.id.webview);
        progressBar = findViewById(R.id.progressBar);
        iv_game_background = findViewById(R.id.iv_game_background);
        iv_game_background.setScaleType(ImageView.ScaleType.FIT_XY);
        videoFrame = findViewById(R.id.fullscreenFrame);
        layout_show = findViewById(R.id.layout_show);

        layout_dy = findViewById(R.id.layout_dy);
        dy_iv_close = findViewById(R.id.dy_iv_close);
        dy_tv_title = findViewById(R.id.dy_tv_title);
        dy_recycler = findViewById(R.id.dy_recycler);
        dy_recycler.setLayoutManager(new GridLayoutManager(this, 2, GridLayoutManager.VERTICAL, false));
        dy_recycler.addItemDecoration(new TestedGridItemDecoration(this, R.dimen.dp8));
        adapterDyListGame.setImageLoader(dyGameImageLoader);
        adapterDyListGame.setOnClickListener(dyGameOnClickListener);
        dy_recycler.setAdapter(adapterDyListGame);

        rv_game_expand = findViewById(R.id.rv_game_expand);
        rv_game_tab = findViewById(R.id.rv_game_tab);
        rv_game = findViewById(R.id.rv_game);
        RecyclerViewUtilsKt.disableDefaultItemAnimator(rv_game_tab);
        RecyclerViewUtilsKt.disableDefaultItemAnimator(rv_game);

        rv_game_tab.setLayoutManager(new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false));
        LinearItemDecoration.builder(this)
                .color(android.R.color.transparent, R.dimen.dp12)
                .horizontal()
                .build()
                .addTo(rv_game_tab);
        rv_game.setLayoutManager(new LinearLayoutManager(this, RecyclerView.HORIZONTAL, false));
        LinearItemDecoration.builder(this)
                .color(android.R.color.transparent, R.dimen.dp12)
                .horizontal()
                .build()
                .addTo(rv_game);
        rv_game_tab.setAdapter(adapterGameTab);
        rv_game.setAdapter(adapterGame);
        adapterGameTab.setOnClickListener(gameTabOnClickListener);
        adapterGame.setOnClickListener(gameOnClickListener);
        adapterGame.setImageLoader(this);

        settingWebView();
        initListener();
        setTitleClick(false);
        EventUpdateGameWebView data = getIntent().getParcelableExtra("data");
        isDy = "dy".equalsIgnoreCase(data.getGameType());
        rv_game_tab.setVisibility(View.VISIBLE);
        rv_game_expand.setVisibility(View.VISIBLE);

        if (isDy) {
            setDyGame(data);
            setFullScreen(false);
        } else {
            getBundleData(data);
        }

        iv_close.setClickable(false);
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                iv_close.setClickable(true);
            }
        }, 1000);

        if (BasicMessageUtil.apiGame != null) {
            onEventGameList(new EventGameList(BasicMessageUtil.apiGame.getData()));
        }

        EventBus.getDefault().register(this);

        iv_show_title.postDelayed(() -> setNavPosition(), 500);

    }

    private void setDyGame(EventUpdateGameWebView data) {
        BasicMessageUtil.getInstance().getDyGameList(data.getGameCode());
        webview.setVisibility(View.INVISIBLE);
        layout_dy.setVisibility(View.VISIBLE);
        gameCode = data.getGameCode();
        gameType = data.getGameType();
        gameTitle = data.getTitle();
        title = gameTitle;
        tv_name.setText(title);
        dy_tv_title.setText(title);
    }

    private void getBundleData(EventUpdateGameWebView data) {
        webview.setVisibility(View.VISIBLE);
        layout_dy.setVisibility(View.INVISIBLE);
        gameTitle = data.getTitle();
        String url = data.getUrl();
        String gameCode = data.getGameCode();
        gameType = data.getGameType();
        isImonesb = "imone-sb".equalsIgnoreCase(data.getGameCode());
        setData(gameTitle, gameCode, url);
        BasicMessageUtil.getInstance().gameInit(data);
    }

    private void setNavPosition() {
        LinearLayout.LayoutParams lp = (LinearLayout.LayoutParams) iv_show_title.getLayoutParams();
        if (isImonesb) {
            lp.setMarginStart(layout_show.getWidth() / 2);
        } else {
            lp.setMarginStart(0);
        }
        iv_show_title.setLayoutParams(lp);
        iv_show_title.requestLayout();
    }

    private void alertInMaintain(boolean isGame) {
        String title = getResources().getString(R.string.tishi);
        String msg;
        if (isGame) {
            msg = getResources().getString(R.string.game_in_maintain2);
        } else {
            msg = getResources().getString(R.string.game_in_maintain);
        }
        String ok = getResources().getString(R.string.que_ren);
        DialogTanHao dialogTanHao = DialogTanHao.newInstance(title, msg, ok,false);
        dialogTanHao.show(getSupportFragmentManager(), "");
    }

    //更新url
    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onStringEvent(EventUpdateGameWebView event) {
        String title = event.getTitle();
        String url = event.getUrl();
        String gameCode = event.getGameCode();
        if (gameCode.equals(gameCode)) {
            setData(title, gameCode, url);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onEventGameList(EventGameList event) {
        if (!adapterGameTab.isEmpty()) return;

        int gameTabIndex = -1;
        int gameIndex = -1;
        List<ItemGameTab> list = new ArrayList<>();
        ItemGameTab itemGameTab;
        ItemGame itemGame;
        for (int i = 0; i < event.data.size(); i++) {
            itemGameTab = new ItemGameTab(event.data.get(i));
            if (gameTabIndex == -1 && gameType.equalsIgnoreCase(itemGameTab.getData().getVenueTypeCode())) {
                gameTabIndex = i;
                itemGameTab.setSelected(true);
            }

            List<ItemGame> list2 = new ArrayList<>();
            List<Venue> games = event.data.get(i).getVenueList();
            for (int j = 0; j < games.size(); j++) {
                itemGame = new ItemGame(games.get(j));
                if (gameIndex == -1 && gameCode.equalsIgnoreCase(itemGame.getData().getVenueCode())) {
                    gameIndex = j;
                    itemGame.setSelected(true);
                }
                list2.add(itemGame);
            }

            itemGameTab.getGames().addAll(list2);
            list.add(itemGameTab);
        }

        Log.e("WWWWWWWWWWWWWWWWWWWW=", String.valueOf(gameTabIndex));
        Log.e("WWWWWWWWWWWWWWWWWWWW=", String.valueOf(gameIndex));
        Log.e("WWWWWWWWWWWWWWWWWWWW=", gameCode);
        Log.e("WWWWWWWWWWWWWWWWWWWW=", gameType);
        adapterGameTab.forceReplaceAll(list);
        if (-1 != gameTabIndex) {
            adapterGame.forceReplaceAll(list.get(gameTabIndex).getGames());
            RecyclerViewUtilsKt.keepItemViewVisible(rv_game_tab, gameTabIndex, false);
        }
        if (-1 != gameIndex) {
            RecyclerViewUtilsKt.keepItemViewVisible(rv_game, gameIndex, false);
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onEventDyGameList(EventDyGameList event) {
        List<ItemGame2> list = new ArrayList<>();
        ItemGame2 itemGame;
        for (int i = 0; i < event.data.size(); i++) {
            itemGame = new ItemGame2(event.data.get(i));
            list.add(itemGame);
        }
        adapterDyListGame.forceReplaceAll(list);
    }

    //更新url
    @Subscribe(threadMode = ThreadMode.MAIN)
    public void onStringEvent(String event) {
        if (NativeEvent.webViewPageEvent_reload.equals(event)) {
            if (webview != null) {
                isRefresh = true;
                webview.reload();
            }
        }
    }

    @JavascriptInterface
    public void postMessage(String json) {
        //Log.e("77777777777777=", json);
        try {
            JSONObject jsonObject = new JSONObject(json);
            String method = jsonObject.getString("title");
            if (method == null) {
                method = "";
            }
            if (method.equals("openNewPage")) {
                String url = jsonObject.getString("url");
                Intent hashIntent = new Intent(this, ActivityPublicWebView.class);
                hashIntent.putExtra("title", gameTitle);
                hashIntent.putExtra("url", url);
                startActivity(hashIntent);

                return;
            }
        } catch (JSONException e) {
            e.printStackTrace();
        }
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
        webview.addJavascriptInterface(this, "APPBridge");
        webview.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        boolean huaWei = HarmonyOsUtils.isHuaWei();
        if (huaWei) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P) {
                String processName = getProcessName(this);
                String packageName = this.getPackageName();
                if (!packageName.equals(processName)) {
                    WebView.setDataDirectorySuffix(processName);
                }
            }
        }

        webview.clearCache(true);
        webview.clearHistory();
        webview.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                Log.e("77777777777777=", url);
                //返回false代表让WebView自己处理
                //此处调用有点多余。此外引发彩票无法切换多语言
                //view.loadUrl(url);
                return captureUrl(url);
            }

            @Override
            public void onReceivedSslError(WebView view, SslErrorHandler handler, SslError error) {
                handler.proceed();
            }

            @Override
            public void onReceivedHttpError(WebView view, WebResourceRequest request, WebResourceResponse errorResponse) {
                super.onReceivedHttpError(view, request, errorResponse);
                String encoding = errorResponse.getEncoding();
                String mimeType = errorResponse.getMimeType();
                String reasonPhrase = errorResponse.getReasonPhrase();
            }

            @Override
            public void onReceivedError(WebView view, WebResourceRequest request, WebResourceError error) {
                super.onReceivedError(view, request, error);
                String s = error.getDescription().toString();
                int encoding = error.getErrorCode();
                String url = view.getUrl();
                if (currentUrl.equals(url)) {
                    if (encoding == ERROR_TIMEOUT) {

                        String 提示 = getResources().getString(R.string.tishi);
                        String 连接超时稍后再试 = getResources().getString(R.string.lian_jie_chao_shi_shao_hou_zai_shi);
                        String 我知道了 = getResources().getString(R.string.wo_zhi_dao_le);
                        DialogTanHao dialogTanHao = DialogTanHao.newInstance(提示, 连接超时稍后再试, 我知道了,false);
                        dialogTanHao.show(getSupportFragmentManager(), "");

                    }
                }
            }

            @Override
            public void onPageStarted(WebView view, String url, Bitmap favicon) {
                super.onPageStarted(view, url, favicon);
                progressBar.setVisibility(View.VISIBLE);
                Log.e("77777777777777=", url);
                boolean flag = captureUrl(url);
                if (flag) finish();
            }

            @Override
            public void onPageFinished(WebView view, String url) {
                super.onPageFinished(view, url);
                progressBar.setVisibility(View.GONE);
                iv_game_background.postDelayed(() -> {
                    iv_game_background.setVisibility(View.GONE);
                },1500);

                if (!emptyUrl.equals(url) && !isRefresh) {
                    setFullScreen(true);
                    setTitleClick(true);
                }
            }
        });
        webview.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                if (newProgress == 100) {
                    progress = 0;

                }
                if (newProgress > progress) {
                    progressBar.setProgress(newProgress);//设置进度值
                    progress = newProgress;
                }
                super.onProgressChanged(view, newProgress);
            }

            @Override
            public void onShowCustomView(View view, CustomViewCallback callback) {
                boolean hideCustomView = !gameType.equals("dj") && !gameType.equals("zr");
                if (hideCustomView) {
                    videoFrame.post(new Runnable() {
                        @Override
                        public void run() {
                            callback.onCustomViewHidden();
                        }
                    });
                }

                super.onShowCustomView(view, callback);
                videoFrame.removeAllViews();
                videoFrame.setVisibility(View.VISIBLE);
                videoFrame.addView(view);
                // 设置为横屏模式
                if (gameType.equals("dj")) {
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_LANDSCAPE);
                }
            }

            @Override
            public void onHideCustomView() {
                super.onHideCustomView();
                videoFrame.setVisibility(View.GONE);
                videoFrame.removeAllViews();
                // 设置为竖屏模式
                if (gameType.equals("dj")) {
                    setRequestedOrientation(ActivityInfo.SCREEN_ORIENTATION_PORTRAIT);
                }
            }
        });

        webview.setDownloadListener(new DownloadListener() {
            @Override
            public void onDownloadStart(
                    String url,
                    String userAgent,
                    String contentDisposition,
                    String mimetype,
                    long contentLength
            ) {
                try {
                    Uri uri = Uri.parse(url);
                    Intent intent = new Intent(Intent.ACTION_VIEW, uri);
                    startActivity(intent);
                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        });
    }

    private boolean captureUrl(String url) {
        String withUrl = url.toLowerCase();
        ///真人-斗鸡-返回键会跳转https://transfer.gamefowlboxing.live/null空页面
        if(url.endsWith("boxing.live/null")){
            BasicMessageUtil.getInstance().gameDesotry();
            finish();
            return true;
        }
        boolean b = withUrl.startsWith(_goBackProtocol) || withUrl.startsWith(_goBackProtocol2) ;
        boolean b1 = withUrl.startsWith(_passOrderAction);
        if (b) {
            BasicMessageUtil.getInstance().gameDesotry();
            finish();
            return true;
        } else if (b1) {
            boolean orderSN = withUrl.contains("orderSN");
            if (orderSN) {
                String[] split = withUrl.split("=");
                if (split.length == 2) {
                    String orderNumber = split[1];
                    CopyAndPasteUtils.copy(orderNumber, activity);
                }
            }
            //pasteorderaction://paste?orderSN=4962448734999687
            _passOrderAction.contains("orderSN");
            return true;
        }
        return false;
    }

    private void setData(String title, String gameCodes, String url) {
        gameCode = gameCodes;
        tv_name.setText(title);
        dy_tv_title.setText(title);
        int backResource = GameUtils.INSTANCE.gameBackgroundIcon(gameType);
        iv_game_background.setImageResource(backResource);
        iv_game_background.setVisibility(View.VISIBLE);
        if (null != url && !url.isEmpty()) {
            isRefresh = false;
            currentUrl = url;
            webview.loadUrl(url);
        }
    }

    private String currentUrl = "";


    @Override
    protected void onNewIntent(Intent intent) {
        super.onNewIntent(intent);
    }

    private void initListener() {
        toolbar_title_layout.setOnClickListener(this);
        iv_show_title.setOnClickListener(this);
        iv_close.setOnClickListener(this);
        iv_menu.setOnClickListener(this);
        tv_name.setOnClickListener(this);
        tv_full_screen.setOnClickListener(this);
        iv_refresh.setOnClickListener(this);
        iv_transer.setOnClickListener(this);
        iv_run_water.setOnClickListener(this);
        dy_iv_close.setOnClickListener(this);

    }


    DialogExitFrament dialogExitFrament;

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (R.id.toolbar_title_layout == id) {
        } else if (R.id.iv_close == id) {
            intervals(this, new intervalsTime() {
                @Override
                public void ok(Context context) {
                    if (dialogExitFrament != null) {
                        dialogExitFrament.dismiss();
                    }
                    dialogExitFrament = DialogExitFrament.newInstance("", "", "", "",false);
                    dialogExitFrament.show(getSupportFragmentManager(), "");
                    dialogExitFrament.setListerner(new DialogExitFrament.OnClickListener() {
                        @Override
                        public void cancel() {

                        }

                        @Override
                        public void sure() {
                            BasicMessageUtil.getInstance().gameDesotry();
                            finish();
                        }
                    });
                }
            });

        } else if (R.id.tv_name == id) {
        } else if (R.id.iv_menu == id) {


        } else if (R.id.tv_full_screen == id) {
            setFullScreen(false);
        } else if (R.id.iv_refresh == id) {
            intervals(this, new intervalsTime() {
                @Override
                public void ok(Context context) {
                    BasicMessageUtil.getInstance().gameRefresh();
                    setFullScreen(false);
                }
            });


        } else if (R.id.iv_transer == id) {
            intervals(this, new intervalsTime() {
                @Override
                public void ok(Context context) {
                    Intent intent = new Intent(context, ActivityTransfer.class);
                    startActivity(intent);
                }
            });

        } else if (R.id.iv_show_title == id) {
            iv_show_title.setVisibility(View.GONE);
            toolbar_title_layout.setVisibility(View.VISIBLE);
            ObjectAnimator translationY = ObjectAnimator.ofFloat(toolbar_title_layout, "translationY", -titleHeight, 0).setDuration(100);
            translationY.addListener(new AnimatorListenerAdapter() {
                @Override
                public void onAnimationEnd(Animator animation) {
                    super.onAnimationEnd(animation);
                }
            });
            translationY.start();

        } else if (R.id.iv_run_water == id) {
            intervals(this, new intervalsTime() {

                @Override
                public void ok(Context context) {
                    BasicMessageUtil.getInstance().getRunWaterDetails(gameCode, true);
                }
            });
        } else if (R.id.dy_iv_close == id) {
            finish();
        }

    }

    private void setFullScreen(boolean delayNoneBg) {
        if (delayNoneBg) {
            iv_game_background.postDelayed(() -> {
                iv_game_background.setVisibility(View.GONE);
            },3000);
        }else {
            iv_game_background.setVisibility(View.GONE);
        }
        titleHeight = toolbar_title_layout.getHeight();
        ObjectAnimator translationY = ObjectAnimator.ofFloat(toolbar_title_layout, "translationY", 0, -titleHeight).setDuration(100);
        translationY.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);
                toolbar_title_layout.setVisibility(View.GONE);
                iv_show_title.setVisibility(View.VISIBLE);
            }
        });
        translationY.start();


    }

    private void setTitleClick(boolean isClick) {
        //tv_full_screen.setClickable(isClick);
        iv_menu.setClickable(isClick);
        iv_transer.setClickable(isClick);
        iv_run_water.setClickable(isClick);
        iv_refresh.setClickable(isClick);
        if (isClick) {
            iv_menu.setImageResource(R.mipmap.com_game_pack_up);
            iv_transer.setImageResource(R.mipmap.com_account);
            iv_run_water.setImageResource(R.mipmap.com_running_water);
            iv_refresh.setImageResource(R.mipmap.com_refresh);
        } else {
            iv_menu.setImageResource(R.mipmap.com_game_pack_up_huise);
            iv_transer.setImageResource(R.mipmap.com_account_huise);
            iv_run_water.setImageResource(R.mipmap.com_running_water_huise);
            iv_refresh.setImageResource(R.mipmap.com_refresh_huise);

        }


    }


    @Override
    public void onBackPressed() {
        //super.onBackPressed();
        if (System.currentTimeMillis() - lastTime > 1000) {
            lastTime = System.currentTimeMillis();
            String title = getString(R.string.nin_que_ding_yao_li_kai_you_xi);
            DialogExitFrament dialogExitFrament = DialogExitFrament.newInstance("", title, "", "",false);
            dialogExitFrament.show(getSupportFragmentManager(), "");
            dialogExitFrament.setListerner(new DialogExitFrament.OnClickListener() {
                @Override
                public void cancel() {
                }

                @Override
                public void sure() {
                    BasicMessageUtil.getInstance().gameDesotry();
                    finish();
                }
            });

        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)//是否显示流水详情
    public void onStringEvent(EventIsShowWater event) {
        Map<String, Object> arguments = event.getArguments();
        if (arguments != null) {
            boolean isHide = (boolean) arguments.get("isHide");
            if (isHide) {
                iv_run_water.setVisibility(View.GONE);
            } else {
                iv_run_water.setVisibility(View.VISIBLE);
            }

        }
    }

    DialogTransferAmount dialogTransferAmount;

    @Subscribe(threadMode = ThreadMode.MAIN)//选择钱包
    public void onStringEvent(EventShowTransferDialog event) {
        Map<String, Object> arguments = event.getArguments();
        if (arguments != null) {

            if (arguments.containsKey("url")) {
                url = (String) arguments.get("url");
            }
            if (arguments.containsKey("typeNum")) {
                type = (String) arguments.get("typeNum");
            }
            if (arguments.containsKey("gameCode")) {
                gameCode = (String) arguments.get("gameCode");
                mGameCode = gameCode;
            }
            if (arguments.containsKey("title")) {
                title = (String) arguments.get("title");
                gameTitle = title;
            }
            if (arguments.containsKey("gameId")) {
                gameId = (String) arguments.get("gameId");
            }
            if (arguments.containsKey("testify")) {
                testify = (String) arguments.get("testify");
            }

            if (arguments.containsKey("centerAmount")) {
                centerAmount = (String) arguments.get("centerAmount");
            }


            if (dialogTransferAmount != null) {
                dialogTransferAmount.dismiss();
            }

            try {
                centerAmount = PublicUtils.formatTwoPoint(Double.parseDouble(centerAmount));
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            dialogTransferAmount = DialogTransferAmount.newInstance(centerAmount);
            dialogTransferAmount.show(getSupportFragmentManager(), "");
            dialogTransferAmount.setListerner(new DialogTransferAmount.OnClickListener() {
                @Override
                public void cancel() {
                }

                @Override
                public void sure(String money) {
                    String sMoney = money;
                    if (BasicMessageUtil.moneySymbol.equals(BasicMessageUtil.moneySymbolNV)) {
                        sMoney = MathUtils.prettyDouble(MathUtils.multiply(Double.parseDouble(money), 1000.00));
                    }
                    BasicMessageUtil.getInstance().dialogTransfer(url, type, mGameCode, title, gameId, testify, sMoney);
                }
            });

        }


    }

    private DialogRunWaterFrament dialogRunWaterFrament;

    @Subscribe(threadMode = ThreadMode.MAIN)//流水详情
    public void onStringEvent(EventRunWaterInfo eventTransferNow) {
        Map<String, Object> arguments = eventTransferNow.getArguments();
        if (arguments != null) {
            String activityName = (String) arguments.get("activityName");
            String billAmount = (String) arguments.get("billAmount");
            String completeBillAmount = (String) arguments.get("completeBillAmount");
            String percentage = (String) arguments.get("percentage");
            Object depositFlow = arguments.get("depositFlow");
            if (null != depositFlow) {
                if (dialogRunWaterFrament == null) {
                    dialogRunWaterFrament = DialogRunWaterFrament.newInstance(activityName, billAmount, completeBillAmount, percentage);
                    dialogRunWaterFrament.show(getSupportFragmentManager(), "");
                    dialogRunWaterFrament.setListerner(new DialogRunWaterFrament.OnClickListener() {
                        @Override
                        public void cancel() {

                        }

                        @Override
                        public void sure() {

                        }

                        @Override
                        public void onDismiss() {
                            dialogRunWaterFrament = null;
                        }
                    });
                }
            }

        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)//流水详情
    public void onStringEvent(EventDialogTransfer dialogTransfer) {
        Map<String, Object> arguments = dialogTransfer.getArguments();
        if (arguments != null && dialogTransferAmount != null) {
            String status = (String) arguments.get("status");
            if ("true".equals(status)) {
                dialogTransferAmount.dismiss();
            }
        }
    }

    @Subscribe(threadMode = ThreadMode.MAIN)//流水详情
    public void onStringEvent(EventLoginGameError eventLoginGameError) {
        Map<String, Object> arguments = eventLoginGameError.getArguments();
        if (arguments != null) {
            String status = (String) arguments.get("title");
            String message = (String) arguments.get("message");
            String confirmText = (String) arguments.get("confirmText");

            DialogTanHao dialogTanHao = DialogTanHao.newInstance(status, message, confirmText,false);
            dialogTanHao.show(getSupportFragmentManager(), "");

            dialogTanHao.setListerner(new DialogTanHao.OnClickListener() {
                @Override
                public void sure() {
                    finish();
                }
            });


        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)// 配置錢包参加活动
    public void onStringEvent(EventNativeToast eventNativeToast) {
        String message = eventNativeToast.getMessage();
        MyToastUtils.showShort(this, message);
    }

    private long lastTime;
    private final static long INTERVALS = 1500;

    @Override
    public void load(@NonNull ImageView imageView, @NonNull AdapterViewHolder viewHolder) {
        ItemGame itemGame = viewHolder.item();
        Glide.with(this).load(itemGame.getData().getVenueTransferIconUrlApp()).into(imageView);
    }


    interface intervalsTime {
        void ok(Context context);
    }

    private void intervals(Context context, intervalsTime intervalsTime) {
        if (System.currentTimeMillis() - lastTime > INTERVALS) {
            lastTime = System.currentTimeMillis();
            if (intervalsTime != null) {
                intervalsTime.ok(context);
            }
        }

    }

    private AudioManager.OnAudioFocusChangeListener listener;


    @Override
    protected void onResume() {
        if (audioManager != null) {
            audioManager.abandonAudioFocus(listener);
            audioManager = null;
        }
        super.onResume();
        webview.onResume();

    }

    @Override
    protected void onPause() {
        //解决退出时音效继续播放
        audioManager = (AudioManager) this.getSystemService(Context.AUDIO_SERVICE);
        listener = new AudioManager.OnAudioFocusChangeListener() {
            @Override
            public void onAudioFocusChange(int focusChange) {
            }
        };
        audioManager.requestAudioFocus(listener, AudioManager.STREAM_MUSIC, AudioManager.AUDIOFOCUS_GAIN_TRANSIENT);
        super.onPause();
        webview.onPause();
    }


    @Override
    protected void onStop() {
        super.onStop();
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

        //BasicMessageUtil.getInstance().gameDesotry();
        EventBus.getDefault().unregister(this);
    }

    private String getProcessName(Context context) {
        if (context == null) return null;
        ActivityManager manager = (ActivityManager) context.getSystemService(Context.ACTIVITY_SERVICE);
        for (ActivityManager.RunningAppProcessInfo processInfo : manager.getRunningAppProcesses()) {
            if (processInfo.pid == android.os.Process.myPid()) {
                return processInfo.processName;
            }
        }
        return null;
    }
}
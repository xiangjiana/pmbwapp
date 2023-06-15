package com.example.ob_app.dialog;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ValueAnimator;
import android.app.Dialog;
import android.content.Context;
import android.os.Bundle;
import android.os.Handler;
import android.util.Log;
import android.view.Gravity;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.airbnb.lottie.LottieAnimationView;
import com.example.ob_app.R;
import com.example.ob_app.activity.ActivityTransfer;
import com.example.ob_app.adapter.AdapterOne;
import com.example.ob_app.adapter.AdapterWallet;
import com.example.ob_app.bean.WalletBean;
import com.example.ob_app.utils.ConstantType;
import com.google.android.material.bottomsheet.BottomSheetDialog;
import com.google.android.material.bottomsheet.BottomSheetDialogFragment;

import org.greenrobot.eventbus.EventBus;
import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class DialogBottomWallet extends BottomSheetDialogFragment implements View.OnClickListener {
    private Context mContext;
    private ImageView ivBackTitle;
    private ImageView ivClose;
    private ImageView ivRefresh;
    private LottieAnimationView lav_refresh;
    private RecyclerView walletRecycle;
    private AdapterWallet adapterWallet;
    private List<WalletBean> mData;
    private boolean currentWalletIsCenter;
    private OnClickListener onClickListener;
    public DialogBottomWallet(ActivityTransfer activityTransfer) {
        mContext = activityTransfer;
    }

    @Override
    public void onCreate(@Nullable @org.jetbrains.annotations.Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setStyle(BottomSheetDialogFragment.STYLE_NORMAL, R.style.CustomBottomSheetDialogTheme);
    }

    @Nullable
    @org.jetbrains.annotations.Nullable
    @Override
    public View onCreateView(@NonNull @NotNull LayoutInflater inflater, @Nullable @org.jetbrains.annotations.Nullable ViewGroup container, @Nullable @org.jetbrains.annotations.Nullable Bundle savedInstanceState) {
        View root = inflater.inflate(R.layout.wallet_view, container,false);
        setView(root);
        return root;
    }

    private void setView(View root) {
        ivBackTitle = (ImageView) root.findViewById(R.id.iv_back_title);
        ivClose = (ImageView) root.findViewById(R.id.iv_close);
        ivRefresh = (ImageView) root.findViewById(R.id.iv_refresh);
        walletRecycle = (RecyclerView) root.findViewById(R.id.walletRecycle);
        lav_refresh =  root.findViewById(R.id.lav_refresh);
        LinearLayoutManager mLayoutManager = new LinearLayoutManager(mContext, LinearLayoutManager.VERTICAL, false);
        ivClose.setOnClickListener(this);
        ivRefresh.setOnClickListener(this);
        lav_refresh.setOnClickListener(this);
        adapterWallet = new AdapterWallet(currentWalletIsCenter);
        walletRecycle.setLayoutManager(mLayoutManager);
        walletRecycle.setAdapter(adapterWallet);
        adapterWallet.updateData(mData);
        adapterWallet.addListerner(new AdapterWallet.OnClickListener() {
            @Override
            public void select(WalletBean bean) {
                EventBus.getDefault().post(bean);
                dismiss();
            }
        });
        lav_refresh.addAnimatorListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationRepeat(Animator animation) {
                super.onAnimationRepeat(animation);
                Object tag = lav_refresh.getTag();
                if ("success".equals(tag)) {
                    lav_refresh.pauseAnimation();
                    lav_refresh.cancelAnimation();

                }

            }

            @Override
            public void onAnimationCancel(Animator animation) {
                super.onAnimationCancel(animation);
                Object tag = lav_refresh.getTag();
                if ("success".equals(tag)){
                    lav_refresh.setVisibility(View.GONE);
                    ivRefresh.setVisibility(View.VISIBLE);

                }

            }


        });
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id==R.id.iv_close) {
            dismiss();
        } else if (id == R.id.iv_refresh) {
            if (onClickListener != null) {

                startRefreshAnimation();
                new Handler().postDelayed(new Runnable() {
                    @Override
                    public void run() {
                        onClickListener.onRefresh();
                    }
                }, 1000);

            }
        }
    }

    public void setData(List<WalletBean> list, boolean isFromCenterToOthers) {
        mData=list;
        currentWalletIsCenter = isFromCenterToOthers;
        if (adapterWallet != null) {
            adapterWallet.updateData(mData);
        }

    }


    public interface OnClickListener {
        void onRefresh();
    }
    public void setListerner(OnClickListener listener) {
        onClickListener = listener;
    }

    public void startRefreshAnimation() {
        ivRefresh.setVisibility(View.GONE);
        lav_refresh.setVisibility(View.VISIBLE);
        lav_refresh.setTag("refresh");
        lav_refresh.setAnimation("refresh.json");
        lav_refresh.playAnimation();

    }
    public void finishRefreshAnimation() {
        int visibility = ivRefresh.getVisibility();
        if (visibility == View.GONE) {
            lav_refresh.setVisibility(View.VISIBLE);
            lav_refresh.setAnimation("refresh_success.json");
            lav_refresh.setTag("success");
            lav_refresh.playAnimation();
        }

    }
}

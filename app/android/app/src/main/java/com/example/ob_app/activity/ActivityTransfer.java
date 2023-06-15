package com.example.ob_app.activity;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.annotation.SuppressLint;
import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.os.CountDownTimer;
import android.os.Handler;
import android.util.Log;
import android.view.View;
import android.widget.CheckBox;
import android.widget.ImageView;
import android.widget.Switch;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;
import androidx.constraintlayout.widget.ConstraintLayout;

import com.example.ob_app.FinishActivityManager;
import com.example.ob_app.MyExtKt;
import com.example.ob_app.NativeEvent;
import com.example.ob_app.R;
import com.example.ob_app.bean.WalletBean;
import com.example.ob_app.dialog.DialogBottomWallet;
import com.example.ob_app.dialog.DialogExitFrament;
import com.example.ob_app.dialog.DialogLoadingFragment;
import com.example.ob_app.dialog.DialogTanHao;
import com.example.ob_app.event.EventAutoCustom;
import com.example.ob_app.event.EventNativeToast;
import com.example.ob_app.event.EventRecycleOneClick;
import com.example.ob_app.event.EventRunWaterInfo;
import com.example.ob_app.event.EventTransferNow;
import com.example.ob_app.event.EventWalletList;
import com.example.ob_app.inter.TransferInterface;
import com.example.ob_app.presenter.ActivityTransferPresenter;
import com.example.ob_app.utils.BasicMessageUtil;
import com.example.ob_app.utils.MathUtils;
import com.example.ob_app.utils.MyToastUtils;
import com.example.ob_app.utils.PublicUtils;
import com.example.ob_app.view.CustomEditTextView;
import com.example.ob_app.view.ViewCustomKeyBoard;

import org.greenrobot.eventbus.EventBus;
import org.greenrobot.eventbus.Subscribe;
import org.greenrobot.eventbus.ThreadMode;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class ActivityTransfer extends AppCompatActivity implements View.OnClickListener, TransferInterface {
    private CheckBox switchCustom;
    private ImageView ivClose;
    private TextView tvName;
    private TextView tvTransferTutorial;
    private ImageView ivTanhao;
    private TextView tvTanhaoRemind;
    private ImageView ivFromPoint;
    private ImageView ivToPoint;
    private ImageView ivBackgroundThree;
    private TextView tvFrom;
    private TextView tvTo;
    private TextView tvFromWallet;
    private TextView tvToWallet;
    private TextView tvToWalletMoney;
    private ImageView ivToWalletIcon;
    private ImageView ivExchang;
    private ImageView ivSwitch;
    private TextView savemoney;
    private TextView money_icon;
    private ImageView ivDeleteMoney;
    private TextView tvNowMoney;
    private TextView tv_now_money_value;
    private String tv_now_money_value2 = "0.00";
    private TextView tvTransferNow;
    private TextView tvRecycling;
    private TextView tvKefu;
    private TextView tvKefuClick;
    private TextView tvAllMoney;
    private TextView tv_symbol;
    private ImageView ivFromWalletIcon;
    private View viewFromClick;
    private View viewToClick;
    private boolean isFromCenterToOthers = true;
    private ActivityTransferPresenter activityTransferPresenter;
    private WalletBean currentWallet = null;
    private Context context;
    private DialogBottomWallet dialogBottomWallet;
    private List<WalletBean> walletBeans = new ArrayList<>();
    private String centerWalletBalance = "0.00";//没有，
    private CountDownTimer countDownTimer;
    private ConstraintLayout conlayout_root;
    private long firstTime;
    private boolean isRecycleing = false;
    private String transferMoney;//转账金额
    private CustomEditTextView customEditTextView;
    private ViewCustomKeyBoard custom_keyboard;
    private ConstraintLayout constraint;
    private ImageView curtom_edittext_imageview;
    private int moveUpDistance;
    private String dian_ji_xuan_ze;
    private String qing_xuan_ze_qian_bao;
    private String yi_can_jia_chang_guan_huo_dong;
    private String bu_ke_zhuan_chu;
    private String hui_shou_zhong;
    private String qian_bao_zheng_zai_hui_shou_zhong;
    private String tishi;
    private String zhong_xin_qian_bao_he_ke_hui_shou_de_chang;
    private String wo_zhi_dao_le;
    private String yi_jian_hui_shou;
    private String shi_fou_guan_bi_zi_dong_dai_ru_jin_e;
    private String shi_fou_kai_qi_zi_dong_dai_ru_jin_e;
    private String zhong_xin_qian_bao;
    private String zhong_xin_qiao_bao_xian_you;
    private String xian_you;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        MyExtKt.applyNavigationBarColor(this, (R.color.color_151E25));
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_transfer);
        EventBus.getDefault().register(this);
        FinishActivityManager.getManager().addActivity(this);
        activityTransferPresenter = new ActivityTransferPresenter(this);
        context = this;
        ImageView iv_to_wallet_icon = findViewById(R.id.iv_to_wallet_icon);
        conlayout_root = findViewById(R.id.conlayout_root);
        switchCustom = findViewById(R.id.swich);
        ivClose = (ImageView) findViewById(R.id.iv_close);
        tvName = (TextView) findViewById(R.id.tv_name);
        tvTransferTutorial = (TextView) findViewById(R.id.tv_transfer_tutorial);
        ivTanhao = (ImageView) findViewById(R.id.iv_tanhao);
        tvTanhaoRemind = (TextView) findViewById(R.id.tv_tanhao_remind);
        ivFromPoint = (ImageView) findViewById(R.id.iv_from_point);
        ivToPoint = (ImageView) findViewById(R.id.iv_to_point);
        ivBackgroundThree = (ImageView) findViewById(R.id.iv_background_three);
        tvFrom = (TextView) findViewById(R.id.tv_from);
        tvTo = (TextView) findViewById(R.id.tv_to);
        tvFromWallet = (TextView) findViewById(R.id.tv_from_wallet);
        tvToWallet = (TextView) findViewById(R.id.tv_to_wallet);
        tvToWalletMoney = (TextView) findViewById(R.id.tv_to_wallet_money);
        ivToWalletIcon = (ImageView) findViewById(R.id.iv_to_wallet_icon);
        ivExchang = (ImageView) findViewById(R.id.iv_exchang);
        savemoney = (TextView) findViewById(R.id.savemoney);
        tv_symbol = (TextView) findViewById(R.id.tv_symbol);
        tv_symbol.setText(PublicUtils.getSymbol());

        money_icon = (TextView) findViewById(R.id.money_icon);
        money_icon.setText(BasicMessageUtil.moneySymbol);

        customEditTextView = findViewById(R.id.curtom_edittext);
        customEditTextView.editText.setHint(R.string.qing_shu_ru_zhuan_zhang_jin_e);
        ivDeleteMoney = (ImageView) findViewById(R.id.iv_delete_money);
        tvNowMoney = (TextView) findViewById(R.id.tv_now_money);
        tvTransferNow = (TextView) findViewById(R.id.tv_transfer_now);
        tvRecycling = (TextView) findViewById(R.id.tv_recycling);
        tvKefu = (TextView) findViewById(R.id.tv_kefu);
        tvKefuClick = (TextView) findViewById(R.id.tv_kefu_click);
        ivFromWalletIcon = (ImageView) findViewById(R.id.iv_from_wallet_icon);
        tvAllMoney = (TextView) findViewById(R.id.tv_all_money);
        tv_now_money_value = (TextView) findViewById(R.id.tv_now_money_value);
        curtom_edittext_imageview = findViewById(R.id.curtom_edittext_imageview);
        curtom_edittext_imageview.setOnClickListener(this);

        viewFromClick = findViewById(R.id.view_from_click);
        viewToClick = findViewById(R.id.view_to_click);
        ivSwitch = findViewById(R.id.iv_switch);
        custom_keyboard = findViewById(R.id.custom_keyboard);
        constraint = findViewById(R.id.constraint);
        iv_to_wallet_icon.setOnClickListener(this);
        ivClose.setOnClickListener(this);
        ivExchang.setOnClickListener(this);
        viewFromClick.setOnClickListener(this);
        viewToClick.setOnClickListener(this);
        ivSwitch.setOnClickListener(this);
        ivDeleteMoney.setOnClickListener(this);
        tvRecycling.setOnClickListener(this);
        tvTransferNow.setOnClickListener(this);
        tvAllMoney.setOnClickListener(this);
        ivTanhao.setOnClickListener(this);
        tvKefuClick.setOnClickListener(this);
        conlayout_root.setOnClickListener(this);
        custom_keyboard.setOnClickListener(this);
        changeFromToView();
        BasicMessageUtil.getInstance().getAutoTransferStatue();
        BasicMessageUtil.getInstance().asynWalletAmount();
        BasicMessageUtil.getInstance().getCustomerServiceUrl();

        addTextChange();
        activityTransferPresenter.getMoveUpDistance(custom_keyboard, tvRecycling);
        dian_ji_xuan_ze = getResources().getString(R.string.dian_ji_xuan_ze);
        qing_xuan_ze_qian_bao = getResources().getString(R.string.qing_xuan_ze_qian_bao);
        yi_can_jia_chang_guan_huo_dong = getResources().getString(R.string.yi_can_jia_chang_guan_huo_dong);
        bu_ke_zhuan_chu = getResources().getString(R.string.bu_ke_zhuan_chu);
        hui_shou_zhong = getResources().getString(R.string.hui_shou_zhong);
        qian_bao_zheng_zai_hui_shou_zhong = getResources().getString(R.string.qian_bao_zheng_zai_hui_shou_zhong);
        tishi = getResources().getString(R.string.tishi);
        zhong_xin_qian_bao_he_ke_hui_shou_de_chang = getResources().getString(R.string.zhong_xin_qian_bao_he_ke_hui_shou_de_chang);
        wo_zhi_dao_le = getResources().getString(R.string.wo_zhi_dao_le);
        yi_jian_hui_shou = getResources().getString(R.string.yi_jian_hui_shou);
        shi_fou_guan_bi_zi_dong_dai_ru_jin_e = getResources().getString(R.string.shi_fou_guan_bi_zi_dong_dai_ru_jin_e);
        shi_fou_kai_qi_zi_dong_dai_ru_jin_e = getResources().getString(R.string.shi_fou_kai_qi_zi_dong_dai_ru_jin_e);
        zhong_xin_qian_bao = getResources().getString(R.string.zhong_xin_qian_bao);
        zhong_xin_qiao_bao_xian_you = getResources().getString(R.string.zhong_xin_qiao_bao_xian_you);
        xian_you = getResources().getString(R.string.xian_you);
        xian_you = xian_you + " " + BasicMessageUtil.moneySymbol + " ";

        tvFromWallet.setText(zhong_xin_qian_bao);
        tvToWallet.setText(dian_ji_xuan_ze);
    }


    private void addTextChange() {
        customEditTextView.addOnTextChangeListener(new CustomEditTextView.OnTextChangeLitener() {
            @Override
            public void textChange(double money) {
                double doubleCenter = PublicUtils.parseDoubleRemoveComma(tv_now_money_value2);
                if (money > doubleCenter) {
                    String s = PublicUtils.formatTwoPoint(doubleCenter);
                    customEditTextView.setAmount(s + "");
                }
                double doubleAmount = customEditTextView.getDoubleAmount();

                if (doubleAmount > 0) {

                    tvTransferNow.setSelected(true);
                } else {
                    tvTransferNow.setSelected(false);
                }

            }
        });
        customEditTextView.addOnFocusChangeListener(new CustomEditTextView.OnFocusListener() {
            @Override
            public void foucusChange(boolean b) {
                if (b) {
                    /*键盘显示*/
                    custom_keyboard.show();
                    if (moveUpDistance > 0) {
                        ObjectAnimator translationY = ObjectAnimator.ofFloat(constraint, "translationY", 0, -(moveUpDistance)).setDuration(100);
                        translationY.addListener(new AnimatorListenerAdapter() {
                            @Override
                            public void onAnimationEnd(Animator animation) {
                                super.onAnimationEnd(animation);
                            }
                        });
                        translationY.start();
                    }

                } else {
                    /*键盘隐藏*/
                    custom_keyboard.dismiss();
                    if (moveUpDistance > 0) {
                        ObjectAnimator translationY = ObjectAnimator.ofFloat(constraint, "translationY", -(moveUpDistance), 0).setDuration(100);
                        translationY.addListener(new AnimatorListenerAdapter() {
                            @Override
                            public void onAnimationEnd(Animator animation) {
                                super.onAnimationEnd(animation);
                            }
                        });
                        translationY.start();
                    }
                }

            }
        });
        custom_keyboard.addListerner(new ViewCustomKeyBoard.OnClickListener() {
            @Override
            public void textChange(String number) {
                customEditTextView.insertText(number);
            }

            @Override
            public void delete() {
                customEditTextView.delete();
            }

            @Override
            public void keyboardClosed() {
                dismissKeyboard();
            }
        });

    }

    private void dismissKeyboard() {
        int visibility = custom_keyboard.getVisibility();
        if (visibility == View.VISIBLE) {
            customEditTextView.setEditTextFocus(false);
        }
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.conlayout_root) {
            dismissKeyboard();
        }

        if (id == R.id.iv_switch) {
            intervals(this, new intervalsTime() {
                @Override
                public void ok(Context context) {
                    SwitchAutoTransfer();
                }
            });

        } else if (id == R.id.iv_exchang) {
            if (currentWallet == null) {
                MyToastUtils.showShort(this, qing_xuan_ze_qian_bao);
                return;
            }
            if (isFromCenterToOthers && currentWallet.isActivity()) {
                MyToastUtils.showShort(this, yi_can_jia_chang_guan_huo_dong.replace("%@", currentWallet.getWalletName()));
                return;
            }

            isFromCenterToOthers = !isFromCenterToOthers;
            changeFromToView();
        } else if (id == R.id.view_from_click || id == R.id.view_to_click) {

            String type = "null";
            if (currentWallet != null) {
                type = currentWallet.getType();
            }
            for (int x = 0; x < walletBeans.size(); x++) {
                WalletBean walletBean = walletBeans.get(x);

                String type1 = walletBean.getType();
                if (type.equals(type1)) {
                    walletBean.setSelect(true);
                } else {
                    walletBean.setSelect(false);
                }
            }
            dismissKeyboard();
            showBootomWalletDialog();


        } else if (id == R.id.iv_delete_money) {
            customEditTextView.clean();
        } else if (id == R.id.iv_close) {
            finish();
        } else if (id == R.id.tv_recycling) {
            if (!isRecycleing) {
                isRecycleing = true;
                BasicMessageUtil.getInstance().recycleOnClick();
                tvRecycling.setText(hui_shou_zhong);
                tvRecycling.setSelected(true);
                tvRecycling.setBackgroundResource(R.mipmap.btnbg_1);
            }

        } else if (id == R.id.tv_transfer_now) {
            boolean selected = tvTransferNow.isSelected();
            if (selected) {
                if (currentWallet == null) {
                    MyToastUtils.showShort(context, qing_xuan_ze_qian_bao);
                    return;
                }
                if (isRecycleing) {
                    MyToastUtils.showShort(context, qian_bao_zheng_zai_hui_shou_zhong);
                    return;
                }

                curtom_edittext_imageview.setVisibility(View.VISIBLE);

                transferMoney = customEditTextView.getStringAmount();
                if (BasicMessageUtil.moneySymbol.equals(BasicMessageUtil.moneySymbolNV)) {
                    transferMoney = MathUtils.prettyDouble(MathUtils.multiply(Double.parseDouble(transferMoney), 1000.00));
                }

                if (isFromCenterToOthers) {
                    BasicMessageUtil.getInstance().transerNow("0", currentWallet.getType(), transferMoney);
                } else {
                    BasicMessageUtil.getInstance().transerNow(currentWallet.getType(), currentWallet.getType(), transferMoney);
                }


            }


        } else if (id == R.id.tv_all_money) {
            customEditTextView.setAmount(tv_now_money_value2);
        } else if (id == R.id.iv_tanhao) {
            DialogTanHao dialogTanHao = DialogTanHao.newInstance(tishi, zhong_xin_qian_bao_he_ke_hui_shou_de_chang, wo_zhi_dao_le,true);
            dialogTanHao.show(getSupportFragmentManager(), "");
        } else if (id == R.id.tv_kefu_click) {
            Intent intent = new Intent(this, ActivityPublicWebView.class);
            intent.putExtra("title", getString(R.string.zhuan_shu_ke_fu));
            intent.putExtra("url", BasicMessageUtil.customerServiceUrl);
            startActivity(intent);
        }

    }

    private void SwitchAutoTransfer() {
        boolean checked = switchCustom.isChecked();
        String content = "";
        if (checked) {
            content = shi_fou_guan_bi_zi_dong_dai_ru_jin_e;
        } else {
            content = shi_fou_kai_qi_zi_dong_dai_ru_jin_e;
        }
        DialogExitFrament dialogExitFrament = DialogExitFrament.newInstance("", content, "", "",true);
        dialogExitFrament.show(getSupportFragmentManager(), "");
        dialogExitFrament.setListerner(new DialogExitFrament.OnClickListener() {
            @Override
            public void cancel() {
            }

            @Override
            public void sure() {
                BasicMessageUtil.getInstance().changeAutoTransferStatue();
            }
        });
    }

    @SuppressLint("SetTextI18n")
    private void changeFromToView() {
        if (isFromCenterToOthers) {
            tvFromWallet.setText(zhong_xin_qian_bao);
            ivFromWalletIcon.setVisibility(View.GONE);
            if (currentWallet == null) {
                tvToWallet.setText(dian_ji_xuan_ze);
                tvToWallet.setTextColor(getColor(R.color.white_trans20));

            } else {
                tvToWallet.setText(currentWallet.getWalletName());
                tvToWallet.setTextColor(getColor(R.color.white));
            }
            if (currentWallet != null) {
                String money = PublicUtils.toVND(currentWallet.getMoney(), "");
                tvToWalletMoney.setText(xian_you + PublicUtils.fmtMicrometer(money) + PublicUtils.getSymbol());
            }
            ivToWalletIcon.setVisibility(View.VISIBLE);
            viewFromClick.setVisibility(View.VISIBLE);
            viewToClick.setVisibility(View.GONE);

        } else {
            if (currentWallet == null) {
                tvFromWallet.setText(dian_ji_xuan_ze);
                tvFromWallet.setTextColor(getColor(R.color.white_trans20));
            } else {
                tvFromWallet.setText(currentWallet.getWalletName());
                tvFromWallet.setTextColor(getColor(R.color.white));
            }
            ivFromWalletIcon.setVisibility(View.VISIBLE);
            String money = PublicUtils.toVND(centerWalletBalance, "");
            tvToWalletMoney.setText(xian_you + PublicUtils.fmtMicrometer(money) + PublicUtils.getSymbol());
            tvToWallet.setText(zhong_xin_qian_bao);
            ivToWalletIcon.setVisibility(View.GONE);
            viewFromClick.setVisibility(View.GONE);
            viewToClick.setVisibility(View.VISIBLE);

        }


        setCenterMonyeAndOtherWallertMoneyViewSwitch();
    }

    private void setCenterMonyeAndOtherWallertMoneyViewSwitch() {
        if (isFromCenterToOthers) {
            tvNowMoney.setText(zhong_xin_qiao_bao_xian_you);
            tv_now_money_value2 = PublicUtils.toVND(centerWalletBalance, "");
            tv_now_money_value.setText(PublicUtils.fmtMicrometer(tv_now_money_value2) + PublicUtils.getSymbol());
        } else {
            tvNowMoney.setText(currentWallet.getWalletName() + xian_you);

            tv_now_money_value2 = PublicUtils.toVND(currentWallet.getMoney(), "");
            tv_now_money_value.setText(PublicUtils.fmtMicrometer(tv_now_money_value2) + PublicUtils.getSymbol());
        }
        double inputMoney = customEditTextView.getDoubleAmount();
        double current = PublicUtils.parseDoubleRemoveComma(tv_now_money_value2);
        if (inputMoney > current) {
            customEditTextView.setAmount(tv_now_money_value2);
        }


    }


    @Subscribe(threadMode = ThreadMode.MAIN)//选择钱包
    public void onStringEvent(WalletBean event) {
        currentWallet = event;
        int visibility = tvToWalletMoney.getVisibility();
        if (visibility == View.GONE) {
            tvToWalletMoney.setVisibility(View.VISIBLE);
        }
        changeFromToView();

    }

    @Subscribe(threadMode = ThreadMode.MAIN)//自动转账功能
    public void onStringEvent(EventAutoCustom eventTransfer) {
        String event = eventTransfer.getEvent();
        if (event == null) {
            return;
        }
        Map<String, Object> arguments = eventTransfer.getArguments();
        if (arguments == null) {
            return;
        }
        switch (event) {
            case NativeEvent.eventIdentifierAutoTransfer:
                String type = (String) arguments.get("type");
                if ("getNative".equals(type)) {
                    String autoTransfer = (String) arguments.get("autoTransfer");
                    if ("true".equals(autoTransfer)) {
                        switchCustom.setChecked(true);
                    } else {
                        switchCustom.setChecked(false);
                    }
                }

                break;

        }
    }

    DialogLoadingFragment dialogLoadingFragment;

    @Subscribe(threadMode = ThreadMode.MAIN)//显示loading 隐藏loading
    public void onStringEvent(String s) {
        if (NativeEvent.show_native_loading.equals(s)) {
            dialogLoadingFragment = new DialogLoadingFragment();
            dialogLoadingFragment.show(getSupportFragmentManager(), "");

        } else if (NativeEvent.dismiss_native_loading.equals(s)) {
            if (dialogLoadingFragment != null) {
                dialogLoadingFragment.dismiss();
                dismissEditTextView();

            }
        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)//中心钱包 和钱包
    public void onStringEvent(EventWalletList eventWalletList) {
        Map<String, Object> arguments = eventWalletList.getArguments();
        //Log.e("TTTT",String.valueOf(arguments));

        if (arguments != null) {
            String type = (String) arguments.get("type");
            Object reload = arguments.get("reload");
            if (null == reload) {
                //不是点击刷新钱包 可能是转账 或者初始化数据
                customEditTextView.clean();
            } else {
                //刷新钱包
                if (dialogBottomWallet != null) {
                    dialogBottomWallet.finishRefreshAnimation();
                }
            }


            if ("getNative".equals(type)) {
                String centerWalletBalance = arguments.get("centerWalletBalance") + "";
                if (null != centerWalletBalance) {
                    String centerBlacne = "0.00";
                    try {
                        centerBlacne = Double.parseDouble(centerWalletBalance) + "";
                    } catch (NumberFormatException e) {
                        e.printStackTrace();
                    }

                    this.centerWalletBalance = PublicUtils.formatTwoPoint(Double.parseDouble(centerBlacne));
                }
                activityTransferPresenter.setWalletBeanList(arguments, "get");


            }
        }

    }

    DialogExitFrament dialogexitframent;

    @Subscribe(threadMode = ThreadMode.MAIN)//立即转账流程
    public void onStringEvent(EventTransferNow eventTransferNow) {
        Map<String, Object> arguments = eventTransferNow.getArguments();
        dismissKeyboard();
        if (arguments != null) {
            String type = (String) arguments.get("type");
            if ("getNative".equals(type)) {
                Object error = arguments.get("error");
                if (error != null) {
                    String e = (String) error;
                    MyToastUtils.showShort(this, e);
                    return;

                }
                Object ask = arguments.get("ask");
                if (null != ask) {
                    Map<String, String> askMap = (Map<String, String>) ask;
                    String titel = askMap.get("title");
                    String content = askMap.get("content");
                    if (dialogexitframent != null) {
                        dialogexitframent.dismiss();
                    }
                    dialogexitframent = DialogExitFrament.newInstance(titel, content, "", "",true);
                    dialogexitframent.show(getSupportFragmentManager(), "");
                    dialogexitframent.setListerner(new DialogExitFrament.OnClickListener() {
                        @Override
                        public void cancel() {

                        }

                        @Override
                        public void sure() {
                            BasicMessageUtil.getInstance().confirmActionTransfer();
                        }
                    });
                }


            }
        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)//一键回收
    public void onStringEvent(EventRecycleOneClick recycleOneClick) {
        Map<String, Object> arguments = recycleOneClick.getArguments();
        if (arguments != null) {
            String type = (String) arguments.get("type");
            if ("getNative".equals(type)) {
                tvRecycling.setText(yi_jian_hui_shou);
                tvRecycling.setSelected(false);
                tvRecycling.setBackgroundResource(R.mipmap.btnbg_1);
                isRecycleing = false;
                Object done = arguments.get("done");
                if (done != null) {
                    tvRecycling.setBackgroundResource(R.mipmap.btnbg);
                }
                Object error = arguments.get("error");
                if (error != null) {
                    tvRecycling.setBackgroundResource(R.mipmap.btnbg);
                }

            }
        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)// 配置錢包参加活动
    public void onStringEvent(EventRunWaterInfo eventTransferNow) {
        Map<String, Object> arguments = eventTransferNow.getArguments();
        if (arguments != null) {
            String gameCode = (String) arguments.get("gameCode");
            for (WalletBean walletBean : walletBeans) {
                String type = walletBean.getType();
                if (type.equals(gameCode)) {
                    String activityName = (String) arguments.get("activityName");
                    String billAmount = (String) arguments.get("billAmount");
                    String completeBillAmount = (String) arguments.get("completeBillAmount");
                    String percentage = (String) arguments.get("percentage");
                    walletBean.setActivityName(activityName);
                    walletBean.setNeedFlow(billAmount);
                    walletBean.setFinishFlow(completeBillAmount);
                    walletBean.setPer(percentage);
                }
            }
            if (dialogBottomWallet != null) {
                dialogBottomWallet.setData(walletBeans, isFromCenterToOthers);

            }

        }

    }

    @Subscribe(threadMode = ThreadMode.MAIN)// 配置錢包参加活动
    public void onStringEvent(EventNativeToast eventNativeToast) {
        String message = eventNativeToast.getMessage();
        MyToastUtils.showShort(this, message);
        dismissEditTextView();
        if ("转账成功".equals(message)) {
            dismissKeyboard();
        }
    }

    @Override
    protected void onDestroy() {
        EventBus.getDefault().unregister(this);
        activityTransferPresenter.onDestory();
        finishCountTime();
        super.onDestroy();
    }

    @Override
    public void onWalletListFinish(List<WalletBean> list, String tag) {
        if ("get".equals(tag)) {
            //获取钱包数据 弹框
            walletBeans = list;
            refreshSelectWalletMoney();
        }
        boolean noActivity = true;
        for (int x = 0; x < walletBeans.size(); x++) {
            WalletBean walletBean = walletBeans.get(x);
            boolean activity = walletBean.isActivity();
            if (activity) {
                noActivity = false;
                BasicMessageUtil.getInstance().getRunWaterDetails(walletBean.getType(), false);
            }
        }
        //没有参加活动 就在这里更新
        if (noActivity && dialogBottomWallet != null) {
            dialogBottomWallet.setData(walletBeans, isFromCenterToOthers);

        }
    }

    @Override
    public void onGetmoveUpDistance(int distance) {
        moveUpDistance = distance;

    }

    private void refreshSelectWalletMoney() {
        for (int x = 0; x < walletBeans.size(); x++) {
            WalletBean walletBean = walletBeans.get(x);
            if (currentWallet != null) {
                String type = currentWallet.getType();
                if (type.equals(walletBean.getType())) {
                    walletBean.setSelect(true);
                    currentWallet = walletBean;
                }
            }

        }


        if (isFromCenterToOthers) {
            tvNowMoney.setText(zhong_xin_qiao_bao_xian_you);

            tv_now_money_value2 = PublicUtils.toVND(centerWalletBalance, "");
            tv_now_money_value.setText(PublicUtils.fmtMicrometer(tv_now_money_value2) + PublicUtils.getSymbol());

        } else {
            if (currentWallet != null) {
                tvNowMoney.setText(currentWallet.getWalletName() + xian_you);

                tv_now_money_value2 = PublicUtils.toVND(currentWallet.getMoney(), "");
                tv_now_money_value.setText(PublicUtils.fmtMicrometer(tv_now_money_value2) + PublicUtils.getSymbol());
            }
        }

        if (isFromCenterToOthers) {
            if (currentWallet != null) {
                String money = PublicUtils.toVND(currentWallet.getMoney(), "");
                tvToWalletMoney.setText(xian_you + PublicUtils.fmtMicrometer(money) + PublicUtils.getSymbol());
            }
        } else {
            String money = PublicUtils.toVND(centerWalletBalance, "");
            tvToWalletMoney.setText(xian_you + PublicUtils.fmtMicrometer(money) + PublicUtils.getSymbol());
        }

    }

    private void showBootomWalletDialog() {
        dialogBottomWallet = new DialogBottomWallet(this);
        dialogBottomWallet.setData(walletBeans, isFromCenterToOthers);
        dialogBottomWallet.show(getSupportFragmentManager(), "flg");
        dialogBottomWallet.setListerner(new DialogBottomWallet.OnClickListener() {
            @Override
            public void onRefresh() {
                BasicMessageUtil.getInstance().getWalletList(true);
            }
        });
    }

    private void finishCountTime() {
        if (countDownTimer != null) {
            countDownTimer.onFinish();
            countDownTimer.cancel();
            countDownTimer = null;
        }
    }

    private long lastTime;
    private final static long INTERVALS = 2000;

    interface intervalsTime {
        void ok(Context context);
    }

    @Override
    public void onBackPressed() {
        int visibility = custom_keyboard.getVisibility();
        if (visibility == View.VISIBLE) {
            customEditTextView.setEditTextFocus(false);
        } else {
            super.onBackPressed();
        }
    }

    private void intervals(Context context, intervalsTime intervalsTime) {
        if (System.currentTimeMillis() - lastTime > INTERVALS) {
            lastTime = System.currentTimeMillis();
            if (intervalsTime != null) {
                intervalsTime.ok(context);
            }
        }

    }

    void dismissEditTextView() {
        new Handler().postDelayed(new Runnable() {
            @Override
            public void run() {
                curtom_edittext_imageview.setVisibility(View.GONE);
            }
        }, 2000);
    }

}
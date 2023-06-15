package com.example.ob_app.dialog;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;
import androidx.constraintlayout.widget.ConstraintLayout;

import com.example.ob_app.R;
import com.example.ob_app.utils.BasicMessageUtil;
import com.example.ob_app.utils.PublicUtils;
import com.example.ob_app.view.CustomEditTextView;
import com.example.ob_app.view.ViewCustomKeyBoard;

import org.jetbrains.annotations.NotNull;

public class DialogTransferAmount extends AppCompatDialogFragment implements View.OnClickListener {
    private OnClickListener onClickListener;
    private TextView tvCenter;
    private TextView tvMoney;
    private String tvMoney2;
    private TextView tv_icon;
    private TextView tv_center;
    private TextView tv_symbol;
    //    private EditText edMoney;
    private TextView tvIcon;
    private TextView tvAllMoney;
    private TextView tvButtonCancel;
    private TextView tvButtonSure;
    //    private String centerAmount;
    String beforeContent = "";
    int lastPosition = 0;
    private ConstraintLayout conlayout_root;
    private ViewCustomKeyBoard custom_keyboard;
    private CustomEditTextView customEditTextView;

    public DialogTransferAmount() {
    }

    public static DialogTransferAmount newInstance(String centerAmount) {
        DialogTransferAmount fragment = new DialogTransferAmount();
        Bundle bundle = new Bundle();
        bundle.putString("centerAmount", centerAmount);


        fragment.setArguments(bundle);
        return fragment;
    }

    @Override
    public void onCreate(@Nullable @org.jetbrains.annotations.Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
    }

    @Override
    public void onStart() {
        super.onStart();
        Window window = getDialog().getWindow();
        window.setLayout(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT);
        window.setBackgroundDrawableResource(R.color.black_tr10);
    }

    @Nullable
    @org.jetbrains.annotations.Nullable
    @Override
    public View onCreateView(@NonNull @NotNull LayoutInflater inflater, @Nullable @org.jetbrains.annotations.Nullable ViewGroup container, @Nullable @org.jetbrains.annotations.Nullable Bundle savedInstanceState) {
        View inflate = inflater.inflate(R.layout.dialog_transfer_amount, container, false);

        tvMoney = (TextView) inflate.findViewById(R.id.tv_money);
        tv_icon = (TextView) inflate.findViewById(R.id.tv_icon);
        tv_center = (TextView) inflate.findViewById(R.id.tv_center);
        tv_symbol = (TextView) inflate.findViewById(R.id.tv_symbol);

        tv_icon.setText(BasicMessageUtil.moneySymbol);
        tv_center.setText(getString(R.string.zhong_xin_qian_bao) + "(" + BasicMessageUtil.moneySymbol + ")");
        tv_symbol.setText(PublicUtils.getSymbol());

        tvAllMoney = (TextView) inflate.findViewById(R.id.tv_all_money);
        tvButtonCancel = (TextView) inflate.findViewById(R.id.tv_button_cancel);
        tvButtonSure = (TextView) inflate.findViewById(R.id.tv_button_sure);
        conlayout_root = inflate.findViewById(R.id.conlayout_root);
        custom_keyboard = inflate.findViewById(R.id.custom_keyboard);
        customEditTextView = inflate.findViewById(R.id.curtom_edittext);

        tvAllMoney.setOnClickListener(this);
        tvButtonCancel.setOnClickListener(this);
        tvButtonSure.setOnClickListener(this);
        conlayout_root.setOnClickListener(this);

        Bundle arguments = getArguments();
        String centerAmount = arguments.getString("centerAmount");
        String money = PublicUtils.toVND(centerAmount, "");
        tvMoney2 = PublicUtils.fmtMicrometer(money);
        tvMoney.setText(tvMoney2 + PublicUtils.getSymbol());

        addTextChange();

        return inflate;

    }

    private void addTextChange() {
        customEditTextView.addOnTextChangeListener(new CustomEditTextView.OnTextChangeLitener() {
            @Override
            public void textChange(double money) {
                double doubleCenter = PublicUtils.parseDoubleRemoveComma(tvMoney2);
                if (money > doubleCenter) {
                    String s = PublicUtils.formatTwoPoint(doubleCenter);
                    customEditTextView.setAmount(s + "");
                }
                double doubleAmount = customEditTextView.getDoubleAmount();

                if (doubleAmount > 0) {
                    tvButtonSure.setSelected(true);
                } else {
                    tvButtonSure.setSelected(false);
                }

            }
        });
        customEditTextView.addOnFocusChangeListener(new CustomEditTextView.OnFocusListener() {
            @Override
            public void foucusChange(boolean b) {
                if (b) {
                    /*键盘显示*/
                    custom_keyboard.setVisibility(View.VISIBLE);
                    ObjectAnimator translationY = ObjectAnimator.ofFloat(custom_keyboard, "translationY", 0, -10).setDuration(100);
                    translationY.addListener(new AnimatorListenerAdapter() {
                        @Override
                        public void onAnimationEnd(Animator animation) {
                            super.onAnimationEnd(animation);
                        }
                    });
                    translationY.start();

                } else {
                    /*键盘隐藏*/
                    custom_keyboard.setVisibility(View.GONE);
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

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_button_sure) {
            if (tvButtonSure.isSelected()) {
                if (onClickListener != null) {
                    onClickListener.sure(customEditTextView.getStringAmount());
                }
            }

        } else if (id == R.id.tv_button_cancel) {
            dismiss();
            if (onClickListener != null) {
                onClickListener.cancel();
            }
        } else if (id == R.id.tv_all_money) {
            customEditTextView.setAmount(tvMoney2);
        } else if (id == R.id.conlayout_root) {
            dismissKeyboard();
        }
    }

    private void dismissKeyboard() {
        int visibility = custom_keyboard.getVisibility();
        if (visibility == View.VISIBLE) {
            customEditTextView.setEditTextFocus(false);
        }
    }

    public interface OnClickListener {
        void cancel();

        void sure(String amount);

    }

    public void setListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

package com.example.ob_app.view;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.ObjectAnimator;
import android.content.Context;
import android.util.AttributeSet;
import android.view.View;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.constraintlayout.widget.ConstraintLayout;

import com.example.ob_app.R;

public class ViewCustomKeyBoard extends ConstraintLayout implements View.OnClickListener {
    private TextView tvOne;
    private TextView tvTwo;
    private TextView tvThree;
    private TextView tvFour;
    private TextView tvFive;
    private TextView tvSix;
    private TextView tvSeven;
    private TextView tvEight;
    private TextView tvNine;
    private TextView tvComma;
    private TextView tvZero;
    private TextView tvSure;
    private ImageView tvDelede;
    private ImageView tvKeyboardClosed;
    private OnClickListener onClickListener;

    public ViewCustomKeyBoard(Context context) {
        super(context);
        initView();
    }

    public ViewCustomKeyBoard(Context context, AttributeSet attrs) {
        super(context, attrs);
        initView();
    }

    public ViewCustomKeyBoard(Context context, AttributeSet attrs, int defStyleAttr) {
        super(context, attrs, defStyleAttr);
        initView();
    }

   void initView() {
       View view = View.inflate(getContext(), R.layout.view_custom_keyborad, this);
       setView(view);
    }

    private void setView(View root) {
        tvOne = (TextView) root.findViewById(R.id.tv_one);
        tvTwo = (TextView) root.findViewById(R.id.tv_two);
        tvThree = (TextView) root.findViewById(R.id.tv_three);
        tvFour = (TextView) root.findViewById(R.id.tv_four);
        tvFive = (TextView) root.findViewById(R.id.tv_five);
        tvSix = (TextView) root.findViewById(R.id.tv_six);
        tvSeven = (TextView) root.findViewById(R.id.tv_seven);
        tvEight = (TextView) root.findViewById(R.id.tv_eight);
        tvNine = (TextView) root.findViewById(R.id.tv_nine);
        tvComma = (TextView) root.findViewById(R.id.tv_comma);
        tvZero = (TextView) root.findViewById(R.id.tv_zero);
        tvDelede = (ImageView)root.findViewById(R.id.tv_delede);
        tvSure = (TextView)root.findViewById(R.id.tv_sure);
        tvKeyboardClosed = (ImageView)root.findViewById(R.id.tv_keyboard_closed);
        root.findViewById(R.id.constraint).setOnClickListener(this);

        tvOne.setOnClickListener(this);
        tvTwo.setOnClickListener(this);
        tvThree.setOnClickListener(this);
        tvFour.setOnClickListener(this);
        tvFive.setOnClickListener(this);
        tvSix.setOnClickListener(this);
        tvSeven.setOnClickListener(this);
        tvEight.setOnClickListener(this);
        tvNine.setOnClickListener(this);
        tvComma.setOnClickListener(this);
        tvZero.setOnClickListener(this);
        tvDelede.setOnClickListener(this);
        tvDelede.setOnClickListener(this);
        tvSure.setOnClickListener(this);
        tvKeyboardClosed.setOnClickListener(this);

    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_comma) {
            if (onClickListener != null) {
                onClickListener.textChange(".");
            }

        } else if (id == R.id.tv_delede) {
            if (onClickListener != null) {
                onClickListener.delete();
            }
        } else if (id == R.id.tv_sure) {

            if (onClickListener != null) {
                onClickListener.keyboardClosed();
            }
        } else if (id == R.id.tv_keyboard_closed){
            if (onClickListener != null) {
                onClickListener.keyboardClosed();
            }
        }else {
            if (view instanceof TextView) {
                TextView textView = (TextView) view;
                String s = textView.getText().toString();
                if (onClickListener != null) {
                    onClickListener.textChange(s);
                }
            }

        }
    }
    public void show() {
        setViewVisibility(true);
        ObjectAnimator translationY = ObjectAnimator.ofFloat(this, "translationY", 800,0).setDuration(100);
        translationY.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);
            }
        });
        translationY.start();
    }

    public void dismiss() {
        ObjectAnimator translationY = ObjectAnimator.ofFloat(this, "translationY", 0,600).setDuration(100);
        translationY.addListener(new AnimatorListenerAdapter() {
            @Override
            public void onAnimationEnd(Animator animation) {
                super.onAnimationEnd(animation);
                setViewVisibility(false);
            }
        });
        translationY.start();
    }

    private void setViewVisibility(boolean visibility) {
        if (visibility) {
            setVisibility(VISIBLE);
        }else {
            setVisibility(GONE);
        }

    }

    public interface OnClickListener {
        void textChange(String number);

        void delete();
        void keyboardClosed();
    }
    public void addListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

package com.example.ob_app.dialog;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;
import androidx.fragment.app.DialogFragment;

import com.example.ob_app.R;

import org.jetbrains.annotations.NotNull;

public class DialogTanHao extends AppCompatDialogFragment implements View.OnClickListener {
    private OnClickListener onClickListener;
    private ImageView ivBackground;
    private TextView tvTitle;
    private TextView tvContent;
    private TextView tvButtonSure;
    public DialogTanHao() {
    }
    public static DialogTanHao newInstance(String title,String content,String button,boolean isMoneyBzy) {
        DialogTanHao fragment = new DialogTanHao();
        Bundle bundle = new Bundle();
        bundle.putString("title", title);
        bundle.putString("content", content);
        bundle.putString("button", button);
        bundle.putBoolean("isMoneyBzy", isMoneyBzy);
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
        View inflate = inflater.inflate(R.layout.dialog_tanhao,container, false);
        ivBackground = (ImageView) inflate.findViewById(R.id.iv_background);
        tvTitle = (TextView) inflate.findViewById(R.id.tv_title);
        tvContent = (TextView) inflate.findViewById(R.id.tv_content);
        tvButtonSure = (TextView) inflate.findViewById(R.id.tv_button_sure);
        tvButtonSure.setOnClickListener(this);


        Bundle arguments = getArguments();
        String title = arguments.getString("title");
        String content = arguments.getString("content");
        String button = arguments.getString("button");
        boolean isMoneyBzy = arguments.getBoolean("isMoneyBzy");
        if(isMoneyBzy){
            tvButtonSure.setBackgroundResource(R.mipmap.btnbg_2);
        }
        tvTitle.setText(title);
        tvContent.setText(content);
        tvButtonSure.setText(button);

        return inflate;
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_button_sure) {
            dismiss();
            if (onClickListener != null) {
                onClickListener.sure();
            }
        }
    }

    public void upData() {

    }
    public interface OnClickListener {
        void sure();
    }
    public void setListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

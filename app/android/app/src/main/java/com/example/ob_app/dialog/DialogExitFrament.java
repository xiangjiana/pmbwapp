package com.example.ob_app.dialog;

import android.os.Bundle;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowManager;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;
import androidx.fragment.app.DialogFragment;

import com.example.ob_app.R;

import org.jetbrains.annotations.NotNull;

public class DialogExitFrament extends AppCompatDialogFragment implements View.OnClickListener {
    private OnClickListener onClickListener;
    public DialogExitFrament() {
    }
    public static DialogExitFrament newInstance(String title, String content, String cancel, String sure,boolean isMoneyBzy) {
        DialogExitFrament fragment = new DialogExitFrament();
        Bundle bundle = new Bundle();
        bundle.putString("title", title);
        bundle.putString("content", content);
        bundle.putString("cancel", cancel);
        bundle.putString("sure", sure);
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
        View inflate = inflater.inflate(R.layout.dialog_exit,container, false);
        TextView tv_title = inflate.findViewById(R.id.tv_title);
        TextView tv_content = inflate.findViewById(R.id.tv_content);
        TextView tv_button_cancel = inflate.findViewById(R.id.tv_button_cancel);
        TextView tv_button_sure = inflate.findViewById(R.id.tv_button_sure);
        tv_button_cancel.setOnClickListener(this);
        tv_button_sure.setOnClickListener(this);
        Bundle arguments = getArguments();
        String content = arguments.getString("content");
        String cancel = arguments.getString("cancel");
        String sure = arguments.getString("sure");
        String title = arguments.getString("title");
        boolean isMoneyBzy = arguments.getBoolean("isMoneyBzy");
        if(isMoneyBzy){
            tv_button_sure.setBackgroundResource(R.mipmap.btnbg_2);
        }

        String ni_que_ding_yao_li_kai_you_xi = getResources().getString(R.string.nin_que_ding_yao_li_kai_you_xi);
        String qu_xiao = getResources().getString(R.string.qu_xiao);
        String que_ren = getResources().getString(R.string.que_ren);
        String tishi = getResources().getString(R.string.tishi);

        tv_content.setText((content==null||content.isEmpty())?ni_que_ding_yao_li_kai_you_xi:content);
        tv_button_cancel.setText((cancel==null||cancel.isEmpty())?qu_xiao:cancel);
        tv_button_sure.setText((sure==null||sure.isEmpty())?que_ren:sure);
        tv_title.setText((title==null||title.isEmpty())?tishi:title);
        return inflate;
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_button_cancel) {
            if (onClickListener != null) {
                dismiss();
                onClickListener.cancel();
            }

        } else if (id == R.id.tv_button_sure) {
            if (onClickListener != null) {
                dismiss();
                onClickListener.sure();
            }
        }
    }

    public interface OnClickListener {
        void cancel();
        void sure();
    }
    public void setListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

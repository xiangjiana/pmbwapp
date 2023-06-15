package com.example.ob_app.dialog;

import android.content.DialogInterface;
import android.os.Bundle;
import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatDialogFragment;
import androidx.fragment.app.DialogFragment;

import com.example.ob_app.R;
import com.example.ob_app.utils.PublicUtils;

import org.jetbrains.annotations.NotNull;

public class DialogRunWaterFrament extends AppCompatDialogFragment implements View.OnClickListener {
    private OnClickListener onClickListener;
    private TextView tvValueActivityName;
    private TextView tvValueActivityFlow;
    private TextView tvValueActivityFinishFlow;
    private TextView tvValueActivityFinishFlowPer;
    private TextView tvButtonSure;
    public DialogRunWaterFrament() {
    }
    public static DialogRunWaterFrament newInstance(String activityName, String needFlow, String finishFlow, String finishPer) {
        DialogRunWaterFrament fragment = new DialogRunWaterFrament();
        Bundle bundle = new Bundle();
        bundle.putString("activityName", activityName);
        bundle.putString("needFlow", needFlow);
        bundle.putString("finishFlow", finishFlow);
        bundle.putString("finishPer", finishPer);

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
    @Override
    public void onDismiss( DialogInterface dialog) {
        super.onDismiss(dialog);
        if (onClickListener != null) {
            onClickListener.onDismiss();
        }
    }

    @Nullable
    @org.jetbrains.annotations.Nullable
    @Override
    public View onCreateView(@NonNull @NotNull LayoutInflater inflater, @Nullable @org.jetbrains.annotations.Nullable ViewGroup container, @Nullable @org.jetbrains.annotations.Nullable Bundle savedInstanceState) {
        View inflate = inflater.inflate(R.layout.dialog_run_water,container, false);


        tvValueActivityName = (TextView) inflate.findViewById(R.id.tv_value_activity_name);
        tvValueActivityFlow = (TextView) inflate.findViewById(R.id.tv_value_activity_flow);
        tvValueActivityFinishFlow = (TextView) inflate.findViewById(R.id.tv_value_activity_finish_flow);
        tvValueActivityFinishFlowPer = (TextView) inflate.findViewById(R.id.tv_value_activity_finish_flow_per);
        tvButtonSure = (TextView) inflate.findViewById(R.id.tv_button_sure);
        tvButtonSure.setOnClickListener(this);

        Bundle arguments = getArguments();
        String activityName = arguments.getString("activityName");
        String needFlow = arguments.getString("needFlow");
        String finishFlow = arguments.getString("finishFlow");
        String finishPer = arguments.getString("finishPer");


        upData(activityName,needFlow,finishFlow,finishPer);
        return inflate;
    }

    @Override
    public void onClick(View view) {
        int id = view.getId();
        if (id == R.id.tv_button_sure) {
            dismiss();
        }
    }

    public void upData(String activityName, String billAmount, String completeBillAmount, String percentage) {
        tvValueActivityName.setText(activityName);
        tvValueActivityFlow.setText(billAmount);
        tvValueActivityFinishFlow.setText(completeBillAmount);
        tvValueActivityFinishFlowPer.setText(PublicUtils.formatTwoPoint(Double.parseDouble(percentage))+"%");
    }


    public interface OnClickListener {
        void cancel();
        void sure();
        void onDismiss();
    }
    public void setListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

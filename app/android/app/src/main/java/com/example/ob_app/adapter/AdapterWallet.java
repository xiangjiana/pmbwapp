package com.example.ob_app.adapter;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.constraintlayout.widget.Group;
import androidx.recyclerview.widget.RecyclerView;

import com.bumptech.glide.Glide;
import com.example.ob_app.R;
import com.example.ob_app.bean.WalletBean;
import com.example.ob_app.utils.BasicMessageUtil;
import com.example.ob_app.utils.PublicUtils;

import org.jetbrains.annotations.NotNull;

import java.util.List;

public class AdapterWallet extends RecyclerView.Adapter<AdapterWallet.ViewHolder> {
    private List<WalletBean> mData ;
    private OnClickListener onClickListener;
    private boolean currentWalletIsFrom;
    private String wu_fa_zhuan_ru;
    private String wu_fa_zhuan_chu;
    private String can_yu_huo_dong_zhong_wu_fa_zhuan_chu;

    public AdapterWallet(boolean isCenter) {
        currentWalletIsFrom = isCenter;
    }


    public void updateData(List<WalletBean> data) {
        this.mData = data;
        notifyDataSetChanged();
    }
    @NonNull
    @NotNull
    @Override
    public AdapterWallet.ViewHolder onCreateViewHolder(@NonNull @NotNull ViewGroup parent, int viewType) {
        // 实例化展示的view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.adapter_wallet_item, parent, false);
         wu_fa_zhuan_ru= parent.getResources().getString(R.string.wu_fa_zhuan_ru);
         wu_fa_zhuan_chu= parent.getResources().getString(R.string.wu_fa_zhuan_chu);
         can_yu_huo_dong_zhong_wu_fa_zhuan_chu= parent.getResources().getString(R.string.can_yu_huo_dong_zhong_wu_fa_zhuan_chu);

        // 实例化viewholder
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull @NotNull AdapterWallet.ViewHolder holder, int position) {

        if (mData == null && mData.get(position) == null) {
            return;
        }
        WalletBean gameNameBean = mData.get(position);
        String walletName = gameNameBean.getWalletName();
        String money = gameNameBean.getMoney();
        String iconUrl = gameNameBean.getIconUrl();
        String walletIconUrl = gameNameBean.getWalletIconUrl();
        holder.tvWalletName.setText(walletName);
        holder.tvWalletMoney.setText(PublicUtils.toVND(money,"K"));
        Glide.with(holder.ivWalletIcon.getContext()).load(walletIconUrl).into(holder.ivWalletIcon);

        boolean select = gameNameBean.isSelect();
        if (select) {
            holder.ivWalletSelect.setVisibility(View.VISIBLE);
        } else {
            holder.ivWalletSelect.setVisibility(View.GONE);
        }

        setViewAlpha(1f, holder.ivWalletIcon,holder.tvWalletName, holder.tvWalletMoney,holder.tv_is_activity);
        boolean activity = gameNameBean.isActivity();

        if (gameNameBean.getMaintained()){
            //场馆维护
            holder.iv_open_activity.setVisibility(View.INVISIBLE);
            holder.tv_is_activity.setVisibility(View.VISIBLE);
            holder.tv_is_activity.setText(currentWalletIsFrom?wu_fa_zhuan_ru:wu_fa_zhuan_chu);
            holder.tvWalletMoney.setText("--");
            setViewAlpha(0.5f, holder.ivWalletIcon,holder.tvWalletName, holder.tvWalletMoney,holder.tv_is_activity);
        }else if (activity&&!currentWalletIsFrom&&gameNameBean.getEnabled()) {
            //参加活动
            String activityName = gameNameBean.getActivityName();
            String needFlow = gameNameBean.getNeedFlow();
            String finishFlow = gameNameBean.getFinishFlow();
            String per = gameNameBean.getPer();
            try {
                holder.tvValueActivityName.setText(activityName);
                if(BasicMessageUtil.moneySymbol.equals("₫")){
                    holder.tvValueActivityFlow.setText(PublicUtils.fmtMicrometer(PublicUtils.formatTwoPoint(Double.parseDouble(needFlow)/1000))+"K");
                    holder.tvValueActivityFinishFlow.setText(PublicUtils.fmtMicrometer(PublicUtils.formatTwoPoint(Double.parseDouble(finishFlow)/1000))+"K");
                }else{
                    holder.tvValueActivityFlow.setText(PublicUtils.fmtMicrometer(PublicUtils.formatTwoPoint(Double.parseDouble(needFlow))));
                    holder.tvValueActivityFinishFlow.setText(PublicUtils.fmtMicrometer(PublicUtils.formatTwoPoint(Double.parseDouble(finishFlow))));
                }
                holder.tvValueActivityFinishFlowPer.setText(PublicUtils.formatTwoPoint(Double.parseDouble(per))+"%");
            } catch (NumberFormatException e) {
                e.printStackTrace();
            }

            holder.iv_open_activity.setVisibility(View.VISIBLE);
            holder.tv_is_activity.setVisibility(View.VISIBLE);
            holder.tv_is_activity.setText(can_yu_huo_dong_zhong_wu_fa_zhuan_chu);
            setViewAlpha(0.5f, holder.ivWalletIcon,holder.tvWalletName, holder.tvWalletMoney,holder.tv_is_activity);
            holder.tv_is_activity.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    openActivity(holder);
                }
            });
            holder.iv_open_activity.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    openActivity(holder);
                }
            });
        }else {
            //没有参加活动
            holder.activity_group.setVisibility(View.GONE);
            holder.iv_open_activity.setVisibility(View.INVISIBLE);
            holder.tv_is_activity.setVisibility(View.GONE);
            holder.view_select.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    if (onClickListener != null) {
                        onClickListener.select(gameNameBean);
                    }
                }
            });
            
        }

    }

    private void setViewAlpha(float value,View... views) {
        for (int x = 0; x < views.length; x++) {
            View view = views[x];
            view.setAlpha(value);
        }
    }

    private void openActivity(@NotNull ViewHolder holder) {
        String tag = (String) holder.iv_open_activity.getTag();
        if (tag.equals("down")) {
            holder.iv_open_activity.setTag("up");
            holder.iv_open_activity.setImageResource(R.mipmap.home_more_top);
            holder.activity_group.setVisibility(View.VISIBLE);
        } else {
            holder.iv_open_activity.setTag("down");
            holder.iv_open_activity.setImageResource(R.mipmap.home_more_down);
            holder.activity_group.setVisibility(View.GONE);
        }
    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        private ImageView ivWalletIcon;
        private TextView tvWalletName;
        private TextView tvWalletMoney;
        private ImageView ivWalletSelect;
        private ImageView ivActivityBack;
        private TextView tvActivityName;
        private TextView tvActivityFlow;
        private TextView tvActivityFinishFlow;
        private TextView tvValueActivityName;
        private TextView tvValueActivityFlow;
        private TextView tvValueActivityFinishFlowPer;
        private TextView tvValueActivityFinishFlow;
        private TextView tv_is_activity;
        private ImageView iv_open_activity;
        private Group activity_group;
        private View view_select;
        public ViewHolder(@NonNull @NotNull View itemView) {
            super(itemView);
            ivWalletIcon = (ImageView) itemView.findViewById(R.id.iv_wallet_icon);
            tvWalletName = (TextView) itemView.findViewById(R.id.tv_wallet_name);
            tvWalletMoney = (TextView) itemView.findViewById(R.id.tv_wallet_money);
            ivWalletSelect = (ImageView) itemView.findViewById(R.id.iv_wallet_select);
            ivActivityBack = (ImageView)itemView. findViewById(R.id.iv_activity_back);
            tvActivityName = (TextView) itemView.findViewById(R.id.tv_activity_name);
            tvActivityFlow = (TextView) itemView.findViewById(R.id.tv_activity_flow);
            tvActivityFinishFlow = (TextView) itemView.findViewById(R.id.tv_activity_finish_flow);
            tvValueActivityName = (TextView) itemView.findViewById(R.id.tv_value_activity_name);
            tvValueActivityFlow = (TextView) itemView.findViewById(R.id.tv_value_activity_flow);
            tvValueActivityFinishFlowPer = (TextView) itemView.findViewById(R.id.tv_value_activity_finish_flow_per);
            tvValueActivityFinishFlow = (TextView) itemView.findViewById(R.id.tv_value_activity_finish_flow);
            tv_is_activity = (TextView) itemView.findViewById(R.id.tv_is_activity);
            iv_open_activity = (ImageView) itemView.findViewById(R.id.iv_open_activity);
            activity_group =  itemView.findViewById(R.id.activity_group);
            view_select =  itemView.findViewById(R.id.view_select);

        }
    }
    public interface OnClickListener {
        void select(WalletBean bean);
      
    }
    public void addListerner(OnClickListener listener) {
        onClickListener = listener;
    }
}

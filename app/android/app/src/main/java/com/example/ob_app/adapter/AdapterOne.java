package com.example.ob_app.adapter;

import android.util.Log;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.ob_app.R;
import com.example.ob_app.bean.GameNameBean;

import org.jetbrains.annotations.NotNull;

import java.util.ArrayList;
import java.util.List;

public class AdapterOne extends RecyclerView.Adapter<AdapterOne.ViewHolder> {
    private List<GameNameBean> mData;
    public AdapterOne(List<GameNameBean> data) {
        this.mData = data;
    }
    public void updateData(List<GameNameBean> data) {
        this.mData = data;
        notifyDataSetChanged();
    }
    @NonNull
    @NotNull
    @Override
    public AdapterOne.ViewHolder onCreateViewHolder(@NonNull @NotNull ViewGroup parent, int viewType) {
        // 实例化展示的view
        View v = LayoutInflater.from(parent.getContext()).inflate(R.layout.adapter_one_item, parent, false);
        // 实例化viewholder
        ViewHolder viewHolder = new ViewHolder(v);
        return viewHolder;
    }

    @Override
    public void onBindViewHolder(@NonNull @NotNull AdapterOne.ViewHolder holder, int position) {
        GameNameBean gameNameBean = mData.get(position);
        // 绑定数据
        if (mData != null && mData.get(position) != null) {
            holder.tv_name.setText(mData.get(position).getName());

        } else {
            holder.tv_name.setText("空");
        }
    }

    @Override
    public int getItemCount() {
        return mData == null ? 0 : mData.size();
    }

    public class ViewHolder extends RecyclerView.ViewHolder {
        TextView tv_name;
        public ViewHolder(@NonNull @NotNull View itemView) {
            super(itemView);
            tv_name = (TextView) itemView.findViewById(R.id.tv_name);
        }
    }
}

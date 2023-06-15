package com.example.ob_app.adapter

import android.view.View
import com.example.ob_app.R
import com.example.ob_app.bean.ApiGame3
import com.example.ob_app.databinding.ItemGame2Binding
import com.pacific.adapter.AdapterViewHolder
import com.pacific.adapter.SimpleRecyclerItem

class ItemGame2(val data: ApiGame3) : SimpleRecyclerItem() {

    init {
        isSelected = data.status == 1
    }

    override fun bind(holder: AdapterViewHolder) {
        var binding = holder.binding(ItemGame2Binding::bind)

        binding.txtName.text = data.gameName
        binding.txtStatus.isSelected = isSelected
        if (isSelected) {
            binding.txtStatus.setText(R.string.game_join)
        } else {
            binding.txtStatus.setText(R.string.maintain)
        }
        if (data.iconStatus > 0) {
            binding.imgFlag.visibility = View.VISIBLE
            when (data.iconStatus) {
                1 -> {
                    binding.imgFlag.setImageResource(R.mipmap.classification_recommend)
                }
                2 -> {
                    binding.imgFlag.setImageResource(R.mipmap.classification_hot)
                }
                3 -> {
                    binding.imgFlag.setImageResource(R.mipmap.classification_new_tour)
                }
            }
        } else {
            binding.imgFlag.visibility = View.INVISIBLE
        }

        holder.attachImageLoader(R.id.img_icon)
        holder.attachOnClickListener(R.id.item_game2)
    }

    override fun bindPayloads(holder: AdapterViewHolder, payloads: List<Any>?) {
        var binding = holder.binding(ItemGame2Binding::bind)
    }

    override fun getLayout(): Int = R.layout.item_game2
}
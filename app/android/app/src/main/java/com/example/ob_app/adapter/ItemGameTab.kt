package com.example.ob_app.adapter

import android.graphics.Color
import android.view.View
import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import androidx.core.graphics.drawable.DrawableCompat
import com.example.ob_app.R
import com.example.ob_app.bean.Datum
import com.example.ob_app.databinding.ItemGameTabBinding
import com.pacific.adapter.AdapterViewHolder
import com.pacific.adapter.SimpleRecyclerItem

class ItemGameTab(val data: Datum) : SimpleRecyclerItem() {

    @StringRes
    private val name: Int

    private val name2: String

    @DrawableRes
    val icon: Int = GameUtils.gameTypeIcon(data.venueTypeCode)

    val games: MutableList<ItemGame> = mutableListOf()

    init {
        isEnable = true
        if (data.venueList.isEmpty()) {
            name2 = ""
            name = GameUtils.gameTypeName(data.venueTypeCode)
        } else {
            name2 = data.venueList[0].venueTypeName
            name = 0
        }
    }

    override fun bind(holder: AdapterViewHolder) {
        var binding = holder.binding(ItemGameTabBinding::bind)
        if (name2.isEmpty()) {
            if (0 == name) {
                binding.tvName.text = name2
            } else {
                binding.tvName.setText(name)
            }
        } else {
            binding.tvName.text = name2
        }

        bindPayloads(holder, null)
        holder.attachOnClickListener(R.id.item_game_tab)
    }

    override fun bindPayloads(holder: AdapterViewHolder, payloads: List<Any>?) {
        var binding = holder.binding(ItemGameTabBinding::bind)
        binding.tvName.isSelected = isSelected
        binding.imgState.isSelected = isSelected
        binding.itemGameTabLayout.isSelected = isSelected
        if (isSelected) {
            if (isEnable) {
                binding.imgState.setImageResource(R.mipmap.game_cate_selected2)
            } else {
                binding.imgState.setImageResource(R.mipmap.game_cate_selected)
            }
            binding.imgState.visibility = View.VISIBLE;
        } else {
            binding.imgState.setImageResource(0)
            binding.imgState.visibility = View.GONE;
        }
        holder.itemView.context.getDrawable(icon)?.let {
            if (isSelected) {
                DrawableCompat.setTint(it, Color.parseColor("#3BC117"))
            } else {
                DrawableCompat.setTint(it, Color.parseColor("#99FFFFFF"))
            }
            binding.imgIcon.setImageDrawable(it)
        }
    }

    override fun getLayout(): Int = R.layout.item_game_tab
}
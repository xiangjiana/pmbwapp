package com.example.ob_app.adapter

import android.view.View
import com.example.ob_app.R
import com.example.ob_app.bean.Venue
import com.example.ob_app.databinding.ItemGameBinding
import com.pacific.adapter.AdapterViewHolder
import com.pacific.adapter.SimpleRecyclerItem

class ItemGame(val data: Venue) : SimpleRecyclerItem() {

    override fun bind(holder: AdapterViewHolder) {
        var binding = holder.binding(ItemGameBinding::bind)
        binding.tvName.text = data.venueName
        bindPayloads(holder, null)
        holder.attachImageLoader(R.id.img_icon)
        holder.attachOnClickListener(R.id.item_game)
    }

    override fun bindPayloads(holder: AdapterViewHolder, payloads: List<Any>?) {
        var binding = holder.binding(ItemGameBinding::bind)
        binding.viewBg.isSelected = isSelected
        if (data.status == 0 || data.status == 2) {
            binding.layoutState.visibility = View.VISIBLE
            binding.layoutGame.alpha = 0.6f
            if (data.status == 0) {
                binding.txtState.setText(R.string.in_stop)
            } else {
                binding.txtState.setText(R.string.in_maintain)
            }
        } else {
            binding.layoutGame.alpha = 1f
            binding.layoutState.visibility = View.INVISIBLE
            binding.txtState.text = ""
        }
    }

    override fun getLayout(): Int = R.layout.item_game
}
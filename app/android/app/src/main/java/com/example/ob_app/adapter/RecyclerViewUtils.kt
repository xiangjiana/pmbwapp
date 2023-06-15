package com.example.ob_app.adapter

import androidx.recyclerview.widget.DefaultItemAnimator
import androidx.recyclerview.widget.RecyclerView
import androidx.recyclerview.widget.SimpleItemAnimator

fun RecyclerView.disableDefaultItemAnimator() {
    this.itemAnimator?.let {
        if (it is DefaultItemAnimator) {
            it.supportsChangeAnimations = false
        } else if (it is SimpleItemAnimator) {
            it.supportsChangeAnimations = false
        }
    }
}

fun RecyclerView.keepItemViewVisible(position: Int, smoothScroll: Boolean) {
    if (position < 0) return
    this.layoutManager?.let {
        val itemView = it.findViewByPosition(position)
        if (itemView == null) {
            this.scrollToPosition(position)
            return
        }
        if (it.isViewPartiallyVisible(itemView, false, true)) {
            if (smoothScroll) {
                this.smoothScrollToPosition(position)
            } else {
                this.scrollToPosition(position)
            }
        }
    }
}
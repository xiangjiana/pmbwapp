package com.example.ob_app.adapter

import androidx.annotation.DrawableRes
import androidx.annotation.StringRes
import com.example.ob_app.R

object GameUtils {

    @StringRes
    fun gameTypeName(type: String): Int {
        return when (type.lowercase()) {
            "ty" -> R.string.ty
            "zr" -> R.string.zr
            "dj" -> R.string.dj
            "qp" -> R.string.qp
            "cp" -> R.string.cp
            "by" -> R.string.by
            "qkl" -> R.string.qkl
            "dy" -> R.string.dy
            else -> R.string.qkl
        }
    }

    @DrawableRes
    fun gameTypeIcon(type: String): Int {
        return when (type.lowercase()) {
            "ty" -> R.mipmap.b1_type_tiyu
            "zr" -> R.mipmap.b1_type_zhenren
            "dj" -> R.mipmap.b1_type_dianjin
            "qp" -> R.mipmap.b1_type_qipai
            "cp" -> R.mipmap.b1_type_caipiao
            "by" -> R.mipmap.b1_type_buyu
            "qkl" -> R.mipmap.b1_type_haxi
            "dy" -> R.mipmap.b1_type_dianzi
            else -> R.mipmap.b1_type_haxi
        }
    }

    @DrawableRes
    fun gameBackgroundIcon(type: String): Int {
        return when (type.lowercase()) {
            "ty" -> R.mipmap.cg_jump_tiyu
            "zr" -> R.mipmap.cg_jump_zhenren
            "dj" -> R.mipmap.cg_jump_dianjing
            "qp" -> R.mipmap.cg_jump_qipai
            "cp" -> R.mipmap.cg_jump_caipiao
            "by" -> R.mipmap.cg_jump_buyu
            "qkl" -> R.mipmap.cg_jump_qukuailian
            "dy" -> R.mipmap.cg_jump_dianzi
            else -> R.mipmap.cg_jump
        }
    }
}
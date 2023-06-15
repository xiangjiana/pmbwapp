package com.example.ob_app

import android.app.Activity
import android.content.Context
import android.os.Build
import androidx.annotation.ColorInt
import androidx.annotation.ColorRes

@ColorInt
@SuppressWarnings("deprecation")
fun Context.toColor(@ColorRes colorRes: Int): Int {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
        resources.getColor(colorRes, theme)
    } else {
        resources.getColor(colorRes)
    }
}

fun Activity.applyStatusBarColor(@ColorRes colorRes: Int) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        window.statusBarColor = this.toColor(colorRes)
    }
}

fun Activity.applyNavigationBarColor(@ColorRes colorRes: Int) {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
        window.navigationBarColor = this.toColor(colorRes)
    }
}
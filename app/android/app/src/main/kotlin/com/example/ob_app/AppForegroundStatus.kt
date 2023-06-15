package com.example.ob_app

import androidx.lifecycle.Lifecycle
import androidx.lifecycle.LifecycleObserver
import androidx.lifecycle.OnLifecycleEvent
import androidx.lifecycle.ProcessLifecycleOwner

object AppForegroundStatus {
  fun addListener(listener: AppForegroundStatusListener) {
    ProcessLifecycleOwner.get()
        .lifecycle
        .addObserver(
            object : LifecycleObserver {
              @OnLifecycleEvent(Lifecycle.Event.ON_START)
              fun onMoveToForeground() {
                listener.onMoveToForeground()
              }

              @OnLifecycleEvent(Lifecycle.Event.ON_STOP)
              fun onMoveToBackground() {
                listener.onMoveToBackground()
              }
            })
  }
}

interface AppForegroundStatusListener {
  fun onMoveToForeground()

  fun onMoveToBackground()
}

package com.example.ob_app

import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.os.Message
import android.content.Intent
import com.zing.zalo.zalosdk.oauth.ZaloSDK
import com.example.ob_app.event.EventNativeNavBarColor
import com.example.ob_app.utils.BasicMessageUtil
import com.example.ob_app.utils.DeviceIdUtil
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.SplashScreen
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant
import org.greenrobot.eventbus.EventBus
import org.greenrobot.eventbus.Subscribe
import org.greenrobot.eventbus.ThreadMode
import com.seewo.flutter.gt3_captcha.Gt3CaptchaPlugin

class MainActivity : FlutterActivity(), AppForegroundStatusListener {
    var lastOnBackgroundTime: Long? = null
    var isForeground = false
    private val handler: Handler =
        object : Handler(Looper.getMainLooper()) {
            override fun handleMessage(msg: Message) {
                super.handleMessage(msg)
                FinishActivityManager.getManager().exitApp()
            }
        }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        ZaloSDK.Instance.onActivityResult(this, requestCode, resultCode, data) // <-- Add this
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        AppForegroundStatus.addListener(this)
        val deviceId = DeviceIdUtil.getDeviceId(this);
        DeviceIdUtil.deviceId = deviceId;
        Gt3CaptchaPlugin.activity=this;

        EventBus.getDefault().register(this)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        BasicMessageUtil.getInstance()
            .messageChannelFunction(flutterEngine.dartExecutor.binaryMessenger, this)
    }

    override fun provideSplashScreen(): SplashScreen? {
        return null
    }

    override fun onMoveToForeground() {
        isForeground = true
        lastOnBackgroundTime = null
    }

    override fun onMoveToBackground() {
        isForeground = false
        pollStatus()
    }

    private fun pollStatus() {
        if (!isForeground) {
            handler.postDelayed(
                {
                    val current = System.currentTimeMillis()
                    if (lastOnBackgroundTime == null) {
                        lastOnBackgroundTime = current
                        pollStatus()
                        return@postDelayed
                    }
                    if (current - lastOnBackgroundTime!! > 2 * HOUR) {
                        val msg = Message.obtain()
                        handler.sendMessage(msg)
                    } else {
                        pollStatus()
                    }
                },
                1000 * 5
            )
        }
    }

    companion object {
        const val HOUR = 1000 * 3599
    }


    override fun onResume() {
        super.onResume()
    }


    override fun onStop() {
        super.onStop()
    }

    override fun onDestroy() {
        EventBus.getDefault().unregister(this)
        Gt3CaptchaPlugin.activity=null;
        super.onDestroy()
    }

    @Subscribe(threadMode = ThreadMode.MAIN)
    fun onEventNativeNavBarColor(event: EventNativeNavBarColor) {
        when {
            event.id > 0 -> this.applyNavigationBarColor(R.color.color_1D2933)
            event.id < 0 -> this.applyNavigationBarColor(R.color.color_151E25)
            else -> this.applyNavigationBarColor(R.color.color_01000000)
        }
    }
}

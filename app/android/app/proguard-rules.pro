-dontwarn com.tianyu.updater.**
-keep class com.tianyu.updater.**{*;}
-keep class com.tianyu.updater.entity.*
-keep class com.tianyu.updater.entity.DomainContainer$* {
    *;
}
-dontwarn com.tianyu.tyinstall.**
-keep class com.tianyu.tyinstall.**{*;}
-dontwarn com.skg.**
-keep class com.skg.**{*;}
-keep class org.videolan.libvlc.** { *; }
-dontwarn io.flutter.**
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }
#//eventbus 混淆 否则release版本崩溃
-keepattributes *Annotation*
-keepclassmembers class * {
    @org.greenrobot.eventbus.Subscribe <methods>;
}
-keep enum org.greenrobot.eventbus.ThreadMode { *; }

# And if you use AsyncExecutor:
-keepclassmembers class * extends org.greenrobot.eventbus.util.ThrowableFailureEvent {
    <init>(java.lang.Throwable);
}

-keep class com.zing.zalo.**{ *; }
-keep enum com.zing.zalo.**{ *; }
-keep interface com.zing.zalo.**{ *; }
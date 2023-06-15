import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:udid/udid.dart';

// 1-PC，2-IOS_APP，3-IOS_H5，4-Android_H5，5-Android_APP
//登录终端类型（6=H5客户端-ios，7=PC客户端，8=IOS客户端，9=ANDROID客户端，10=H5客户端-Android
class Types {
  static final int ios_h5 = 3;
  static final int android_h5 = 4;
  static final int android = 5;
  static final int ios = 2;
  static final int pc = 1;
}

// 设备类型请求头
class PlatFormInfoCustomize {
  PlatFormInfoCustomize({
    this.version,
    this.browserName,
    this.deviceId,
  });

  String? version;
  String? browserName;
  String? deviceId;
}

// 设备类型单例
class InstallDeviceType {
  static InstallDeviceType? _instance;
  static int? _deviceType;

  static int? get deviceType => _deviceType;

  static late PlatFormInfoCustomize _platFormInfo;

  static PlatFormInfoCustomize get platFormInfo => _platFormInfo;

  static void setDeviceId(String deviceId) {
    _platFormInfo.deviceId = deviceId;
  }

  static _internal() async {
    _deviceType = _generatePlatformCode();
    _platFormInfo = await _generatePlatformInfo();
  }

  static install() async {
    _instance = await _internal();
    return _instance;
  }

  //生成设备信息，需要写入请求头和参数内容
  static Future<PlatFormInfoCustomize> _generatePlatformInfo() async {
    String? deviceId;
    try {
      deviceId = await Udid.udid;
    } on MissingPluginException catch (_) {
      /// 'Failed to get platform version.';
    }
    if (GetPlatform.isWeb) {
      final webInfo = await DeviceInfoPlugin().webBrowserInfo;
      return PlatFormInfoCustomize(
        version: webInfo.appVersion,
        browserName: webInfo.browserName.toString(),
        deviceId: deviceId,
      );
    } else if (GetPlatform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      return PlatFormInfoCustomize(
          version: androidInfo.version.release,
          browserName: 'Android',
          deviceId: deviceId);
    } else if (GetPlatform.isIOS) {
      final iosDeviceInfo = await DeviceInfoPlugin().iosInfo;
      return PlatFormInfoCustomize(
          version: iosDeviceInfo.systemVersion,
          browserName: iosDeviceInfo.systemName,
          deviceId: deviceId);
    }
    throw Exception('当前平台不支持');
  }

  static int _generatePlatformCode() {
    if (GetPlatform.isWeb) {
      if (GetPlatform.isAndroid) {
        return Types.android_h5;
      }
      if (GetPlatform.isIOS) {
        return Types.ios_h5;
      }
    }
    if (GetPlatform.isIOS) return Types.ios;
    if (GetPlatform.isAndroid) return Types.android;

    // 适配包网app H5游戏内嵌 需要取手机版地址
    if (GetPlatform.isWindows) return Types.android_h5;
    if (GetPlatform.isMacOS) return Types.ios_h5;
    if (GetPlatform.isLinux) return Types.ios_h5;
    return Types.android;
  }
}

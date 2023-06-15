import 'dart:math';

import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'dart:async';

import 'package:repository/utils/sqlite_service.dart';

//参考来源 https://www.jianshu.com/p/7bfe42a0497a
// double value = await CacheManager.loadApplicationCache();
// String str = CacheManager.formatSize(value);
// print('获取app缓存: ' + str);

///网络数据缓存
//a) NetCache.selectTableAll();  //查询全部缓存
//b) NetCache.cacheCountAll();   //所有缓存条数
//c) NetCache.cacheCountUser(userid); //查询用户缓存的数量
//d) NetCache.cacheSizeAll();  //查询所有用户缓存的数量
//e) NetCache.cacheSizeUser(NetCache.userid);//返回该用户的缓存的大小
//f) NetCache.cacheDeleteAll();    //清除所有用户的缓存
//g) NetCache.cacheDeleteUser(NetCache.userid); //清除指定用户的缓存

class CacheManager {
  static RxString sizeDes = '-'.obs;
  static RxString _doneSize = '—'.obs;
  static int _pastSize = 0;

  static clearCache() async {
    try {
      showGaLoading();
      await CacheManager.clearApplicationCache();
      await currentCacheData();
    } finally {
      dismissLoading();
      showToast('setting_cleaned_up'.tr);
    }
  }

  ///更新缓存数据大小
  static Future<String> currentCacheData() async {
    try {
      if (await Permission.storage.isGranted) {
        int nowSize = await currentCacheSize();
        String str = CacheManager._formatSize(nowSize);
        _pastSize = _pastSize > 0 ? _pastSize - nowSize : nowSize;
        _doneSize.value = CacheManager._formatSize(_pastSize);
        sizeDes.value = str;
        sizeDes.refresh();
      }
      return Future.value(sizeDes.value);
    } catch (_) {
      return Future.value(sizeDes.value);
    }
  }

  static Future<int> currentCacheSize() async {
    // double spSize = await CacheManager._spApplicationCache();
    int netSize = await CacheManager._netApplicationCache();
    int localSize = await CacheManager._loadApplicationCache();
    return Future.value((netSize + localSize));
  }

  /// 获取网络缓存
  static Future<int> _netApplicationCache() async {
    try {
      int? sizeCache = await NetCache.cacheSizeUser(NetCache.userid);
      return Future.value(sizeCache ?? 0);
    } catch (_) {
      return Future.value(0);
    }
  }

  /// 获取缓存
  static Future<int> _loadApplicationCache() async {
    int total = 0;
    try {
      if (GetPlatform.isAndroid) {
        /// 获取文件夹  getApplicationDocumentsDirectory 此文件在ios不允许操作
        Directory directory = await getApplicationDocumentsDirectory();
        bool exist = await directory.exists();
        if (exist) {
          /// 获取缓存大小
          int value = _getTotalSizeOfFilesInDir(directory);
          total += value;
        }
      }

      /// 获取文件夹
      Directory directoryTmp = await getTemporaryDirectory();
      bool existTmp = await directoryTmp.exists();
      if (existTmp) {
        /// 获取缓存大小
        int value = _getTotalSizeOfFilesInDir(directoryTmp);
        total += value;
      }
      return Future.value(total);
    } catch (_) {
      return Future.value(total);
    }
  }

  /// 循环计算文件的大小（递归）
  static int _getTotalSizeOfFilesInDir(FileSystemEntity file) {
    try {
      if (file is File) {
        int length = file.lengthSync();
        return length;
      } else if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        int total = 0;
        if (children.length > 0) {
          children.forEach((element) async {
            total += _getTotalSizeOfFilesInDir(element);
          });
        }
        return total;
      } else {
        return 0;
      }
    } catch (_) {
      return 0;
    }
  }

  /// 缓存大小格式转换
  static String _formatSize(int bytes, {int decimals = 2}) {
    if (bytes <= 0.0) {
      return '0.00 KB';
    }
    const suffixes = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"];
    var i = (log(bytes) / log(1024)).floor();
    return ((bytes / pow(1024, i)).toStringAsFixed(decimals)) +
        ' ' +
        suffixes[i];
  }

  /// 删除缓存 getApplicationDocumentsDirectory Android 对应 AppData IOS 对应Documents
  static Future<void> clearApplicationCache() async {
    try {
      if (GetPlatform.isAndroid) {
        Directory directory = await getApplicationDocumentsDirectory();
        bool exist = await directory.exists();
        if (exist) {
          await deleteDirectory(directory);
        }
      }

      ///删除本地缓存目录 cache 目录
      Directory directoryTmp = await getTemporaryDirectory();
      bool existTme = await directoryTmp.exists();
      if (existTme) {
        await deleteDirectory(directoryTmp);
      }
      //清除网络缓存
      NetCache.cacheDeleteUser(NetCache.userid);
      // SpUtil.getSp().clear();
    } catch (e) {}
  }

  /// 递归方式删除目录
  static Future<void> deleteDirectory(FileSystemEntity file) async {
    try {
      if (file is Directory) {
        final List<FileSystemEntity> children = file.listSync();
        for (final FileSystemEntity child in children) {
          await deleteDirectory(child);
        }
      }
      await file.delete();
    } catch (e) {}
  }
}

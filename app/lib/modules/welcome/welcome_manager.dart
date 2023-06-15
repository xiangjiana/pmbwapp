import 'dart:io';

import 'package:config/config.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sp_util/sp_util.dart';

class WelcomeManager {
  static final configApi = Get.find<ConfigApi>();

  static int errorCount = 0;
  static bool isDownloading = false;
  static List<bool> statePage = [];
  static bool first = true;

  static init() {
    errorCount = 0;
    isDownloading = false;
  }

  static void getConfigStartPagePost() async {
    try {
      final resp = await configApi.startPage();
      if (resp.isNotEmpty) {
        final splashData = resp[0];
        SpUtil.putString('ob_splash_image_url', splashData.pictureUrl);
        String localFileName = SpUtil.getString('ob_splash_file_path') ?? '';
        String newFileName = '/splash/${getImgFileName(splashData.pictureUrl)}';
        if (localFileName != newFileName) {
          download(splashData.pictureUrl);
        }
      } else {
        SpUtil.remove('ob_splash_image_url');
        SpUtil.remove('ob_splash_file_path');
      }
    } catch (e) {}
  }

  static download(String imageUrl) async {
    if (imageUrl.isEmpty) return;
    if (isDownloading) return;
    if (errorCount > 3) return;
    try {
      Directory? cacheDirectory = Platform.isIOS
          ? await getApplicationDocumentsDirectory()
          : await getExternalStorageDirectory();
      bool exist = await cacheDirectory!.exists();

      if (exist) {
        String dirPath = cacheDirectory.path + "/splash";
        Directory fileDirectory = Directory(dirPath);
        if (!fileDirectory.existsSync()) {
          fileDirectory.createSync();
        }
        String filePath = '/splash/${getImgFileName(imageUrl)}';
        String savePath = '${cacheDirectory.path}' + filePath;
        await Dio().download(
          imageUrl,
          savePath,
          onReceiveProgress: (int count, int total) {
            if (count >= total) {
              SpUtil.putString('ob_splash_file_path', filePath);
              isDownloading = false;
            } else {
              isDownloading = true;
            }
          },
        ).catchError((e) {
          errorCount++;
          if (errorCount <= 3) {
            download(imageUrl);
          }
        });
      }
    } catch (e) {
      errorCount++;
      if (errorCount <= 3) {
        download(imageUrl);
      }
    }
  }

  static String getImgFileName(String imageUrl) {
    List splitArr = imageUrl.split('/');
    return splitArr[splitArr.length - 1];
  }

  static Future<String> getSplashFullPath() async {
    Directory? cacheDirectory = Platform.isIOS
        ? await getApplicationDocumentsDirectory()
        : await getExternalStorageDirectory();
    if (cacheDirectory != null) {
      bool exist = await cacheDirectory.exists();
      if (exist) {
        String filePath = SpUtil.getString('ob_splash_file_path') ?? '';
        if (filePath.isNotEmpty) {
          return Future.value('${cacheDirectory.path}' + filePath);
        }
      }
    }
    return Future.value('');
  }
}

import 'dart:async';
import 'dart:io';
import 'dart:math';

import 'package:app_installer/app_installer.dart';
import 'package:config/config.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:models/models.dart';
import 'package:ob_com_base/ob_com_base.dart'
    hide Assets, FontFamily, ColorName;
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_matrix_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:get_version/get_version.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide UpdateDialog;
import 'package:params/params.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repository/gen/api/domainName_apis.dart';
import 'package:sprintf/sprintf.dart';

class UpdateUtil {
  static final configApi = Get.find<ConfigApi>();

  static Future<AppVersionConfigResp> postConfigAppVersionCheck() async {
    int subType = 0;
    if (Store.clientId == Store.clientIdMB) {
      // 美播
      subType = 4;
    } else if (Store.clientId == Store.clientIdDJ) {
      // 电竞
      subType = 5;
    } else if (Store.clientId == Store.clientIdFYB) {
      // 富盈宝
      subType = 6;
    }
    try {
      final res = await configApi.appVersionCheck(AppVersionConfigParam(
        clientType: GetPlatform.isAndroid ? 0 : 1,
        subType: subType,
      ));
      return Future.value(res);
    } catch (e) {
      return Future.error(e);
    }
  }

  ///检查 Version版本检测  flag 表示，点击有无提示
  static Future<void> checkUpdateVersion(
      {bool? flag = false, bool? weakerIsShowDownDailog = true}) async {
    try {
      if (kIsWeb) {
        return;
      }
      ConnectivityResult isConnected = await Connectivity().checkConnectivity();
      if (isConnected == ConnectivityResult.none) {
        showToast('please_check_if_the_network_is_normal'.tr);
        return;
      }
      final res = await getVersionAndCheckIfHasNew();
      if (res != null) {
        if (weakerIsShowDownDailog == false) {
          if (res.updateType == 0) {
            //如果是若更新 并且在首页就不弹框，
            return;
          }
        }

        upgradeFunction(res);
      } else {
        if (flag == true) showToast('it_s_the_latest_version'.tr);
      }
    } catch (_) {
      if (flag == true) showToast('no_new_version'.tr);
    }
  }

  ///三段比较两版本号  大版本.小版本.补丁版本
  static Future<AppVersionConfigResp?> getVersionAndCheckIfHasNew() async {
    final res = await postConfigAppVersionCheck();
    final oldVersion = await GetVersion.projectVersion;
    final newVersion = res.version;
    if (newVersion.isEmpty || oldVersion.isEmpty) return null;
    final newList = newVersion.split('.');
    final oldList = oldVersion.split('.');

    int n1 = newList.length;
    int n2 = oldList.length;
    for (int i = 0; i < max(n1, n2); i++) {
      int num1 = i < n1 ? int.parse(newList[i]) : 0;
      int num2 = i < n2 ? int.parse(oldList[i]) : 0;
      if (num1 != num2) {
        return num1 < num2 ? null : res;
      }
    }
    return null;
  }

  static void upgradeFunction(AppVersionConfigResp data) {
    Store.isUpgradeDialogShow = true;
    eventBus.fire(FloatBonusEvent(show: false));
    showUpdateDialogWidget(
      data.title,
      data.content,
      data.version,
      data.updateType == 1, //1 强更新
      data.downloadUrl,
    );
  }

  ///下载apk
  static Future<String> downloadApk(
    ProgressController progressController,
    String url,
    File file, {
    dio.CancelToken? cancelToken,
  }) async {
    try {
      DomainNameApis.heartbeat();

      //如果中止下载dio会认为cancel是错误，则报出异常
      dio.Response response = await dio.Dio().download(
        url,
        file.path,
        cancelToken: cancelToken,
        options: dio.Options(receiveTimeout: const Duration(minutes: 5), sendTimeout: const Duration(minutes: 5)),
        onReceiveProgress: (int count, int total) {
          progressController.value = count / total;
        },
        deleteOnError: true,
      );
      if (response.statusCode == 200) {
        progressController.value = 1;
        return file.path;
      }
      return "";
    } on DioError catch (_) {
      return "";
    }
  }

  static DateTime? _lastClickTime;

  /// 显示弹框
  static void showUpdateDialogWidget(
    String title,
    String content,
    String version,
    bool isDismissible,
    String downloadUrl,
  ) {
    ProgressController progressController = ProgressController(0);
    String path = "";
    dio.CancelToken cancelToken = dio.CancelToken();
    if (content.isNotEmpty) content = content.replaceAll("\n", r"<br>");
    GlobalKey globalKey = GlobalKey();
    final child = UpdateDialog(
      key: globalKey,
      controller: progressController,
      isDismissible: isDismissible,
      onClose: () async {
        if (!isDismissible) {
          cancelToken.cancel('cancelled');
          Store.isUpgradeDialogShow = false;
          Get.back();
        }
      },
      onDownload: () async {
        if (GetPlatform.isIOS) {
          WebUtil.openInBrowser(downloadUrl);
        } else if (GetPlatform.isAndroid) {
          showLoading();
          Directory? directory = await getExternalStorageDirectory();
          final time = DateTime.now().millisecondsSinceEpoch;
          File file = File(directory!.path + '/' + time.toString() + ".apk");
          path = file.path;
          if (file.existsSync()) {
            file.deleteSync();
          }
          dismissLoading();
          goDownloadApk(progressController, downloadUrl, file, globalKey,
              cancelToken: cancelToken);
        }
        Store.isUpgradeDialogShow = false;
      },
      onInstall: () {
        ///下载完了  准备升级
        if (path != "") {
          AppInstaller.installApk(path);
        } else {
          progressController.value = 0;
          showToast("download_failed_please_try_again".tr);
        }
      },
      progressBuilder: (BuildContext context, double progress) {
        final int roundProgress = (progress * 100).round();
        if (roundProgress == 0) {
          return Text('download_immediately'.tr);
        } else if (roundProgress >= 100) {
          return Text('upgrade_immediately'.tr);
        } else {
          return Text(sprintf('downloading'.tr + '%s%', [roundProgress]));
        }
      },
      content: UpdateDialogContent(content: content, title: title),
      version: UpdateDialogText(version: version),
    );

    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (_) {
        // 只处理Android 平台 ios避免提示消息
        if (GetPlatform.isAndroid && !kIsWeb) {
          return WillPopScope(
            child: child,
            onWillPop: () async {
              //强更新退出应用，弱更新禁止关闭
              if (_lastClickTime == null ||
                  DateTime.now().difference(_lastClickTime!) >
                      const Duration(seconds: 3)) {
                //两次点击间隔超过1秒则重新计时
                _lastClickTime = DateTime.now();
                showToast('operate_again_to_exit_the_app'.tr);
                return false;
              }
              exit(0);
            },
          );
        }
        return child;
      },
    );
  }

  static Future<String> goDownloadApk(
    ProgressController progressController,
    String downloadUrl,
    File file,
    GlobalKey globalKey, {
    dio.CancelToken? cancelToken,
  }) async {
    String path = await downloadApk(
      progressController,
      downloadUrl,
      file,
      cancelToken: cancelToken,
    );
    if (path == "") {
      (globalKey.currentState as UpdateDialogState)
          .setNeedTipPleaseTryAgain(true, () async {
        path = await goDownloadApk(
          progressController,
          downloadUrl,
          file,
          globalKey,
          cancelToken: cancelToken,
        );
      });
      showToast("download_failed_please_try_again".tr);
    } else {
      AppInstaller.installApk(path);
      showToast("download_successful".tr);
    }
    return path;
  }
}

class UpdateDialogText extends StatelessWidget {
  final String version;

  const UpdateDialogText({
    Key? key,
    required this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      'V$version',
      style: const TextStyle(
        decoration: TextDecoration.none,
        color: Colors.white,
        fontSize: 16,
      ),
    );
  }
}

class UpdateDialogContent extends StatelessWidget {
  final String content;
  final String title;

  const UpdateDialogContent({
    Key? key,
    required this.content,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxHeight: 300.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                title,
                style: const TextStyle(
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 7.w),
              Html(
                data: content,
                shrinkToFit: true,
                defaultTextStyle: TextStyle(
                  decoration: TextDecoration.none,
                  height: 1.4,
                  color: Colors.white.withOpacity(0.6),
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

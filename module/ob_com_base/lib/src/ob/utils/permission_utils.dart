import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/src/ob/widget/ob_dialog_util.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:sprintf/sprintf.dart';

import '../widget/obase_dialog.dart';
import 'overlay_extension.dart';

class PermissionUtils {
  static Future requestCameraPermission({
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    try {
      String error = "camera".tr;
      List<Permission> apply = await checkPermission([Permission.camera]);
      if (apply.isNotEmpty) {
        PermissionStatus status = await requestPermission(apply);
        switch (status) {
          case PermissionStatus.granted: //允许状态
          case PermissionStatus.limited: //有限的
            onSuccess ?? Get.back(result: PhotoTaker.CAMERA);
            break;
          case PermissionStatus.denied: //拒绝状态
          case PermissionStatus.restricted: //受限制的
          case PermissionStatus.permanentlyDenied: //永久拒绝
          default:
            onFailed ?? warnTxt(error);
        }
      } else {
        onSuccess ?? Get.back(result: PhotoTaker.CAMERA);
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  static Future requestStoragePermission() async {
    try {
      await [Permission.storage].request();
      bool isStorage = await Permission.storage.isDenied;
      if (!isStorage) {
        return Future.value(true);
      } else {
        // 已有权限开始保存
        _requestPopUps(
          str: sprintf(
            "denied_the_necessary_permission_to_apply".tr,
            [isStorage ? "storage_permission".tr : ""],
          ),
        );
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  static Future requestStorageAndPhotosPermission({
    List<Permission>? applyFor,
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    try {
      List<Permission> list = applyFor ?? [];
      if (list.isEmpty) {
        if (GetPlatform.isAndroid) {
          list = [Permission.storage];
        } else {
          list = [Permission.photos, Permission.photosAddOnly];
        }
      }

      String error = sprintf('please_turn_on_storage_permission'.tr, [
        GetPlatform.isAndroid ? 'storage_permission'.tr : 'photos_permission'.tr
      ]);
      List<Permission> apply = await checkPermission(list);
      if (apply.isNotEmpty) {
        PermissionStatus status = await requestPermission(apply);
        switch (status) {
          case PermissionStatus.granted: //允许状态
          case PermissionStatus.limited: //有限的
            onSuccess != null
                ? onSuccess.call()
                : Get.back(result: PhotoTaker.GALLERY);
            break;
          case PermissionStatus.denied: //拒绝状态
          case PermissionStatus.restricted: //受限制的
          case PermissionStatus.permanentlyDenied: //永久拒绝
          default:
            onFailed != null ? onFailed.call() : warnTxt(error);
        }
      } else {
        onSuccess ?? Get.back(result: PhotoTaker.GALLERY);
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  static warnTxt(String hint) {
    _requestPopUps(
      str: sprintf("denied_the_necessary_permission_to_apply".tr, [hint]),
    );
  }

  //返回不通过的权限
  static Future<List<Permission>> checkPermission(
      List<Permission> permissionList) async {
    ///一个新待申请权限列表
    List<Permission> newPermissionList = [];
    ///遍历当前权限申请列表
    for (Permission permission in permissionList) {
      PermissionStatus status = await permission.status;
      ///如果不是允许状态就添加到新的申请列表中
      if (!status.isGranted) {
        newPermissionList.add(permission);
      }
    }
    return newPermissionList;
  }

  static Future<bool> isCheckPermission({List<Permission>? list}) async {
    try {
      if (list == null) return Future.value(false);
      List<Permission> apply = await checkPermission(list);
      if (apply.isNotEmpty) {
        return Future.value(false);
      } else {
        return Future.value(true);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  ///只打开相册权限
  static Future<bool> requestPhotosPermission() async {
    if (kIsWeb) return Future.value(true);

    try {
      List<Permission> list = [];
      if (GetPlatform.isAndroid) {
        list = [Permission.storage];
      } else {
        list = [Permission.photos];
      }
      List<Permission> apply = await checkPermission(list);
      if (apply.isNotEmpty) {
        PermissionStatus status = await requestPermission(apply);
        switch (status) {
          case PermissionStatus.granted: //允许状态
          case PermissionStatus.limited:
            return Future.value(true);
          case PermissionStatus.denied: //拒绝状态
          case PermissionStatus.restricted: //受限制的
          case PermissionStatus.permanentlyDenied: //永久拒绝
          default:
            {
              _requestPopUps(str: "do_you_want_to_apply_again".tr);
              return Future.value(false);
            }
        }
      } else {
        return Future.value(true);
      }
    } catch (e) {
      return Future.value(false);
    }
  }

  static void settPhotosPermission({
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
  }) async {
    List<Permission> list = [];
    if (GetPlatform.isAndroid) {
      list = [Permission.storage];
    } else {
      list = [Permission.photos];
    }
    String error = GetPlatform.isAndroid
        ? "storage_permission".tr
        : "photos_permission".tr;
    List<Permission> apply = await checkPermission(list);
    if (apply.isNotEmpty) {
      PermissionStatus status = await requestPermission(apply);
      switch (status) {
        case PermissionStatus.granted: //允许状态
        case PermissionStatus.limited: //有限的
          onSuccess ?? Get.back(result: PhotoTaker.GALLERY);
          break;
        case PermissionStatus.denied: //拒绝状态
        case PermissionStatus.restricted: //受限制的
        case PermissionStatus.permanentlyDenied: //永久拒绝
        default:
          onFailed ?? warnTxt(error);
      }
    } else {
      onSuccess ?? Get.back(result: PhotoTaker.GALLERY);
    }
  }

  ///初始化多权限申请
  static Future<bool> requestMultiPermission() async {
    final completer = Completer<bool>();
    List<Permission> permissionList = [
      Permission.storage,
    ];

    PermissionUtils.check(
      permissionList,
      onSuccess: () {
        completer.complete(true);
      },
      onFailed: () {
        completer.completeError(false);
      },
    );
    return completer.future;
  }

  ///封装
  static VoidCallback defaultCall = () {};

  static void check(
    List<Permission> permissionList, {
    String errMsg = '',
    VoidCallback? onSuccess,
    VoidCallback? onFailed,
    VoidCallback? onOpenSetting,
  }) async {
    try {
      bool flag = true;
      for (var value in permissionList) {
        var status = await value.status;
        if (!status.isGranted) {
          flag = false;
          break;
        }
      }
      if (!flag) {
        PermissionStatus permissionStatus =
            await requestPermission(permissionList);
        if (permissionStatus.isGranted) {
          onSuccess != null ? onSuccess() : defaultCall();
        } else if (permissionStatus.isDenied) {
          onFailed != null ? onFailed() : defaultCall();
        } else if (permissionStatus.isPermanentlyDenied) {
          onOpenSetting != null ? onOpenSetting() : defaultCall();
        } else if (permissionStatus.isRestricted) {
          //IOS 单独处理
          onOpenSetting != null ? onOpenSetting() : defaultCall();
        } else if (permissionStatus.isLimited) {
          //IOS 单独处理
          onOpenSetting != null ? onOpenSetting() : defaultCall();
        }
      }
    } catch (e) {
      showToast(e.toString());
    }
  }

  static Future<PermissionStatus> requestPermission(
      List<Permission> permissionList) async {
    PermissionStatus currentPermissionStatus = PermissionStatus.granted;
    try {
      Map<Permission, PermissionStatus> statuses =
          await permissionList.request();
      statuses.forEach((key, value) {
        if (!value.isGranted) {
          currentPermissionStatus = value;
          return;
        }
      });
      return currentPermissionStatus;
    } catch (_) {
      return currentPermissionStatus;
    }
  }

  static void _requestPopUps({
    required String str,
    String? confirmText,
    bool flag = false,
  }) {
    OBDialogUtil.show(
      ObaseDialog.alert(
        title: 'alert'.tr,
        content: str,
        confirmText: confirmText ?? 'go_to_settings'.tr,
        onConfirmListener: () async {
          Get.back();
          await openAppSettings(); //打开设置页面
          if (flag) {
            SystemNavigator.pop();
          }
        },
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }
}

enum PhotoTaker {
  GALLERY,
  CAMERA,
}

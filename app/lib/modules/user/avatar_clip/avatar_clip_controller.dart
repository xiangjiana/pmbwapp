import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:path_provider/path_provider.dart';
import 'package:repository/utils/upload.dart';
import 'package:user/user.dart';


class AvatarClipController extends GetxController {
  final AuthService authService = Get.find<AuthService>();
  final CropController cropController = CropController();
  late final String imgFilePath;
  late final String imgFileType;
  late final String saveFilePath;
  final Rxn _currentImage = Rxn(null);
  bool clickSave = false;

  set currentImage(Uint8List? value) => _currentImage.value = value;

  Uint8List? get currentImage => _currentImage.value;

  final _isPreview = false.obs;

  set isPreview(bool value) => _isPreview.value = value;

  bool get isPreview => _isPreview.value;

  @override
  void onInit() {
    super.onInit();
    imgFilePath = Get.arguments['filePath'];
    imgFileType = Get.arguments['type'];
    runCatch(() async {
      if (await ImageUtil.checkImageType(imgFilePath)) {
        final filePath = await ImageUtil.heicToJpg(imgFilePath);
        currentImage = await ImageUtil.readImgAsBytes(filePath);
        if (currentImage != null) {
          cropController.image = currentImage!;
        }
      } else {
        showToast('user_only_supports_uploading_pictures'.tr);
        Get.back();
      }
    });
    // 延时1s执行返回
    Future.delayed(Duration(seconds: 3), () {
      clickSave = true;
    });
  }

  void handleClipImg() {
    if (currentImage == null || currentImage!.isEmpty) {
      return;
    }
    if (!clickSave) {
      showToast('please_wait'.tr);
      return;
    }
    clickSave = false;
    showLoading();
    cropController.cropCircle();
  }

  Future<void> onCropped(Uint8List croppedData) async {
    runCatch(() async {
      final saveFilePath = await saveFile(croppedData);
      if (saveFilePath != null && saveFilePath.isNotEmpty) {
        final filePath = await ImageUtil.compress(saveFilePath);
        if (filePath != null && filePath.isNotEmpty) {
          if (await ImageUtil.checkSize(filePath)) {
            showToast('user_image_is_too_large'.tr);
          } else {
            UploadImageMod uploadAvatarBean = await uploadAvatar(filePath);
            authService.syncUserAvatar(uploadAvatarBean.topImageUrl);
            onUpdataUserData(authService.userName, userAvatarUrl: uploadAvatarBean.topImageUrl);
            dismissAll();
            showToast('update_avatar_successfully'.tr);
            clickSave = true;
            Get.back();
          }
        }
      }
    }, handleError: (msg) {
      dismissAll();
      showToast(msg);
      clickSave = true;
    });
  }

  Future<String?> saveFile(Uint8List croppedData) async {
    try {
      if (kIsWeb) {
        return WebUtil.bytes2file(croppedData);
      }
      Directory? directory = GetPlatform.isAndroid
          ? await getExternalStorageDirectory()
          : await getApplicationDocumentsDirectory();
      if (directory != null) {
        String avatarFilePath = directory.path + "/profile/avatar.png";
        String dirPath = directory.path + "/profile";
        Directory fileDirectory = Directory(dirPath);
        if (!fileDirectory.existsSync()) {
          fileDirectory.createSync();
        }
        File imageFile = File(avatarFilePath);
        if (!imageFile.existsSync()) {
          imageFile.createSync();
        }
        imageFile.writeAsBytesSync(croppedData);
        return avatarFilePath;
      }
    } catch (_) {
      ///
    }
  }

  static final configApi = Get.find<UserApi>();

  Future<UploadImageMod> uploadAvatar(String filePath) async {
  /*  Uint8List uint8list;
    if (kIsWeb) {
      uint8list = await WebUtil.file2uini8list(filePath);
    } else {
      uint8list = File(filePath).readAsBytesSync();
    }
    return configApi.uploadAvatar(uint8list, (int count, int total) {});*/

    final completer = Completer<UploadImageMod>();
    UploaderPlugin.avatarUpload(
      use: true,
      filePath: filePath,
      success: (UploadImageMod res) => completer.complete(res),
      fail: (code, msg) => completer.completeError(msg),
    );
    return completer.future;
  }

  @override
  void onClose() {
    super.onClose();
  }
}

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_mixin.dart';
import 'package:ob_component/ob_component.dart';
import 'package:ob_package/modules/user/user_profile/repository/user_profile_repository.dart';
import 'package:params/params.dart';
import 'package:user/user.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class UserProfileController extends GetxController {
  final UserProfileRepository repository;
  final localAvatarUrls = [
    Assets.images.avatar.squarePhoto01.path,
    Assets.images.avatar.squarePhoto02.path,
    Assets.images.avatar.squarePhoto03.path,
    Assets.images.avatar.squarePhoto04.path,
    Assets.images.avatar.squarePhoto05.path,
    Assets.images.avatar.squarePhoto06.path,
    Assets.images.avatar.squarePhoto07.path,
  ];

  final AuthService authService;
  String lastTimeStamp = '';

  final userNameCtl = TextEditingController();
  final realNameCtl = TextEditingController();
  final genderCtl = TextEditingController();
  final birthDayCtl = TextEditingController();
  final phoneCtl = TextEditingController();
  final emailCtl = TextEditingController();
  final ImagePicker _picker = ImagePicker();
  StreamSubscription? streamSubscription;

  UserProfileController(this.repository, this.authService);

  bool get isAvatar => authService.isAvatar;

  bool get isAvatarHttpUrl => authService.isAvatarHttpUrl;

  String get userAvatarUrl => authService.userAvatarUrl;

  String get vipExperience => authService.vipExperience;

  String get vipLabel => authService.vipLabel;

  bool isGender = false;
  bool isBirthDay = false;
  final userApi = Get.find<UserApi>();

  @override
  void onInit() {
    super.onInit();
    updateRxAuthListen();
  }

  void updateRxAuthListen() {
    authService.syncUser();
    streamSubscription = authService.rxAuthState.listen(updateRxAuth);
    updateRxAuth(authService.authState);
  }

  void updateRxAuth(AuthState state) {
    if (state is LoggedIn) {
      final user = (authService.authState as LoggedIn).uiUser;
      userNameCtl.text = user.userName;
      final realName = user.realName ?? "";
      realNameReplace(realName);
      genderCtl.text = user.gender == '1'
          ? 'male'.tr
          : user.gender == '0'
              ? 'female'.tr
              : '';
      isGender = user.gender != '-1';
      birthDayCtl.text = user.birthDay ?? '';
      isBirthDay = birthDayCtl.text.length != 0;
      final phone = user.phone ?? "";
      var phoneNo = phone.split('-');
      if (phoneNo.length >= 2) {
        phoneCtl.text = phoneNo[1].length > 0
            ? '${phoneNo[0]}-${phoneNo[1].replaceRange(3, 7, '****')}'
            : "";
      } else {
        phoneCtl.text =
            phone.length > 0 ? phone.replaceRange(3, 7, '****') : '';
      }
      final email = user.email ?? "";
      final index = email.indexOf('@');
      if (index != -1) {
        var length = email.substring(0, index).length;
        if (length > 4) {
          emailCtl.text = email.replaceRange(4, index, '****');
        } else {
          emailCtl.text = email.replaceRange(length, index, '****');
        }
      }
    }
    update();
  }

  @override
  void onClose() {
    streamSubscription?.cancel();
    userNameCtl.dispose();
    realNameCtl.dispose();
    genderCtl.dispose();
    birthDayCtl.dispose();
    phoneCtl.dispose();
    emailCtl.dispose();
    super.onClose();
  }

  void selectGender() async {
    if (authService.isTryPlay) {
      warnDialog('user_profile_can_not_add_gender_to_demo_account'.tr);
      return;
    }
    if (isGender) return;
    runCatch(() async {
      if (authService.authState is LoggedIn) {
        // if ((authService.authState as LoggedIn).uiUser.gender != null &&
        //     (authService.authState as LoggedIn).uiUser.gender != "-1") return;

        final index = await Get.picker(children: [
          Center(
            child: RichText(
              text: TextSpan(
                text: 'male'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
          Center(
            child: RichText(
              text: TextSpan(
                text: 'female'.tr,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ),
          ),
        ]);
        if (index != null) {
          await repository.updateGender(
            '${1 - index}',
          );
          authService.syncUserGender('${1 - index}');
          updateRxAuthListen();
          showToast("save_success".tr);
        }
      }
    });
  }

  void selectBirth() async {
    if (authService.isTryPlay) {
      warnDialog('user_profile_demo_account_cannot_add_date_of_birth'.tr);
      return;
    }
    if (isBirthDay) return;
    runCatch(() async {
      if (authService.authState is LoggedIn) {
        if ((authService.authState as LoggedIn).uiUser.birthDay?.isNotEmpty ??
            false) return;
        final time = await Get.datePicker(
            initialDateTime: DateTime.now(), maximumDate: DateTime.now());
        if (time != null) {
          final formatTime = DateFormat('yyyy-MM-dd').format(time);
          showLoading();
          await userApi.updateBirth(BirthParam(birth: formatTime));
          dismissAll();
          authService.syncUserBirth(formatTime);
          birthDayCtl.text = formatTime;
          isBirthDay = birthDayCtl.text.length != 0;
          updateRxAuthListen();
          showToast("save_success".tr);
        }
      }
    });
  }

  void selectAvatar() async {
    if (authService.isTryPlay) {
      warnDialog('user_profile_demo_account_cannot_add_an_avatar'.tr);
      return;
    }
    PhotoTaker? photoTaker = await Get.bottomSheet<PhotoTaker>(
      ObBottomSheetSelectAvatar.list(
        title: 'user_profile_choose_avatar'.tr,
        onCancelListener: Get.back,
        children: [
          ListTile(
            tileColor: Color(0XFF1D2933),
            title: Text(
              'photograph'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              if (kIsWeb) {
                Get.back(result: PhotoTaker.CAMERA);
              } else {
                PermissionUtils.requestCameraPermission();
              }
            },
          ),
          Container(height: 0.5.w, color: Colors.white.withOpacity(0.06)),
          ListTile(
            tileColor: Color(0XFF1D2933),
            title: Text(
              'pickfrom_album'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            onTap: () {
              if (kIsWeb) {
                Get.back(result: PhotoTaker.GALLERY);
              } else {
                PermissionUtils.requestStorageAndPhotosPermission();
              }
            },
          ),
          Container(height: 8.w, color: Colors.black),
          ListTile(
            tileColor: Color(0XFF1D2933),
            title: Text(
              'cancel'.tr,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
            ),
            onTap: Get.back,
          ),
          Container(
            height: 34.w,
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.w),
        ),
      ),
      isScrollControlled: false,
      backgroundColor: Color(0xff1D2933),
    );
    XFile? file;
    switch (photoTaker) {
      case PhotoTaker.CAMERA:
        if (kIsWeb) {
          //web端头像拍照限制宽高质量避免太大web处理崩溃
          file = await _picker.pickImage(
              source: ImageSource.camera,
              imageQuality: 30,
              maxHeight: 800,
              maxWidth: 400);
        } else {
          try {
            file = await _picker.pickImage(
              source: ImageSource.camera,
            );
          } catch (e) {}
        }
        print("file: ${file?.path}");
        if (file != null) {
          Get.toNamed(
            AppRoutes.Avatar_Clip,
            arguments: {'filePath': file.path, 'type': 'CAMERA'},
          );
        }
        break;
      case PhotoTaker.GALLERY:
        if (kIsWeb) {
          file = await _picker.pickImage(
              source: ImageSource.gallery,
              imageQuality: 30,
              maxHeight: 800,
              maxWidth: 400);
          if (file != null) {
            Get.toNamed(
              AppRoutes.Avatar_Clip,
              arguments: {'filePath': file.path, 'type': 'PHOTO'},
            );
          }
        } else {
          final List<AssetEntity>? assets = await AssetPicker.pickAssets(
              Get.context!,
              pickerConfig: const AssetPickerConfig(maxAssets: 1));
          final file = await assets?.first.originFile;
          if (file != null) {
            Get.toNamed(
              AppRoutes.Avatar_Clip,
              arguments: {'filePath': file.path, 'type': 'PHOTO'},
            );
          }
        }
        break;
      default:
        break;
    }
  }

  Future<void> navigateBindEmail() async {
    if (authService.isTryPlay) {
      warnDialog('user_profile_unable_to_add_email_address_to_demo_account'.tr);
      return;
    }
    authService.syncUser();
    if (authService.authState is LoggedIn &&
        ((authService.authState as LoggedIn).uiUser.email?.isEmpty ?? true)) {
      Get.toNamed(AppRoutes.BIND_EMAIL);
    }
  }

  Future<void> navigateBindPhone() async {
    // if (authService.isTryPlay) {
    //   warnDialog('user_profile_can_not_add_mobile_number_to_demo_account'.tr);
    //   return;
    // }
    authService.syncUser();
    if (authService.authState is LoggedIn &&
        ((authService.authState as LoggedIn).uiUser.phone?.isEmpty ?? true)) {
      Get.toNamed(AppRoutes.BIND_PHONE_NUMBER);
    }
  }

  void updateLocalAvatar(String url) async {
    if (authService.isTryPlay) {
      warnDialog('user_profile_demo_account_cannot_add_an_avatar'.tr);
      return;
    }
    runCatch(() async {
      await repository.updateAvatarUrl(url);
      authService.syncUserAvatar(url);
      onUpdataUserData(authService.userName, userAvatarUrl: url);
      update();
    });
  }

  Future<void> selectRealName() async {
    if (realNameCtl.text.isEmpty) {
      await Get.toNamed(AppRoutes.SET_REAL_NAME);
      updateRxAuthListen();
    }
  }

  void realNameReplace(String realName) {
    realNameCtl.text = realName.length > 0
        ? realName.length > 6
            ? realName.replaceRange(0, realName.length - 1, '***')
            : realName.replaceRange(
                0, realName.length - 1, '*' * (realName.length - 1))
        : "";
  }

  void warnDialog(String tipMsg) {
    OBDialogUtil.show(
      ObDialog.alert(
        title: 'continue'.tr,
        content: tipMsg,
        cancelText: 'user_profile_understood'.tr,
        onCancelListener: () {
          Get.back();
        },
      ),
    );
  }
}

import 'dart:async';

import 'package:exception/exception.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:repository/utils/device_type.dart';
import 'package:repository/utils/upload.dart';
import 'package:params/params.dart';
import 'package:setting/setting.dart';



Map<int, String> problemTypes = {};

class FeedbackController extends GetxController with KeyboardManager {
  RxInt selectedType = (-1).obs;

  RxList<String> imagePaths = <String>[].obs;
  bool applyDone = false;

  List<String> uploadedImageUrl = [];
  int currentUploadIndex = 0;
  TextEditingController textEditingController = TextEditingController();
  RxBool canSubmit = false.obs;
  RxBool isLoadingStatus = false.obs;

  ScrollController customScrollController = ScrollController();
  final settingApi = Get.find<SettingApi>();


  @override
  void onInit() {
    super.onInit();
    problemTypes = {
      0: "feedback_deposit_problem".tr,
      1: "feedback_withdrawal_problems".tr,
      2: "feedback_game_problem".tr,
      3: "feedback_discount_question".tr,
      4: "feedback_app_login".tr,
      5: "feedback_modify_data".tr,
      6: "feedback_water_problem".tr,
      7: "other".tr
    };
    textEditingController.addListener(() {
      setCanSubmit();
    });
  }

  void setCanSubmit() {
    if (textEditingController.text.length >= 20 &&
        selectedType.value != -1 &&
        !canSubmit.value) {
      canSubmit.value = true;
    } else if (canSubmit.value &&
        (textEditingController.text.length < 20 || selectedType.value == -1)) {
      canSubmit.value = false;
    }
  }

  Future<String?> uploadImage(
    String filePath, {
    required Function builder,
  }) async {
    final Completer<String?> completer = Completer();
    if (await ImageUtil.checkImageType(filePath)) {
      String? newFilePath = await ImageUtil.heicToJpg(filePath);
      newFilePath = await ImageUtil.compress(newFilePath);
      if (newFilePath != null && newFilePath.isNotEmpty) {
        if (await ImageUtil.checkSize(newFilePath)) {
          showToast('user_image_is_too_large'.tr);
          completer.complete('');
        } else {
          UploaderPlugin.feedBackUpload(
            use: true,
            filePath: newFilePath,
            success: (UploadImageMod res) {
              imagePaths.add(res.imgUrl);
              completer.complete(res.imgUrl);
            },
            fail: (err, msg) {
              showToast(msg ?? "feedback_image_upload_failed".tr);
              completer.complete('');
            },
            progressCallback: (int sent, int total) {
              final int roundProgress = ((sent / total) * 100).round();
              builder(roundProgress / 100);
            },
          );
        }
      }
    } else {
      showToast('user_only_supports_uploading_pictures'.tr);
      completer.complete('');
    }
    return completer.future;
  }

  void submit() async {
    try {
      if (CoolDownManager.handler(key: 'kCoolDownFeedback', duration: 3000)) {
        if (selectedType.value == -1) {
          showToast("feedback_select_a_question_type".tr);
          return;
        }
        if (textEditingController.text.length < 20) {
          showToast("feedback_problem_description".tr);
          return;
        }
        String? imageUrlString;
        if (imagePaths.length != 0) {
          imageUrlString = "";
          imagePaths.forEach((element) {
            imageUrlString = (imageUrlString ?? "") + element + ",";
          });
          imageUrlString =
              imageUrlString!.substring(0, imageUrlString!.length - 1);
        }
        isLoadingStatus.value = true;
        await settingApi.addFeedBack(AddFeedbackParam(
            deviceNo: "APP",
            deviceType: InstallDeviceType.deviceType!,
            deviceTypeInfo: "A01",
            problemDescribe: textEditingController.text,
            problemType: selectedType.value,
            url: imageUrlString ?? ""));
        isLoadingStatus.value = false;
        showToast("feedback_feedback_submitted_successfully".tr);
        imagePaths.clear();
        uploadedImageUrl.clear();
        selectedType.value = -1;
        textEditingController.clear();
        currentUploadIndex = 0;
        Get.back();
      } else {
        showToast('feedback_the_operation_is_too_frequent'.tr);
      }
    } on ServerException catch (e) {
      isLoadingStatus.value = false;
      if (e.message.isNotEmpty) {
        showToast(e.message);
      }
    } catch (e) {
      isLoadingStatus.value = false;
      print(e.toString());
    }
  }

  @override
  void onClose() {
    textEditingController.dispose();
    customScrollController.dispose();
    Store.isAutoFocus = false;
    super.onClose();
  }
}

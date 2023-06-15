import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';


import 'package:ob_component/ob_component.dart';

class LockSettingController extends GetxController {
  final _isLockSettingOpen = false.obs;

  get isLockSettingOpen => _isLockSettingOpen.value;

  set isLockSettingOpen(value) => _isLockSettingOpen.value = value;

  @override
  void onInit() {
    super.onInit();
    initLockSettingState();
  }

  void initLockSettingState() {
    var gesturePassword = CacheUtil.get('gesture_password');
    isLockSettingOpen =
        gesturePassword.isNotEmpty && gesturePassword['status'] == true;
  }

  void toggleLockSetting() {
    if (!isLockSettingOpen) {
      OBDialogUtil.show(
        ObDialog.alert(
          title: 'alert'.tr,
          confirmText: 'lock_setting_keep_on'.tr,
          content: 'lock_setting_turn_on_the_gesture_password'.tr,
          onConfirmListener: () {
            isLockSettingOpen = !isLockSettingOpen;
            Get.back();
            Get.toNamed(AppRoutes.SETUP_GESTURE_PASSWORD);
          },
          onCancelListener: () => Get.back(),
        ),
      );
    } else {
      isLockSettingOpen = !isLockSettingOpen;
      var gesturePassword = CacheUtil.get('gesture_password');
      if (gesturePassword.isNotEmpty) {
        CacheUtil.remove('gesture_password');
      }
    }
  }
}

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/modules/user/user_profile/repository/user_profile_repository.dart';

class SetRealNameController extends GetxController {
  final usernameTextController = TextEditingController();
  final usernameFocusNode = FocusNode();

  final UserProfileRepository repository;

  /// 用户名清空按钮
  var usernameClearButtonHide = true.obs;

  /// 用户名是否检查通过
  var usernameCheck = false.obs;

  final usernameRegExp =
      RegExp(r'^([a-zA-Z]{1})(?=.*[a-zA-Z]{0})(?=.*[0-9])[0-9A-Za-z]{3,10}$');//原先的用户名正则 暂时废弃

  /// 按钮的可用
  var isSetButtonEnable = false.obs;

  SetRealNameController(this.repository);

  /// 点击清空用户名
  void onTapClearUsername() {
    usernameTextController.clear();
    final username = usernameTextController.text;
    usernameClearButtonHide.value = username.isEmpty;
    usernameCheck.value = checkForUsername(username);
    isSetButtonEnable.value = checkSetButtonEnable();
  }

  /// 改变用户名
  void onChangeUsername(String username) {
    usernameCheck.value = checkForUsername(username);
    isSetButtonEnable.value = checkSetButtonEnable();
    usernameClearButtonHide.value = username.isEmpty;
  }

  /// 检查用户名是否通过正则匹配
  bool checkForUsername(String username) {
    var value = username.length >= 1 && username.length <= 64;
    return value;
  }

  /// 检查添加代理按钮的是否可用
  bool checkSetButtonEnable() {
    if (usernameCheck.value) {
      return true;
    }
    return false;
  }

  onTapSetRealName() {
    runCatch(() async {
      await repository.updateRealNameNew(usernameTextController.text);
      showToast("save_success".tr);
      Get.back();
    });
  }
}

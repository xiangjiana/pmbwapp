

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

mixin KeyboardManager on GetxController {

  void hideKeyboard() {
    var context = Get.context;
    if (context != null) {
      FocusScopeNode currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
        FocusManager.instance.primaryFocus?.unfocus();
      }
    }
  }
}
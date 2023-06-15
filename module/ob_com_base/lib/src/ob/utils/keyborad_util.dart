import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:sp_util/sp_util.dart';

/// 根据用户名的缓存，用户切换后取到正确的数据
class KeyboardUtil {

  void hideKeyboard(context) {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus!.unfocus();
    }
  }

}

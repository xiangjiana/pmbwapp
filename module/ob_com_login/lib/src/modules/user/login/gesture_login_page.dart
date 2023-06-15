import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/debug/debug_page.dart';
import 'package:ob_com_login/src/modules/user/login/components/gesture_login_body.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_body_wrapper.dart';
import 'package:ob_com_base/ob_com_base.dart';

class GestureLoginPage extends GetView {
  @override
  Widget build(BuildContext context) {
    final child = Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!Flavor.I.isProduction)
            ElevatedButton(
              onPressed: () {
                Get.to(DebugPage());
              },
              child: Text(
                "Debug页面",
                style: TextStyle(color: Colors.black),
              ),
            )
        ],
      ),
      body: LoginBodyWrapper(
        child: GestureLoginBody(),
      ),
    );
    if (GetPlatform.isAndroid&&!kIsWeb) {
      return DoubleTapExit(
        child: child,
        onIntercept: () {
          showToast('operate_again_to_exit_the_app'.tr);
        },
      );
    } else {
      return child;
    }
  }
}

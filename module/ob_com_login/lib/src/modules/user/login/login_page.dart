import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/debug/debug_page.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_body_wrapper.dart';
import 'package:ob_com_login/src/modules/user/login/components/login_body.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance?.addObserver(this);
    super.initState();
    Invitation.getInvitationData();
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    switch (state) {
      //应用程序可见,不可操作。
      case AppLifecycleState.inactive:
        break;
      //应用程序可见,可操作, 前台
      case AppLifecycleState.resumed:
        {
          await Invitation.getInvitationData();
          eventBus.fire(LoginModuleEvent(true));
        }
        break;
      //应用程序不可见，不可操作, 后台
      case AppLifecycleState.paused:
        break;
      //虽然还在运行，但已经没有任何存在的界面。
      case AppLifecycleState.detached:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    String? flavorStr = Flavor.I.getString(API_TYPE);
    if (flavorStr != null) {
      if (flavorStr == 'qa') flavorStr = 'test';
    }
    final child = Scaffold(
      //Gata 要求键盘激活后页面上页面上移
      //resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xff202226),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (!Flavor.I.isProduction)
            ElevatedButton(
              onPressed: () {
                Get.to(const DebugPage());
              },
              child: Text(
                "Debug页面 $flavorStr",
                style: TextStyle(color: Colors.black),
              ),
            )
        ],
      ),
      body: const LoginBodyWrapper(
        child:  LoginBody(),
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
      final themeData = Theme.of(context);
      return Theme(
        data: themeData.copyWith(
          platform: TargetPlatform.android,
        ),
        child: child,
      );
    }
  }
}

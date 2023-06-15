import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_password_body.dart';
import 'package:ob_com_base/ob_com_base.dart';

class FindPasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(child: ObTheme(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: ObNavigationBarTitle("find_password_title".tr),
          leading: ObBackButton(),
        ),
        body:  const FindPasswordBody(),
      ),
    ));
  }
}

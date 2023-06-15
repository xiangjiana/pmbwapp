import 'package:cool_ui/cool_ui.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/login_error/components/login_error_body.dart';

class LoginErrorPage extends GetView {
  @override
  Widget build(BuildContext context) {
    return KeyboardMediaQuery(child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: LoginErrorBody(),
    ));
  }
}

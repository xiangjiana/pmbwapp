import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/register_text/components/register_tiaokuan.dart';
import 'package:ob_com_login/src/modules/user/register_text/components/register_yinsi.dart';
import 'package:ob_com_login/src/modules/user/register_text/register_text_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';

class RegisterTextPage extends StatefulWidget {
  const RegisterTextPage({Key? key}) : super(key: key);

  @override
  _RegisterTextPageState createState() => _RegisterTextPageState();
}

class _RegisterTextPageState extends State<RegisterTextPage> {
  RegisterTextController regText = Get.find<RegisterTextController>();

  @override
  void initState() {
    super.initState();

    regText.textType = Get.parameters['textType'].toString();
    regText.title = Get.parameters['title'].toString();
  }

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle(regText.title),
          leading: ObBackButton(),
        ),
        body: Column(
          children: [
            DividerLine(),
            Expanded(
              child: regText.textType == "0" ? Tiaokuan() : Yinsi(),
            ),
          ],
        ),
      ),
    );
  }
}

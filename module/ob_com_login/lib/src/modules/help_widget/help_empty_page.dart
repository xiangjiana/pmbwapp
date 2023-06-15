import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:get/get.dart';

import 'help_empty_controller.dart';

class HelpEmptyPage extends GetView<HelpEmptyController> {

  String tutorName = '';

  HelpEmptyPage({Key? key, this.tutorName = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle(controller.tutorName),
          leading: ObBackButton(),
        ),
        backgroundColor: Get.theme.backgroundColor,
        body: Center(
          child: EmptyView(),
        ),
      ),
    );
  }
}

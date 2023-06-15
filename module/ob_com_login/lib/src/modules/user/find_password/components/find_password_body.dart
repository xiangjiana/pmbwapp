import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_password_text.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_tabbar.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_password_controller.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_phone_panel.dart';
import 'package:ob_com_login/src/modules/user/find_password/components/find_email_panel.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class FindPasswordBody extends StatefulWidget {
  const FindPasswordBody({Key? key}) : super(key: key);

  @override
  _FindPasswordBodyState createState() => _FindPasswordBodyState();
}

class _FindPasswordBodyState extends State<FindPasswordBody>
    with SingleTickerProviderStateMixin {
  FindPasswordController findController = Get.find<FindPasswordController>();

  @override
  void initState() {
    super.initState();

    findController.tabController = TabController(
      vsync: this, //固定写法
      length: 2, //指定tab长度
    );
  }

  @override
  Widget build(BuildContext context) {
    return findController.isDj?Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        DividerLine(),
        Expanded(
          child: SizedBox(
            width: 1.sw,
            // height: Get.height,
            child: PageView(
              controller: findController.pageController,
              children: const [FindPhonePanel()],
              onPageChanged: (i) {
                findController.onPageChange(i);
              },
            ),
          ),
        ),
        //为了保持底部文本框不动
        FindPasswordText2(),
        FindPasswordText3(),
      ],
    ):Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const FindTabBar(),
        DividerLine(),
        Expanded(
          child: SizedBox(
            width: 1.sw,
            // height: Get.height,
            child: PageView(
              controller: findController.pageController,
              children: const [FindPhonePanel(), FindEmailPanel()],
              onPageChanged: (i) {
                findController.onPageChange(i);
              },
            ),
          ),
        ),
        //为了保持底部文本框不动
        FindPasswordText2(),
        FindPasswordText3(),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_login/src/modules/user/find_password/find_password_controller.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;

class FindTabBar extends StatefulWidget {
  const FindTabBar({Key? key}) : super(key: key);

  @override
  _FindTabBarState createState() => _FindTabBarState();
}

class _FindTabBarState extends State<FindTabBar> {
  FindPasswordController findController = Get.find<FindPasswordController>();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 44.w,
        child: ObTheme(
          tabFixedSizedIndicator: TabFixedSizedIndicator(Size(24.w,3.w), ColorName.colorMain1),
          child: ObTabBar(
            onTap: (index) {
              if (index == findController.pageController.page) {
              } else {
                findController.onTapTabBar(index);
              }
            },
            controller: findController.tabController,
            labelColor: Colors.white,
            unselectedLabelColor: Colors.white.withOpacity(0.6),
            unselectedLabelStyle: const TextStyle(
                fontFamily: "PingFangSC-Regular",
                fontSize: 14,
                wordSpacing: -1.5,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400),
            labelStyle: const TextStyle(
                fontFamily: "PingFangSC-Medium",
                fontSize: 14,
                wordSpacing: -1.5,
                letterSpacing: -0.5,
                fontWeight: FontWeight.w400),

            tabs: [
              Tab(
                child: Text("find_password_phone".tr),
              ),
              Tab(
                child: Text("find_password_email".tr),
              ),
            ],
          ),
        ));
  }
}

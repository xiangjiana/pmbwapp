import 'package:flutter/material.dart' hide TabBarView;
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';

import 'component/verify_email_tab.dart';
import 'component/verify_phone_tab.dart';

class VerifyIdentityPage extends StatelessWidget {
  final tabs = [
    VerifyPhoneTab(),
    VerifyEmailTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: ObNavigationBarTitle('verify_identity_authentication'.tr),
            leading: ObBackButton(),
            bottom: ObTabBar(
              tabs: [
                Tab(
                  child: Text('find_input_phone_1'.tr),
                ),
                Tab(
                  child: Text('find_input_email_vail'.tr),
                ),
              ],
            ),
          ),
          body: Column(
            children: [
              SizedBox(
                height: 3.w,
              ),
              Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
              Expanded(
                child: TabBarView(
                  children: tabs,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

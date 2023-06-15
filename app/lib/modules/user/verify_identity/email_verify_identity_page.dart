import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'component/verify_email_tab.dart';
import 'package:get/get.dart';

class EmailVerifyIdentityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('verify_identity_authentication'.tr),
          leading: ObBackButton(),
          bottom: PreferredSize(
            child:Divider(height: 8.w, thickness: 8.w, color: Color(0xff0E1519)),
            preferredSize:Size.fromHeight(8.w),
          ),
        ),
        body: VerifyEmailTab(),
      ),
    );
  }
}

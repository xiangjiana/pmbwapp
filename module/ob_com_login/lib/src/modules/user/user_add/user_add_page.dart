import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ob_com_base/ob_com_base.dart';

import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:ob_com_login/src/login_x.dart';

import 'component/user_add_body.dart';

class UserAddPage extends StatelessWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle(
            Get.arguments != null
                ? 'user_toggle_user_login_title'.tr
                : 'user_toggle_user_add_title'.tr,
          ),
          leading: ObBackButton(),
          actions: [
            IconButton(
              icon: pkObImage(
                Assets.images.icon.homeService.path,
                width: 24.w,
                height: 24.w,
              ),
              onPressed: () {
                  if (Store.clientId == Store.clientIdFYB) {
                    PublicResources.jumpToAgentServicePage();
                  } else {
                    PublicResources.jumpToMemberServicePage();
                  }
                }
            )
          ],
          bottom: TitleDividerLine(),
        ),
        body: const UserAddBody(),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_package/utils/tool_kit.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'invite_detail_controller.dart';

class InviteDetailPage extends GetView<InviteDetailController> {
  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Stack(
            children: [
              WebView(
                initialUrl: ToolKit.instance.addSignatureForActivityUrl(
                  link: controller.inviteConfig.pageRouteAddr,
                  type: DiscountEnum.invite,
                  id: controller.inviteConfig.id,
                ),
                javascriptMode: JavascriptMode.unrestricted,
                navigationDelegate: controller.navigationDelegates,
                onWebViewCreated: (c) {
                  c.setBackgroundColor(21, 30, 37, 1);
                  c.evaluateJavascript(
                      "document.getElementsByTagName('body')[0].style.background='rgb(21, 30, 37)'");
                },
                onPageFinished: (String url) {
                  controller.isLoading = false;
                },
                onProgress: (int progress) {
                  controller.isLoading = progress < 50;
                },
              ),
              Obx(
                () => Visibility(
                  visible: controller.isLoading,
                  child: Container(
                    color: Get.theme.backgroundColor,
                    child: GataLoading(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

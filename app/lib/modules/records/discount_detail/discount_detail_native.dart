import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:webview_flutter/webview_flutter.dart';

import 'discount_detail_native_controller.dart';

class DiscountDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<DiscountDetailNativeController>(
      init: DiscountDetailNativeController(Get.find()),
      builder: (controller) {
        return ObTheme(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: ObNavigationBarTitle(controller.discount?.title ?? ''),
              leading: ObBackButton(),
              actions: [
                GestureDetector(
                  behavior: HitTestBehavior.translucent,
                  onTap: controller.showPoster,
                  child: Container(
                      width: 48.w,
                      height: 49.w,
                      alignment: Alignment.center,
                      child: ObImage.asset(
                        Assets.images.icon.homeShare.path,
                        width: 24.w,
                        height: 24.w,
                      )),
                ),
              ],
            ),
            body: Stack(
              children: [
                WebView(
                  initialUrl: controller.generateUrl(),
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
        );
      },
    );
  }
}

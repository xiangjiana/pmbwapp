import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/webpage/web_page_controller.dart';
import 'package:ob_component/ob_component.dart' hide ObTheme;
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPage extends StatefulWidget {
  const WebPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _WebPage();
  }
}

class _WebPage extends State<WebPage> {
  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) WebView.platform = SurfaceAndroidWebView();
    dismissLoading();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WebPageController>(
      init: WebPageController(),
      tag: hashCode.toString(),
      builder: (controller) {
        controller.showTitle.value = controller.args?["showTitle"] ?? false;
        controller.initChannels();
        if (!(controller.args?["showToolbar"] ?? false)) {
          return ObTheme(child: Scaffold(body: _body(controller)));
        }

        return ObTheme(
          child: Scaffold(
            appBar: AppBar(
              title: Obx(
                () => ObNavigationBarTitle(
                  controller.showTitle.value ? (controller.args?["title"] ?? '') : '',
                ),
              ),
              leading: ObBackButton(onPressed: () {
                controller.hideKeyboard();
                Get.back();
              }),
              actions: [
                Obx(() {
                  if (controller.showAction.value) {
                    return GestureDetector(
                      onTap: () {
                        controller.webViewController.evaluateJavascript("nativeAction()");
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 12.w),
                        child: Text(
                          controller.actionText.value,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
              ],
            ),
            body: _body(controller),
          ),
        );
      },
    );
  }

  Widget _body(WebPageController controller) {
    return SafeArea(
      child: Stack(
        children: [
          WebView(
            initialUrl: controller.getUrl(),
            javascriptMode: JavascriptMode.unrestricted,
            onWebViewCreated: (WebViewController webViewController) {
              if (Store.clientId == Store.clientIdDJ) {
                webViewController.setBackgroundColor(33, 35, 41, 100);
              }
              controller.webViewController = webViewController;
              webViewController.clearCache();
            },
            navigationDelegate: controller.navigationDelegates,
            javascriptChannels: controller.javascriptChannels,
            onPageFinished: (String url) {
              controller.isLoading = false;
            },
            onProgress: (int progress) {
              controller.isLoading = progress < 50;
            },
          ),
          if (Store.clientId == Store.clientIdDJ)
            Positioned(
              left: 0.w,
              top: 0.h,
              child: InkWell(
                onTap: () {
                  Get.back();
                },
                child: SizedBox(
                  width: 40.w,
                  height: 49.h,
                ),
              ),
            ),
          Obx(
            () {
              Widget gLoading;
              gLoading = const GataLoading();
              return Visibility(
                visible: controller.isLoading && (controller.args?["hasLoading"] ?? false) == true,
                child: Container(
                  color: Get.theme.backgroundColor,
                  child: gLoading,
                ),
              );
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).padding.bottom,
          )
        ],
      ),
    );
  }
}

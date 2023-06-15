
import 'package:flutter/material.dart';
import 'package:ob_com_login/src/modules/webpage/web_page_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewWidget extends StatelessWidget {
  late final String url;
  late WebPageController webPageController;


  WebViewWidget(this.url,WebPageController controller, String tag) {
    webPageController = controller;
    controller.initChannels();

    Future.delayed(Duration(seconds: 5),(){
      webPageController.showTitle.value = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController controller) {
        webPageController.webViewController = controller;
      },
      javascriptChannels: webPageController.javascriptChannels,
    );
  }
}

import 'package:flutter/material.dart' hide PageController;
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ThirdDepositPage extends StatelessWidget {
  const ThirdDepositPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ObTheme(
      child: Scaffold(
        appBar: AppBar(
          title: ObNavigationBarTitle('deposit_result_info'.tr),
          leading: ObBackButton(),
        ),
        body: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            WebView(
              initialUrl: Get.arguments,
              javascriptMode: JavascriptMode.unrestricted,
              navigationDelegate: (NavigationRequest request) async {
                if (!request.url.startsWith('http') &&
                    !request.url.startsWith('https')) {
                  final isCanLaunch = await canLaunch(request.url);
                  if (isCanLaunch) {
                    await launch(request.url);
                  } else {
                    showToast('no_client'.tr);
                  }
                  return NavigationDecision.prevent;
                }
                return NavigationDecision.navigate;
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'dart:convert';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ob_com_base/ob_com_base.dart';
import 'package:ob_com_login/src/modules/webpage/mixin/mixin_web_signal_handler.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebPageController extends GetxController with KeyboardManager, WebSignalHandler {
  late WebViewController webViewController;
  RxBool showTitle = false.obs;
  RxBool showAction = false.obs;
  RxString actionText = "".obs;
  RxString title = "".obs;
  final _isLoading = true.obs;
  Map? args;

  bool isHtml = false;

  set isLoading(bool value) => _isLoading.value = value;

  bool get isLoading => _isLoading.value;

  late Set<JavascriptChannel> javascriptChannels;

  @override
  void onInit() {
    super.onInit();
    var arguments = Get.arguments;
    if (arguments != null && arguments is Map) {
      args = arguments;
      isHtml = arguments['isHtml'];
    }
    dismissAll();
  }

  String getUrl() {
    var url = args?["url"] ?? '';
    if (isHtml) {
      return Uri.dataFromString(url, mimeType: 'text/html', encoding: utf8).toString();
    } else {
      return url;
    }
  }

  void initChannels() {
    javascriptChannels = Set();
    javascriptChannels.add(
      JavascriptChannel(
        name: "native",
        onMessageReceived: (JavascriptMessage javascriptMessage) {
          print("${javascriptMessage.message}");
          if (javascriptMessage.message != null) {
            Map<String, dynamic> map = jsonDecode(javascriptMessage.message);
            late Map<String, dynamic> data;
            if (map.containsKey("data")) {
              data = map["data"];
            }
            switch (map["method"]) {
              case "back":
                Get.back();
                break;
              case "showToast":
                showToast(data["message"]);
                break;
              case "openUrl":
                //打开url
                String url = data["url"];
                int type = data["type"]; //0 页面内打开  1新页面打开  2 系统webview打开
                if (type == 0) {
                  webViewController.loadUrl(url);
                } else if (type == 1) {
                  WebUtil.openInApp(url, showTitle: true, title: 'welcome_webview_page_opened_from_web'.tr);
                } else if (type == 2) {
                  WebUtil.openInBrowser(url);
                }
                break;
              case "getImage":
                //获取图片给h5
                print("${javascriptMessage.message}");
                getImage(data["source"].toString());
                break;
              case "showActionButton":
                //显示标题栏右边按钮
                showAction.value = true;
                actionText.value = data["text"];
                break;
              case "hideActionButton":
                //显示标题栏右边按钮
                showAction.value = false;
                actionText.value = "";
                break;
            }
          }
        },
      ),
    );

    ///天下钱包
    javascriptChannels.add(
      JavascriptChannel(
        name: "FlutterBridge", // js 通信管道
        onMessageReceived: (JavascriptMessage javascriptMessage) {
          /// 接收js发来的消息
          final message = jsonDecode(javascriptMessage.message);
          final method = message['method'];
          final data = message['data'];
          switch (method) {
            case 'back':
              Get.back();
              break;
          }
        },
      ),
    );
  }

  void getImage(String source) async {
    PickedFile pickedFile;
    if (source == "camera") {
      pickedFile = (await ImagePicker().getImage(source: ImageSource.camera))!;
    } else {
      pickedFile = (await ImagePicker().getImage(source: ImageSource.gallery))!;
    }
    String fileBase64 = "";
    if (pickedFile != null) {
      fileBase64 = base64.encode(await pickedFile.readAsBytes());
    }
    webViewController.evaluateJavascript("getImageBack('$fileBase64')");
  }

  @override
  void onClose() {
    dismissAll();
    super.onClose();

    if (Store.clientId == Store.clientIdDJ ||
        Store.clientId == Store.clientIdMB ||
        Store.clientId == Store.clientIdFYB) {
    } else {
      Future.delayed(const Duration(milliseconds: 500), () {
        eventBus.fire(FloatBonusEvent(show: true));
      });
    }
  }
}

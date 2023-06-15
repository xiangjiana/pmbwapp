import 'dart:async';
import 'dart:convert';
import 'package:common/common.dart';
import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart' hide window;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ob_com_login/ob_com_login.dart';
import 'package:ob_com_login/src/modules/user/login/repository/login_repository.dart';
import './ui_fake.dart' if (dart.library.html) 'dart:html';
import './ui_fake.dart' if (dart.library.html) 'dart:js' as js;
import './ui_fake.dart' if (dart.library.html) 'dart:ui' as ui;


class GtWebCaptcha extends StatefulWidget {
  const GtWebCaptcha({
    Key? key,
    this.onSuccess,
    this.onClose,
    this.onError,
    this.onLoad,
    this.onReady,
  }) : super(key: key);
  final Function? onSuccess;
  final Function? onClose;
  final Function? onError;
  final Function? onLoad;
  final Function? onReady;

  static dynamic platform;

  @override
  State<GtWebCaptcha> createState() => _GtWebCaptchaState();
}

class _GtWebCaptchaState extends State<GtWebCaptcha> {
  late final StreamSubscription? listener;

  @override
  void initState() {
    super.initState();
    _listener();
    ui.platformViewRegistry.registerViewFactory("index_html", (int viewId) {
      IFrameElement element = IFrameElement();
      element.style.border = 'none';
      //release之后的会多一层assets。。所以要判断下，否则打包后弹不出
      element.src = "/captcha/index1.html?t=${DateTime.now().millisecondsSinceEpoch}";
      element.style.width="0px";
      element.style.height="0px";
      element.style.opacity="0";
      element.style.animationName="fadeIn1";
      element.style.animationDuration="50ms";
      element.style.animationDelay="2s";
      element.style.animationFillMode="forwards";
      element.id="webcapture";
      //对于iOS12版本我们把验证码的iframe挪个位置以解决只能显示1次问题，iOS版本号在js端判断
      Future.delayed(const Duration(seconds:1), () {
        js.context.callMethod("moveWebcapture", []);
      });
      return element;
    });
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: 'index_html');
  }

  void _listener() {
    listener = window.onMessage.listen((event) {
      print(event);
      final code = event.data['code'];
      switch (code) {
        case 0:
          print("onLoad");
          String baseUrl;
          if (kIsWeb && !kDebugMode) {
            baseUrl = '/api';
          } else {
            baseUrl = LoginX.instance.flavor!.getString('api_url')!;
          }
          js.context.callMethod("setHttpConfig", [
            jsonEncode({"lang":Get.locale?.languageCode??"en"})
          ]);
          if (widget.onLoad != null) {
            onHandle('onLoad', widget.onLoad!);
          }
          break;
        case 1:
          // print("onReady");
          if (widget.onReady != null) {
            onHandle('onReady', widget.onReady!);
          }
          break;
        case 2:
          //iOS12版本的iframe被挪位置后需要手动remove
          js.context.callMethod("removeWebcapture", []);
          // print("onSuccess");
          if (widget.onSuccess != null) {
            onHandle('onSuccess', widget.onSuccess!);
          }
          break;
        case 3:
          js.context.callMethod("removeWebcapture", []);
          // print("onClose");
          if (widget.onClose != null) {
            onHandle('onClose', widget.onClose!);
          }
          break;
        case -1:
          js.context.callMethod("removeWebcapture", []);
          // print("onError");
          if (widget.onError != null) {
            onHandle('onError', widget.onError!);
          }
          break;
        case -2:
          js.context.callMethod("removeWebcapture", []);
          // print("onServerError");
          if (widget.onError != null) {
            onHandle('onError', widget.onError!);
          }
          showToast('request_error'.tr);
          break;
      }
      if(event.data['result']!=null){
        var result=event.data['result'];
        signUpStepThreeVerifyCaptcha(result);
      }else if(event.data['firstRegister']!=null){
        postGeetestFirstRegister();
      }
    });
  }
  final commonApi = Get.find<CommonApi>();
  postGeetestFirstRegister() async {
    try{
      final res = await commonApi.firstRegister();
      js.context.callMethod("firstRegisterSuccess", [res]);
    }catch(e){
      js.context.callMethod("firstRegisterFail", []);
    }
  }

  Future<bool> signUpStepThreeVerifyCaptcha(String params) async {
    try {
      var json = const JsonDecoder().convert(params);
      final repository = Get.find<LoginRepository>();
      await repository.postGeetestSecondValidate(
        json["geetest_challenge"],
        json["geetest_seccode"],
        json["geetest_validate"],
      );
      if (widget.onSuccess != null) {
        onHandle('onSuccess', widget.onSuccess!);
      }
      return true;
    } on Map catch (e) {
          js.context.callMethod("removeWebcapture", []);
          // print("onServerError");
          if (widget.onError != null) {
            onHandle('onError', widget.onError!);
          }
      showToast(e['message']);
      return false;
    }
  }
  void onHandle(String key, Function callBack) {
    final isHandle = CoolDownManager.handler(
      key: key,
      duration: 1000,
    );
    if (isHandle) {
      callBack();
    }
  }

  @override
  void dispose() {
    listener?.cancel();
    super.dispose();
  }
}
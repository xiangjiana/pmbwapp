import 'dart:async';

import 'package:get/get.dart';
import 'package:ob_com_base/ob_com_base.dart' hide window;
import 'package:ob_package/mixin/mixin_web_signal_handler.dart';
import 'package:ob_package/modules/records/discount_detail/discount_details_mixin.dart';
import 'package:ob_package/modules/records/discount_detail/repository/repository.dart';
import 'package:ob_package/modules/web_iframe/ui_fake.dart'
    if (dart.library.html) 'dart:html';
import 'package:ob_package/modules/web_iframe/ui_fake.dart'
    if (dart.library.html) 'dart:ui' as ui;

class DiscountDetailWebController extends GetxController
    with WebSignalHandler, DiscountDetailsMixin {
  final DiscountDetailRepository repository;

  DiscountDetailWebController(this.repository);

  late IFrameElement? iFrameElement;
  late StreamSubscription? listener;
  late String viewId;
  late String title;

  @override
  void onInit() {
    super.onInit();
    _listener();
    viewId = 'discount-detail-page#${Get.parameters['url'].hashCode}';
    title = Get.parameters['title'] ?? '';
    ui.platformViewRegistry.registerViewFactory(viewId, (int viewId) {
      IFrameElement element = IFrameElement();
      element.style.border = 'none';
      element.src = Get.parameters['url'] ?? "";
      iFrameElement = element;
      return element;
    });
  }

  void _listener() {
    listener = window.onMessage.listen((event) {
      final msg = event.data['msg'];
      if (msg.contains(WebUtil.scheme)) {
        jumpToPage(msg);
      }
    });
  }

  @override
  void jumpToPage(String page) {
    super.jumpToPage(page);

    if (page == WebUtil.sharingLink) {
      showPoster(); // 分享
    }
  }

  @override
  void onClose() {
    super.onClose();
    listener?.cancel();
  }
}
